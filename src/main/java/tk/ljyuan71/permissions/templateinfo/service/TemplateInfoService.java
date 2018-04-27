package tk.ljyuan71.permissions.templateinfo.service;
import tk.ljyuan71.permissions.templateinfo.model.TemplateInfo;

import java.util.Map;
import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;

public interface  TemplateInfoService {
	/**
	 * 添加
	 */
	boolean add(TemplateInfo obj);
	/**
	 * 修改
	 */
	boolean update(TemplateInfo obj);
	/**
	 * 根据id获取
	 */
	TemplateInfo getById(String id);
	/**
	 * 根据id删除
	 */
	boolean delById(String id);
	/**
	 * 查询列表 排序id asc
	 */
	public Pager<TemplateInfo> queryAll(QueryFilter queryFilter);
	
	/**
	 * 新增或者修改记录
	 */
	public Map<String, Object> insert(TemplateInfo obj);
	/**
	 * 根据id进行的操作
	 * @param actionName 操作名称拼音字母首字
	 */
	public Map<String, Object> actions(String guid, String actionName);
}