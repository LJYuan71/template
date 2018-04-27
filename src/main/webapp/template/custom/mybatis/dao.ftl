<#import "function.ftl" as func>
<#if path??>
<#else>
package ${domainsuf}.${system}.${modular}.${packagename}.dao;
import ${domainsuf}.${system}.${modular}.${packagename}.model.${modelname};
</#if>

import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface ${modelname}Dao {
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
	List<${modelname}> queryAll(Map<String, Object> filter);
	/**
	 * 获取总记录条数
	 */
	Integer queryTotal(Map<String, Object> filter);
}