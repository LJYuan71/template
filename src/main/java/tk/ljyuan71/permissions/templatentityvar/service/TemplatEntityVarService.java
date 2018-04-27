package tk.ljyuan71.permissions.templatentityvar.service;
import java.util.Map;

import tk.ljyuan71.permissions.templatentityvar.model.TemplatEntityVar;
import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;

public interface  TemplatEntityVarService {
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
	public Pager<TemplatEntityVar> queryAll(QueryFilter queryFilter);
	
	/**
	 * 新增或者修改记录
	 */
	public Map<String, Object> insert(TemplatEntityVar obj);
	/**
	 * 根据id进行的操作
	 * @param actionName 操作名称拼音字母首字
	 */
	public Map<String, Object> actions(String guid, String actionName);
	/**
	 * 复制变量到其他事项
	 */
	Map<String, Object> copyvar(String copyGuid, String toMatterId);
	/**
	 * 查询是否存在相同的变量
	 */
	boolean existEntityVar(TemplatEntityVar obj);
	/**
	 * 变量替换
	 * @author ljyuan 2018年4月26日
	 * @param templateContent 替换前的内容
	 * @param paramMap 模板参数
	 * @return 替换后的内容
	 */
	String replaceContentVar(String templateContent,
			Map<String, Object> paramMap);
}