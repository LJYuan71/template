package tk.ljyuan71.permissions.zbgc.service;
import tk.ljyuan71.permissions.zbgc.model.ZBGongCheng;

import java.util.Map;
import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;

public interface  ZBGongChengService {
	/**
	 * 添加
	 */
	boolean add(ZBGongCheng obj);
	/**
	 * 修改
	 */
	boolean update(ZBGongCheng obj);
	/**
	 * 根据id获取
	 */
	ZBGongCheng getById(String id);
	/**
	 * 根据id删除
	 */
	boolean delById(String id);
	/**
	 * 查询列表 排序id asc
	 */
	public Pager<ZBGongCheng> queryAll(QueryFilter queryFilter);
	
	/**
	 * 新增或者修改记录
	 */
	public Map<String, Object> insert(ZBGongCheng obj);
	/**
	 * 根据id进行的操作
	 * @param actionName 操作名称拼音字母首字
	 */
	public Map<String, Object> actions(String guid, String actionName);
}