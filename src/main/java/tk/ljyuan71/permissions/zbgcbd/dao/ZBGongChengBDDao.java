package tk.ljyuan71.permissions.zbgcbd.dao;
import tk.ljyuan71.permissions.zbgcbd.model.ZBGongChengBD;

import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface ZBGongChengBDDao {
	/**
	 * 添加
	 */
	boolean add(ZBGongChengBD obj);
	/**
	 * 修改
	 */
	boolean update(ZBGongChengBD obj);
	/**
	 * 根据id获取
	 */
	ZBGongChengBD getById(String id);
	/**
	 * 根据id删除
	 */
	boolean delById(String id);
	/**
	 * 查询列表 排序id asc
	 */
	List<ZBGongChengBD> queryAll(Map<String, Object> filter);
	/**
	 * 获取总记录条数
	 */
	Integer queryTotal(Map<String, Object> filter);
}