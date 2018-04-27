<#import "function.ftl" as func>
<#if path??>
<#else>
package ${domainsuf}.${system}.${modular}.${packagename}.dao.impl;
import ${domainsuf}.${system}.${modular}.${packagename}.model.${modelname};
import ${domainsuf}.${system}.${modular}.${packagename}.dao.${modelname}Dao;
</#if>

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.zhulong.common.hibernate.Finder;
import com.zhulong.common.hibernate.HibernateBaseDaoZs;
import com.zhulong.common.page.Pagination;
import com.zhulong.jiaoyi.util.QueryFilter;

@Repository("${modelname?uncap_first}Dao")
public class ${modelname}DaoImpl extends HibernateBaseDaoZs<${modelname}, String> implements ${modelname}Dao{
	
	@Override
	protected Class<${modelname}> getEntityClass() {
		return ${modelname}.class;
	}
	
	/**
	 * 分页/不分页查询
	 */
	@Override
	public Pagination queryAll(QueryFilter filter){
		Finder finder = Finder.create(" from "+ ${modelname}.class +" t1 where t1.isDeleted = 0 ");
		Map<String, Object> param = filter.getFilters();
		if (param != null) {
			if (param.get("hysName") != null) {
				finder.append(" and t1.hysName like :hysName");
				finder.setParam("hysName", "%"+param.get("hysName")+"%");
			}
		}
		finder.append(" order by createTime desc ");
		Pagination pagination = new Pagination();
		if (filter.isNeedPage()){
			pagination = find(finder, filter.getPageNo(), filter.getPageSize());
		} else {
			pagination.setList(find(finder));
		}
		return pagination;
	}
}
