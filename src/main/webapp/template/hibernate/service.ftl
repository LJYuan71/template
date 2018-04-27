<#import "function.ftl" as func>
<#if path??>
<#else>
package ${domainsuf}.${system}.${modular}.${packagename}.service;
import ${domainsuf}.${system}.${modular}.${packagename}.model.${modelname};
</#if>

import java.util.List;
import java.util.Map;

import com.zhulong.common.hibernate.BaseService;
import com.zhulong.common.page.Pagination;
import com.zhulong.jiaoyi.util.QueryFilter;
import com.zhulong.jiaoyi.vo.common.CurrentUser;

public interface ${modelname}Service extends BaseService<${modelname},String> {
	/**
	 * 分页/不分页查询数据
	 */
	public Pagination queryAll(QueryFilter filter);
	/**
	 * 保存/修改或确认信息
	 */
	public Map<String, Object> insert(${modelname} bean, CurrentUser user);
	/**
	 * 根据id查询记录
	 */
	public ${modelname} queryById(String guid);
	
	/**
	 * 根据id进行的操作
	 * @param actionName 操作名称拼音字母首字
	 */
	public Map<String, Object> actions(String guid, String actionName, CurrentUser user);

}