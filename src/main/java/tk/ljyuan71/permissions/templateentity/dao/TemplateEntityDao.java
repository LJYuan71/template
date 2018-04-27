package tk.ljyuan71.permissions.templateentity.dao;
import tk.ljyuan71.permissions.templateentity.model.TemplateEntity;

import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface TemplateEntityDao {
	/**
	 * 添加
	 */
	boolean add(TemplateEntity obj);
	/**
	 * 修改
	 */
	boolean update(TemplateEntity obj);
	/**
	 * 根据id获取
	 */
	TemplateEntity getById(String id);
	/**
	 * 根据id删除
	 */
	boolean delById(String id);
	/**
	 * 查询列表 排序id asc
	 */
	List<TemplateEntity> queryAll(Map<String, Object> filter);
	/**
	 * 获取总记录条数
	 */
	Integer queryTotal(Map<String, Object> filter);
}