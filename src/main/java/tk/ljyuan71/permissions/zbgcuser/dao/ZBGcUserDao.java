package tk.ljyuan71.permissions.zbgcuser.dao;
import tk.ljyuan71.permissions.zbgcuser.model.ZBGcUser;

import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface ZBGcUserDao {
	/**
	 * 添加
	 */
	boolean add(ZBGcUser obj);
	/**
	 * 修改
	 */
	boolean update(ZBGcUser obj);
	/**
	 * 根据id获取
	 */
	ZBGcUser getById(String id);
	/**
	 * 根据id删除
	 */
	boolean delById(String id);
	/**
	 * 查询列表 排序id asc
	 */
	List<ZBGcUser> queryAll(Map<String, Object> filter);
	/**
	 * 获取总记录条数
	 */
	Integer queryTotal(Map<String, Object> filter);
}