package tk.ljyuan71.permissions.zbxiangmu.service;
import tk.ljyuan71.permissions.zbxiangmu.model.ZBXiangMu;

import java.util.Map;
import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;

public interface  ZBXiangMuService {
	/**
	 * 添加
	 */
	boolean add(ZBXiangMu obj);
	/**
	 * 修改
	 */
	boolean update(ZBXiangMu obj);
	/**
	 * 根据id获取
	 */
	ZBXiangMu getById(String id);
	/**
	 * 根据id删除
	 */
	boolean delById(String id);
	/**
	 * 查询列表 排序id asc
	 */
	public Pager<ZBXiangMu> queryAll(QueryFilter queryFilter);
	
	/**
	 * 新增或者修改记录
	 */
	public Map<String, Object> insert(ZBXiangMu obj);
	/**
	 * 根据id进行的操作
	 * @param actionName 操作名称拼音字母首字
	 */
	public Map<String, Object> actions(String guid, String actionName);
}