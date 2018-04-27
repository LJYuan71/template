package tk.ljyuan71.permissions.zbgc.dao;
import tk.ljyuan71.permissions.zbgc.model.ZBGongCheng;

import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface ZBGongChengDao {
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
	List<ZBGongCheng> queryAll(Map<String, Object> filter);
	/**
	 * 获取总记录条数
	 */
	Integer queryTotal(Map<String, Object> filter);
}