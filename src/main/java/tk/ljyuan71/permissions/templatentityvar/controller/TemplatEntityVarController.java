package tk.ljyuan71.permissions.templatentityvar.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tk.ljyuan71.permissions.templatentityvar.model.TemplatEntityVar;
import tk.ljyuan71.permissions.templatentityvar.service.TemplatEntityVarService;
import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;
import tk.ljyuan71.utils.RequestUtil;

@Controller
@RequestMapping("/permissions/templatentityvar")
public class TemplatEntityVarController {

	@Autowired
	private TemplatEntityVarService templatEntityVarService;
	
	/**
	 * 分页查询数据
	 */
	@RequestMapping("/queryAllJson")
	@ResponseBody
    public Map<String, Object> queryAllJson(HttpServletRequest request, HttpServletResponse response) {
		QueryFilter queryFilter=new QueryFilter(request, true);
		Pager<TemplatEntityVar> pager = templatEntityVarService.queryAll(queryFilter);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", pager.getDataList()); //这里的 rows 和total 的key 是固定的 
		map.put("total", pager.getCount());
		return map;
    }
    
    /**
     * 保存或更新
     */
    @RequestMapping("/save")
    @ResponseBody
    public Map<String, Object> save(TemplatEntityVar obj){
    	return templatEntityVarService.insert(obj);
    }
	
	/**
     * 根据id查询
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Map<String, Object> queryById(String id){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("bean", templatEntityVarService.getById(id));
    	return map;
    }
    
	/**
	 * 根据id进行的操作
	 */
	@RequestMapping("/action")
	@ResponseBody
	public Map<String, Object> actions(String guid,String actionName) {
		return templatEntityVarService.actions(guid, actionName);
	}
	
	/**
	 * 复制变量到其他事项
	 */
	@RequestMapping("/copyvar")
	@ResponseBody
	public Map<String, Object> copyvar(String copyGuid,String toMatterId) {
		return templatEntityVarService.copyvar(copyGuid, toMatterId);
	}
	/**
	 * 进入列表页
	 */
	@RequestMapping("/list")
	public ModelAndView queryAll(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mv = RequestUtil.getAutoView(request);
		return mv;
	}
	/**
	 * 进入添加/编辑页
	 */
	@RequestMapping("/edit")
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String flag = "";
		String id = request.getParameter("id");
		TemplatEntityVar templatEntityVar = null;
		if (StringUtils.isNotBlank(id) && !"undefined".equals(id)) {
			templatEntityVar = templatEntityVarService.getById(id);
		}
		if(templatEntityVar == null){
			//添加页面
			flag="add";
			templatEntityVar = new TemplatEntityVar();
			//templatEntityVar.setId(GenidUtil.genId());
		}else {
			//修改页面
			flag="update";
		}
		ModelAndView mv = RequestUtil.getAutoView(request);
		mv.addObject("templatEntityVar", templatEntityVar).addObject("flag", flag);
		return mv;
	}
	/**
	 * 进入查看页
	 */
	@RequestMapping("/view")
	public ModelAndView get(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		TemplatEntityVar templatEntityVar=(TemplatEntityVar) templatEntityVarService.getById(id);
		ModelAndView mv = RequestUtil.getAutoView(request);
		mv.addObject("templatEntityVar", templatEntityVar);
		return mv;
	}
}