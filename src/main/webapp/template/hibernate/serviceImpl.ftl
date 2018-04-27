<#import "function.ftl" as func>
<#if path??>
<#else>
package ${domainsuf}.${system}.${modular}.${packagename}.service.impl;
import ${domainsuf}.${system}.${modular}.${packagename}.model.${modelname};
import ${domainsuf}.${system}.${modular}.${packagename}.dao.impl.${modelname}DaoImpl;
</#if>

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.UUID;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhulong.common.hibernate.BaseServiceImpl;
import com.zhulong.common.hibernate.BaseService;
import com.zhulong.common.page.Pagination;
import com.zhulong.jiaoyi.util.OperateUtil;
import com.zhulong.jiaoyi.util.QueryFilter;
import com.zhulong.jiaoyi.vo.common.CurrentUser;
<#list model.columnList as col>
    <#if (col.isPK) >
	<#assign pkColName=func.convertUnderLine(col.columnName)>
  	<#break>
	<#else>
		<#assign pkColName='guid'>
	</#if>
</#list>
@Service("${modelname?uncap_first}Service")
public class ${modelname}ServiceImpl extends BaseServiceImpl<${modelname},String> implements ${modelname}Service {

	@Autowired
	public ${modelname}ServiceImpl(${modelname}DaoImpl dao) {
		super(dao);
	}
	
	@Autowired
	private ${modelname}DaoImpl ${modelname?uncap_first}Dao;
	
	@Override
	public Pagination queryAll(QueryFilter filter) {
		Pagination pagination = ${modelname?uncap_first}Dao.queryAll(filter);
		//其他业务
		return pagination;
	}
	
	@Override
	public Map<String, Object> insert(${modelname} bean, CurrentUser currentUser) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isSave = false;
		boolean flag = false;
		if(bean != null){
			if(StringUtils.isBlank(bean.get${pkColName?cap_first}()){//新增
				isSave = true;
				bean.set${pkColName?cap_first}(UUID.randomUUID().toString());
				bean.setCreateTime(System.currentTimeMillis());
				bean.setCreatorName(currentUser.getUserName());
				bean.setCreatorGuid(currentUser.getUserGuid());
				bean.setIsDeleted(false);
			}else{//修改
				bean.setModifyTime(System.currentTimeMillis());
				bean.setModifyerName(currentUser.getUserName());
			}
			if(isSave){
				bean = this.save(bean);
			}else{
				bean = this.update(bean);
			}
			map.put("message", "保存成功");
			flag = true;
		}else{
			map.put("code", "500");
			map.put("message", "表单提交失败");
		}
		OperateUtil.initMap(map,flag,bean.getGuid());
		return map;
	}
	
	@Override
	public ${modelname} queryById(String guid) {
		${modelname} bean = this.findById(guid);
		//其他业务
		return bean;
	}
	
	@Override
	public Map<String, Object> actions(String guid, String actionName,
			CurrentUser user) {
		Map<String, Object> map = new HashMap<String, Object>();
		${modelname} bean = null;
		map.put("code", "500");
		boolean flag = false;
		if(StringUtils.isNotBlank(guid)){
			bean = this.findById(guid);
			if(bean != null){//判断操作名称
				if(StringUtils.isNotBlank(actionName)){
					bean.setModifyTime(System.currentTimeMillis());
					bean.setModifyerName(user.getUserName());
					if("sc".equals(actionName)){//删除
						if(!"2".equals(bean.getZhuangTai().toString())){
							bean.setIsDeleted(true);
							this.update(bean);
							map.put("code", "200");
							map.put("message", "删除成功");
							flag = true;
						}else{
							map.put("message", "该状态不可删除");
						}
					}else if("sx".equals(actionName)){//失效
						//
					}else{
						map.put("message", "不支持该项操作");
					}
				}else{
						map.put("message", "获取不到操作类型");
				}
			}else{
				map.put("message", "获取不到对象信息，无法操作");
			}
		}else{
			map.put("message", "获取不到id信息，无法操作");
		}
		OperateUtil.initMap(map,flag,guid);
		return map;
	}

}