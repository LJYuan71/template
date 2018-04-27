package tk.ljyuan71.permissions.templateinfo.dao;
import tk.ljyuan71.permissions.templateinfo.model.TemplateInfo;

import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface TemplateInfoDao {
	/**
	 * 添加
	 */
	boolean add(TemplateInfo obj);
	/**
	 * 修改
	 */
	boolean update(TemplateInfo obj);
	/**
	 * 根据id获取
	 */
	TemplateInfo getById(String id);
	/**
	 * 根据id删除
	 */
	boolean delById(String id);
	/**
	 * 查询列表 排序id asc
	 */
	List<TemplateInfo> queryAll(Map<String, Object> filter);
	/**
	 * 获取总记录条数
	 */
	Integer queryTotal(Map<String, Object> filter);
}