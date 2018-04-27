package tk.ljyuan71.permissions.templatematter.dao;
import tk.ljyuan71.permissions.templatematter.model.TemplateMatter;

import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface TemplateMatterDao {
	/**
	 * 添加
	 */
	boolean add(TemplateMatter obj);
	/**
	 * 修改
	 */
	boolean update(TemplateMatter obj);
	/**
	 * 根据id获取
	 */
	TemplateMatter getById(String id);
	/**
	 * 根据id删除
	 */
	boolean delById(String id);
	/**
	 * 查询列表 排序id asc
	 */
	List<TemplateMatter> queryAll(Map<String, Object> filter);
	/**
	 * 获取总记录条数
	 */
	Integer queryTotal(Map<String, Object> filter);
}