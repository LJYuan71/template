package tk.ljyuan71.permissions.zbdl.service;
import tk.ljyuan71.permissions.zbdl.model.ZBGcZbdl;

import java.util.Map;
import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;

public interface  ZBGcZbdlService {
	/**
	 * 添加
	 */
	boolean add(ZBGcZbdl obj);
	/**
	 * 修改
	 */
	boolean update(ZBGcZbdl obj);
	/**
	 * 根据id获取
	 */
	ZBGcZbdl getById(String id);
	/**
	 * 根据id删除
	 */
	boolean delById(String id);
	/**
	 * 查询列表 排序id asc
	 */
	public Pager<ZBGcZbdl> queryAll(QueryFilter queryFilter);
	
	/**
	 * 新增或者修改记录
	 */
	public Map<String, Object> insert(ZBGcZbdl obj);
	/**
	 * 根据id进行的操作
	 * @param actionName 操作名称拼音字母首字
	 */
	public Map<String, Object> actions(String guid, String actionName);
}