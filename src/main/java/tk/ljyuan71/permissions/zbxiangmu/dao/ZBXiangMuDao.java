package tk.ljyuan71.permissions.zbxiangmu.dao;
import tk.ljyuan71.permissions.zbxiangmu.model.ZBXiangMu;

import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface ZBXiangMuDao {
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
	List<ZBXiangMu> queryAll(Map<String, Object> filter);
	/**
	 * 获取总记录条数
	 */
	Integer queryTotal(Map<String, Object> filter);
}