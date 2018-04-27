package tk.ljyuan71.permissions.templateinfo.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import tk.ljyuan71.permissions.templateinfo.model.TemplateInfo;
import tk.ljyuan71.permissions.templateinfo.service.TemplateInfoService;
import tk.ljyuan71.permissions.templatentityvar.service.TemplatEntityVarService;
import tk.ljyuan71.permissions.zbdl.model.ZBGcZbdl;
import tk.ljyuan71.permissions.zbdl.service.ZBGcZbdlService;
import tk.ljyuan71.permissions.zbgc.model.ZBGongCheng;
import tk.ljyuan71.permissions.zbgc.service.ZBGongChengService;
import tk.ljyuan71.permissions.zbgcbd.model.ZBGongChengBD;
import tk.ljyuan71.permissions.zbgcbd.service.ZBGongChengBDService;
import tk.ljyuan71.permissions.zbxiangmu.model.ZBXiangMu;
import tk.ljyuan71.permissions.zbxiangmu.service.ZBXiangMuService;
import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;
import tk.ljyuan71.utils.RequestUtil;

@Controller
@RequestMapping("/permissions/templateinfo")
public class TemplateInfoController {

	@Autowired
	private TemplateInfoService templateInfoService;
	@Autowired
	private ZBGongChengService zBGongChengService;
	@Autowired
	private ZBGongChengBDService zBGongChengBDService;
	@Autowired
	private TemplatEntityVarService templatEntityVarService;
	@Autowired
	private ZBXiangMuService zBXiangMuService;
	@Autowired
	private ZBGcZbdlService zBGcZbdlService;
	/**
	 * 分页查询数据
	 */
	@RequestMapping("/queryAllJson")
	@ResponseBody
    public Map<String, Object> queryAllJson(HttpServletRequest request, HttpServletResponse response) {
		QueryFilter queryFilter=new QueryFilter(request, true);
		Pager<TemplateInfo> pager = templateInfoService.queryAll(queryFilter);
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
    public Map<String, Object> save(TemplateInfo obj){
    	return templateInfoService.insert(obj);
    }
	
	/**
     * 根据id查询
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Map<String, Object> queryById(String id){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("bean", templateInfoService.getById(id));
    	return map;
    }
    
	/**
	 * 根据id进行的操作
	 */
	@RequestMapping("/action")
	@ResponseBody
	public Map<String, Object> actions(String id,String actionName) {
		return templateInfoService.actions(id, actionName);
	}
	/**
	 * 模板变量替换
	 * @author ljyuan 2018年4月26日
	 */
	@RequestMapping("/replaceVar")
	@ResponseBody
	public Map<String, Object> replaceVar(HttpServletRequest request, HttpServletResponse response, String templateContent){
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isBlank(templateContent)){
			map.put("code", 500);
			map.put("message", "模板内容不能为空");
			return map;
		}
		String gcGuid = request.getParameter("gcGuid");
		String bdGuid = request.getParameter("bdGuid");
		Map<String,Object> paramMap = new HashMap<String,Object>();
		if(StringUtils.isNotBlank(gcGuid)){
			ZBGongCheng gc = zBGongChengService.getById(gcGuid);
			if(gc != null){
				paramMap.put(gc.getClass().getName(), gc);//实体类型的参数
				ZBXiangMu xm = zBXiangMuService.getById(gc.getXmGuid());
				if(xm != null){
					paramMap.put(xm.getClass().getName(), xm);
				}
				ZBGcZbdl zbdl = zBGcZbdlService.getById(gc.getZbdlGuid());
				if(zbdl != null){
					paramMap.put(zbdl.getClass().getName(), zbdl);
				}
				
			}
		}
		if(StringUtils.isNotBlank(bdGuid)){
			ZBGongChengBD bd = zBGongChengBDService.getById(bdGuid);
			if(bd != null){
				paramMap.put(bd.getClass().getName(), bd);//实体类型的参数
			}
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:ss");
		paramMap.put("落款日期", sdf.format(new Date(System.currentTimeMillis())));//直接参数
		String content = templatEntityVarService.replaceContentVar(templateContent, paramMap);
		map.put("content", content);
		map.put("code", 200);
		return map;
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
		TemplateInfo templateInfo = null;
		if (StringUtils.isNotBlank(id) && !"undefined".equals(id)) {
			templateInfo = templateInfoService.getById(id);
		}
		if(templateInfo == null){
			//添加页面
			flag="add";
			templateInfo = new TemplateInfo();
			//templateInfo.setId(GenidUtil.genId());
		}else {
			//修改页面
			flag="update";
		}
		ModelAndView mv = RequestUtil.getAutoView(request);
		mv.addObject("templateInfo", templateInfo).addObject("flag", flag);
		return mv;
	}
	/**
	 * 进入查看页
	 */
	@RequestMapping("/view")
	public ModelAndView get(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		TemplateInfo templateInfo = templateInfoService.getById(id);
		ModelAndView mv = RequestUtil.getAutoView(request);
		mv.addObject("templateInfo", templateInfo);
		return mv;
	}
}