package tk.ljyuan71.permissions.templateentity.controller;
import tk.ljyuan71.permissions.templateentity.model.TemplateEntity;
import tk.ljyuan71.permissions.templateentity.service.TemplateEntityService;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;
import tk.ljyuan71.utils.RequestUtil;

@Controller
@RequestMapping("/permissions/templateentity")
public class TemplateEntityController {

	@Autowired
	private TemplateEntityService templateEntityService;
	
	/**
	 * 分页查询数据
	 */
	@RequestMapping("/queryAllJson")
	@ResponseBody
    public Map<String, Object> queryAllJson(HttpServletRequest request, HttpServletResponse response) {
		QueryFilter queryFilter=new QueryFilter(request, true);
		Pager<TemplateEntity> pager = templateEntityService.queryAll(queryFilter);
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
    public Map<String, Object> save(TemplateEntity obj){
    	return templateEntityService.insert(obj);
    }
	
	/**
     * 根据id查询
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Map<String, Object> queryById(String id){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("bean", templateEntityService.getById(id));
    	return map;
    }
    
	/**
	 * 根据id进行的操作
	 */
	@RequestMapping("/action")
	@ResponseBody
	public Map<String, Object> actions(String id,String actionName) {
		return templateEntityService.actions(id, actionName);
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
		TemplateEntity templateEntity = null;
		if (StringUtils.isNotBlank(id) && !"undefined".equals(id)) {
			templateEntity = templateEntityService.getById(id);
		}
		if(templateEntity == null){
			//添加页面
			flag="add";
			templateEntity = new TemplateEntity();
			//templateEntity.setId(GenidUtil.genId());
		}else {
			//修改页面
			flag="update";
		}
		ModelAndView mv = RequestUtil.getAutoView(request);
		mv.addObject("templateEntity", templateEntity).addObject("flag", flag);
		return mv;
	}
	/**
	 * 进入查看页
	 */
	@RequestMapping("/view")
	public ModelAndView get(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		TemplateEntity templateEntity = templateEntityService.getById(id);
		ModelAndView mv = RequestUtil.getAutoView(request);
		mv.addObject("templateEntity", templateEntity);
		return mv;
	}
}