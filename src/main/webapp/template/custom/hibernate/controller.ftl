<#import "function.ftl" as func>
<#if path??>
<#else>
package ${domainsuf}.${system}.${modular}.${packagename}.controller;
import ${domainsuf}.${system}.${modular}.${packagename}.model.${modelname};
import ${domainsuf}.${system}.${modular}.${packagename}.service.${modelname}Service;
</#if>

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.zhulong.common.page.Pagination;
import com.zhulong.jiaoyi.util.OperateUtil;
import com.zhulong.jiaoyi.util.QueryFilter;
import com.zhulong.security.context.ZhuLongContext;


@Controller
@RequestMapping("/${modular}/${packagename}")
public class ${modelname}Controller {

	@Reference(interfaceClass = ${modelname}Service.class)
	private ${modelname}Service ${modelname?uncap_first}Service;
	
	/**
	 * 分页查询数据
	 */
	@RequestMapping("/queryAllJson")
	@ResponseBody
    public Map<String, Object> queryAllJson(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		QueryFilter filter = new QueryFilter(request, true);
		Pagination pagination = ${modelname?uncap_first}Service.queryAll(filter);
		map.put("total", pagination.getTotalCount());
		map.put("rows", pagination.getList());
    	return map;
    }
    
    /**
     * 保存或确认其他会议室预约
     */
    @RequestMapping("/save")
    @ResponseBody
    public Map<String, Object> save(${modelname} bean){
    	return ${modelname?uncap_first}Service.insert(bean, ZhuLongContext.getCurrentUser());
    }
	
	/**
     * 根据id查询
     * @author ljyuan 2017年12月22日
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Map<String, Object> queryById(String id){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("bean", ${modelname?uncap_first}Service.queryById(id));
    	OperateUtil.initMap(map,true,id);
    	return map;
    }
    
	/**
	 * 根据id进行的操作
	 * @author ljyuan 2017年12月22日
	 */
	@RequestMapping("/action")
	@ResponseBody
	public Map<String, Object> actions(String guid,String actionName) {
		return ${modelname?uncap_first}Service.actions(guid, actionName ,ZhuLongContext.getCurrentUser());
	}
}