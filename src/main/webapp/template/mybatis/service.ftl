<#import "function.ftl" as func>
<#if path??>
<#else>
package ${domainsuf}.${system}.${modular}.${packagename}.service;
import ${domainsuf}.${system}.${modular}.${packagename}.model.${modelname};
</#if>

import java.util.Map;
import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;

public interface  ${modelname}Service {
	/**
	 * 添加
	 */
	boolean add(${modelname} obj);
	/**
	 * 修改
	 */
	boolean update(${modelname} obj);
	/**
	 * 根据id获取
	 */
	${modelname} getById(String id);
	/**
	 * 根据id删除
	 */
	boolean delById(String id);
	/**
	 * 查询列表 排序id asc
	 */
	public Pager<${modelname}> queryAll(QueryFilter queryFilter);
	
	/**
	 * 新增或者修改记录
	 */
	public Map<String, Object> insert(${modelname} obj);
	/**
	 * 根据id进行的操作
	 * @param actionName 操作名称拼音字母首字
	 */
	public Map<String, Object> actions(String guid, String actionName);
}