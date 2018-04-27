package tk.ljyuan71.permissions.sysdict.dao;
import tk.ljyuan71.permissions.sysdict.model.SysDict;

import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface SysDictDao {
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
	List<SysDict> queryAll(Map<String, Object> filter);
	/**
	 * 获取总记录条数
	 */
	Integer queryTotal(Map<String, Object> filter);
	/**
	 * 获取最简单的数据字典
	 */
	List<SysDict> queryAllSimple(Map<String, Object> filter);
}