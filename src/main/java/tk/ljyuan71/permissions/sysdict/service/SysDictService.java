package tk.ljyuan71.permissions.sysdict.service;
import tk.ljyuan71.permissions.sysdict.model.SysDict;

import java.util.List;
import java.util.Map;

import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;

public interface  SysDictService {
	/**
	 * 添加
	 */
	boolean add(SysDict obj);
	/**
	 * 修改
	 */
	boolean update(SysDict obj);
	/**
	 * 根据id获取
	 */
	SysDict getById(String id);
	/**
	 * 根据id删除
	 */
	boolean delById(String id);
	/**
	 * 查询列表 排序id asc
	 */
	public Pager<SysDict> queryAll(QueryFilter queryFilter);
	
	/**
	 * 新增或者修改记录
	 */
	public Map<String, Object> insert(SysDict obj);
	/**
	 * 根据id进行的操作
	 * @param actionName 操作名称拼音字母首字
	 */
	public Map<String, Object> actions(String guid, String actionName);
	
	/**
	 * 获取最简单的数据字典
	 */
	List<SysDict> queryAllSimple(Map<String, Object> filter);
}