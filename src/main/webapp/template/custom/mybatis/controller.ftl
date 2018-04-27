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
import org.springframework.beans.factory.annotation.Autowired;

import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;


@Controller
@RequestMapping("/${modular}/${packagename}")
public class ${modelname}Controller {

	@Autowired
	private ${modelname}Service ${modelname?uncap_first}Service;
	
	/**
	 * 分页查询数据
	 */
	@RequestMapping("/queryAllJson")
	@ResponseBody
    public Map<String, Object> queryAllJson(HttpServletRequest request, HttpServletResponse response) {
		QueryFilter queryFilter=new QueryFilter(request, true);
		Pager<${modelname}> pager = ${modelname?uncap_first}Service.queryAll(queryFilter);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", pager.getDataList()); //这里的 rows 和total 的key 是固定的 
		map.put("count", pager.getCount());
		map.put("code", 0);
		map.put("msg", "成功");
		return map;
    }
    
    /**
     * 保存或更新
     */
    @RequestMapping("/save")
    @ResponseBody
    public Map<String, Object> save(${modelname} obj){
    	return ${modelname?uncap_first}Service.insert(obj);
    }
	
	/**
     * 根据id查询
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Map<String, Object> queryById(String id){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("bean", ${modelname?uncap_first}Service.getById(id));
    	return map;
    }
    
	/**
	 * 根据id进行的操作
	 */
	@RequestMapping("/action")
	@ResponseBody
	public Map<String, Object> actions(String guid,String actionName) {
		return ${modelname?uncap_first}Service.actions(guid, actionName);
	}
}