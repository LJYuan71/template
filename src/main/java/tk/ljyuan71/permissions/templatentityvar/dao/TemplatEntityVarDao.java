package tk.ljyuan71.permissions.templatentityvar.dao;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import tk.ljyuan71.permissions.templatentityvar.model.TemplatEntityVar;

@Repository
public interface TemplatEntityVarDao {
	/**
	 * 添加
	 */
	boolean add(TemplatEntityVar obj);
	/**
	 * 修改
	 */
	boolean update(TemplatEntityVar obj);
	/**
	 * 根据id获取
	 */
	TemplatEntityVar getById(String id);
	/**
	 * 根据id删除
	 */
	boolean delById(String id);
	/**
	 * 查询列表 排序id asc
	 */
	List<TemplatEntityVar> queryAll(Map<String, Object> filter);
	/**
	 * 获取总记录条数
	 */
	Integer queryTotal(Map<String, Object> filter);
}