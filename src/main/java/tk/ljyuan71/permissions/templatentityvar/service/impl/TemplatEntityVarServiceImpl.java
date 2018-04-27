package tk.ljyuan71.permissions.templatentityvar.service.impl;
import java.io.StringReader;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.ljyuan71.permissions.templatentityvar.dao.TemplatEntityVarDao;
import tk.ljyuan71.permissions.templatentityvar.model.TemplatEntityVar;
import tk.ljyuan71.permissions.templatentityvar.service.TemplatEntityVarService;
import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;

import com.github.pagehelper.PageHelper;

import freemarker.template.Configuration;
import freemarker.template.Template;

@Service("templatEntityVarService")
public class TemplatEntityVarServiceImpl implements TemplatEntityVarService{
	@Autowired
	private TemplatEntityVarDao templatEntityVarDao;
	
	/**
	 * 添加
	 */
	@Override
	public boolean add(TemplatEntityVar obj) {
		return templatEntityVarDao.add(obj);
	}
	/**
	 * 修改
	 */	
	@Override
	public boolean update(TemplatEntityVar obj) {
		return templatEntityVarDao.update(obj);
	}
	/**
	 * 根据id获取
	 */
	@Override
	public TemplatEntityVar getById(String id) {
		return (TemplatEntityVar) templatEntityVarDao.getById(id);
	}
	/**
	 * 根据id删除
	 */	
	@Override
	public boolean delById(String id) {
		return templatEntityVarDao.delById(id);
	}
	/**
	 * 查询列表
	 * needPage 是否分页
	 * orderField	排序		id asc
	 */
	public Pager<TemplatEntityVar> queryAll(QueryFilter queryFilter) {
		Map<String, Object> paramMap = queryFilter.getFilters();
		Pager<TemplatEntityVar> rePager = new Pager<TemplatEntityVar>();
		if (queryFilter.isNeedPage()) {
			//分页
			Pager<TemplatEntityVar> pager = queryFilter.getPager();
			//分页插件
			PageHelper.offsetPage(pager.getOffset(), pager.getLimit());
			List<TemplatEntityVar> list = templatEntityVarDao.queryAll(paramMap);
			Integer total = templatEntityVarDao.queryTotal(paramMap);
			rePager.setDataList(list);
			rePager.setCount(total);
		} else {
			//不分页
			List<TemplatEntityVar> list = templatEntityVarDao.queryAll(paramMap);
			rePager.setDataList(list);
		}
		return rePager;
	}
	
	/**
	 * 新增或者修改记录
	 */
	public Map<String, Object> insert(TemplatEntityVar obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isSave = false;
		boolean flag = false;
		map.put("code", 500);
		if(obj != null){
			if(StringUtils.isBlank(obj.getGuid())){//新增
				isSave = true;
				obj.setGuid(UUID.randomUUID().toString());
				//obj.setCreateTime(System.currentTimeMillis());
				//obj.setCreatorName(currentUser.getUserName());
				//obj.setCreatorGuid(currentUser.getUserGuid());
				obj.setIsDeleted(false);
			}else{//修改
				//obj.setModifyTime(System.currentTimeMillis());
				//obj.setModifyerName(currentUser.getUserName());
			}
			if(isSave){
				if (existEntityVar(obj)) {
					map.put("message", "目标对象已存在");
				} else {
					this.add(obj);
					flag = true;
				}
			}else{
				this.update(obj);
				flag = true;
			}
			if (flag) {
				map.put("code", 200);
				map.put("message", "保存成功");
			}
		}else{
			map.put("message", "表单提交失败");
		}
		return map;
	}
	
	@Override
	public Map<String, Object> actions(String guid, String actionName) {
		Map<String, Object> map = new HashMap<String, Object>();
		TemplatEntityVar bean = null;
		map.put("code", 500);
		boolean flag = false;
		if(StringUtils.isNotBlank(guid)){
			bean = this.getById(guid);
			if(bean != null){//判断操作名称
				if(StringUtils.isNotBlank(actionName)){
					//bean.setModifyTime(System.currentTimeMillis());
					//bean.setModifyerName(user.getUserName());
					if("sc".equals(actionName)){//删除
						//
						bean.setIsDeleted(true);
						this.update(bean);
						map.put("message", "删除成功");
						flag = true;
					}else if("sx".equals(actionName)){//失效
						//
						flag = true;
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
		if (flag) {
			map.put("code", 200);
		}
		return map;
	}
	/* (non-Javadoc)
	 * @see tk.ljyuan71.permissions.templatentityvar.service.TemplatEntityVarService#copyvar(java.lang.String, java.lang.String)
	 */
	@Override
	public Map<String, Object> copyvar(String copyGuid, String toMatterId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 500);
		TemplatEntityVar bean = this.getById(copyGuid);
		if (bean != null) {
				TemplatEntityVar newVar = bean.clone();
				newVar.setGuid(UUID.randomUUID().toString());
				newVar.setMatterId(toMatterId);
			if (existEntityVar(newVar)) {
				map.put("message", "目标对象中已存在相同数据");
			} else {
				this.add(newVar);
				map.put("code", 200);
				map.put("message", "复制成功");
			}
		} else {
			map.put("message", "获取不到对象信息，无法操作");
		}
		return map;
	}
	/* (non-Javadoc)
	 * @see tk.ljyuan71.permissions.templatentityvar.service.TemplatEntityVarService#existEntityVar(tk.ljyuan71.permissions.templatentityvar.model.TemplatEntityVar)
	 */
	@Override
	public boolean existEntityVar(TemplatEntityVar obj) {
		QueryFilter queryFilter = new QueryFilter();
		Map<String, Object> queryMap = queryFilter.getFilters();
		queryMap.put("matterIdEquals", obj.getMatterId());
		queryMap.put("entityIdEquals", obj.getEntityId());
		queryMap.put("attrNameEquals", obj.getAttrName());
		List<TemplatEntityVar> list = this.queryAll(queryFilter).getDataList();
		if (list != null && !list.isEmpty()) {
			return true;
		}
		return false;
	}
	/* (non-Javadoc)
	 * @see tk.ljyuan71.permissions.templatentityvar.service.TemplatEntityVarService#replaceContentVar(java.lang.String, java.util.Map)
	 */
	@Override
	public String replaceContentVar(String templateContent,
			Map<String, Object> paramMap) {
		//获取内容中所有以 "#{"开头并且以"}"结尾的内容
		Set<String> likeVarSet = getLikeVar(templateContent);
		//获取变量对应的TemplatEntityVar
		List<TemplatEntityVar> tevs = getTemplateEntity(likeVarSet,paramMap.keySet());
		//处理模板变量,最终返回需要的变量及其对应的值
		Map<String, Object> var = handleTemplateVar(likeVarSet, tevs, paramMap);
		/*StringWriter result = new StringWriter(); 
		Configuration cfg = new Configuration(); 
		cfg.setClassicCompatible(true);//null替换为空字符串
		Template t;
		try {
			t = new Template("muban", new StringReader(templateContent), cfg);
			t.process(var, result);  
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		//替换变量
		for(Entry<String, Object> entry : var.entrySet()){
			String key = entry.getKey();
			String replaceValue = entry.getValue().toString();
			templateContent = templateContent.replaceAll("\\$\\{"+key+"\\}", replaceValue);
		}
		return templateContent;
	}
	
	/**
	 * 处理模板变量,最终返回需要的变量及其对应的值
	 * @author ljyuan 2018年4月26日
	 */
	private Map<String, Object> handleTemplateVar(Set<String> likeVarSet,
			List<TemplatEntityVar> tevs, Map<String, Object> paramMap) {
		Map<String, Object> var = new HashMap<String, Object>();
		for (String likeVar : likeVarSet) {//模板中存在的变量
			paramEntry:for (Map.Entry<String, Object> entryMap : paramMap.entrySet()) {
				if(likeVar.equalsIgnoreCase(entryMap.getKey())){//优先设置主动设置的值,key-value
					var.put(likeVar, entryMap.getValue());
					break paramEntry;
				} else {//key-实体
					for (TemplatEntityVar tev : tevs) {
						if (likeVar.equals(tev.getAttrComment())) {
							if(tev.getTemplateEntity() != null){
								Object obj = paramMap.get(tev.getTemplateEntity().getEntityFullPath());
								Class clazz = obj.getClass();
								Method method;
								try {
									method = clazz.getMethod("get"+tev.getAttrName().substring(0,1).toUpperCase()+tev.getAttrName().substring(1));
									Object objValue = method.invoke(obj);//通过反射获取实体对象的属性值
									if (objValue != null && StringUtils.isNotBlank(objValue.toString())) {
										var.put(likeVar, handleVarType(objValue,tev.getType(),tev.getTypeStyle()));//通过类型和类型的方式获取值
									} else {//为空时设置默认值
										String defaultVar = tev.getDefaultVar();
										var.put(likeVar, defaultVar == null ? "" : defaultVar);
									}
								} catch (NoSuchMethodException e) {
									e.printStackTrace();
								} catch (IllegalAccessException e) {
									e.printStackTrace();
								} catch (IllegalArgumentException e) {
									e.printStackTrace();
								} catch (InvocationTargetException e) {
									e.printStackTrace();
								}
								break paramEntry;
							}
						}
					}
					break paramEntry;
				}
			}
		}
		return var;
	}
	
	/**
	 * 通过类型和类型的方式对值处理
	 * @author ljyuan 2018年4月27日
	 * @param var 待处理值
	 * @param type 值的类型：金额，时间等
	 * @param typeStyle 值输出的格式：yyyy-MM-dd等
	 * @return
	 */
	private Object handleVarType(Object var, String type, String typeStyle) {
		//缺一不可
		if (var == null || StringUtils.isBlank(var.toString()) || StringUtils.isBlank(type) || StringUtils.isBlank(typeStyle)) {
			return var;
		} else {
			SimpleDateFormat sdf = null;
			ScriptEngine js = null;
			try {
				if("Eval".equalsIgnoreCase(type)){
					String expression = typeStyle.replaceAll("N", var.toString());
					Object o;
					js = new ScriptEngineManager().getEngineByName("JavaScript");
					o = js.eval(expression);
					NumberFormat nf = new DecimalFormat("#.##");
					var = nf.format(o);
				} else if("LongTime".equalsIgnoreCase(type)){
					sdf = new SimpleDateFormat(typeStyle);
					var = sdf.format(new Date(Long.valueOf(var.toString())));
				} else if("Date".equalsIgnoreCase(type)){
					sdf = new SimpleDateFormat(typeStyle);
					var = sdf.format((Date)var);
				} else if("Money".equalsIgnoreCase(type)){
					NumberFormat nf = new DecimalFormat(typeStyle);
					var = nf.format(var);
				}
			} catch (Exception e) {
				System.err.println(var.toString()+"的"+type+"类型使用"+typeStyle+"格式赋值出现异常");
				e.printStackTrace();
				return "";
			}
			return var;
		}
	}
	/**
	 * 获取变量对应的TemplatEntityVar
	 * @author ljyuan 2018年4月26日
	 */
	private List<TemplatEntityVar> getTemplateEntity(Set<String> likeVarSet,
			Set<String> keySet) {
		QueryFilter queryFilter = new QueryFilter();
		Map<String, Object> map  = queryFilter.getFilters();
		map.put("attrNames", likeVarSet);
		List<TemplatEntityVar> tevs = new ArrayList<TemplatEntityVar>();
		for (String key : keySet) {
			if(key.indexOf(".") != -1){//对应值为实体类型
				map.put("entityFullPath", key);
				tevs.addAll(this.queryAll(queryFilter).getDataList());
			}
		}
		return tevs;
	}
	/**
	 * 获取模板内容中所有以 "${"开头并且以"}"结尾的内容
	 * @author ljyuan 2018年4月26日
	 */
	public Set<String> getLikeVar(String templateContent){
		Set<String> likeVarSet = new HashSet<String>();
		Pattern pattern = Pattern.compile("\\$\\{([^\\}]+)\\}");
		Matcher m = pattern.matcher(templateContent);
		while(m.find()){
			String likeVar = m.group(1);
			if(StringUtils.isNotEmpty(likeVar)){
				likeVarSet.add(likeVar.replaceAll("!", ""));
			}
		}
		return likeVarSet;
	}
}