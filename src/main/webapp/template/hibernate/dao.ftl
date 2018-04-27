<#import "function.ftl" as func>
<#if path??>
<#else>
package ${domainsuf}.${system}.${modular}.${packagename}.dao;
import ${domainsuf}.${system}.${modular}.${packagename}.model.${modelname};
</#if>

import java.util.List;

import com.zhulong.common.hibernate.BaseDao;
import com.zhulong.common.page.Pagination;
import com.zhulong.jiaoyi.util.QueryFilter;

public interface ${modelname}Dao extends BaseDao<${modelname}, String>{

	/**
	 * 分页/不分页查询
	 */
	public Pagination queryAll(QueryFilter filter);
}
