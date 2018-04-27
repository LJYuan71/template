package tk.ljyuan71.permissions.zbdl.dao;
import tk.ljyuan71.permissions.zbdl.model.ZBGcZbdl;

import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface ZBGcZbdlDao {
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
	List<ZBGcZbdl> queryAll(Map<String, Object> filter);
	/**
	 * 获取总记录条数
	 */
	Integer queryTotal(Map<String, Object> filter);
}