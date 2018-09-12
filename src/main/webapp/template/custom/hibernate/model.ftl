<#import "function.ftl" as func>
<#if path??>
<#else>
package ${domainsuf}.${system}.${modular}.${packagename}.model;
</#if>

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

/**
 * ${model.tabComment}
 * 表${tablename}实体
 */
@Entity
@Table(name = "${tablename}")
@DynamicUpdate(true)
@DynamicInsert(true)
public class ${modelname} implements Serializable {
private static final long serialVersionUID = 1L;
<#-- 主表属性生成 -->
<#list model.columnList as col>
	// ${col.comment}
	<#if col.isPK>
	@Id
	</#if>
	@Column(name = "${col.columnName}")
	<#if (col.colType=="Integer") && (col.precision==1) && (col.columnName?starts_with("IS") || col.columnName?starts_with("is") || col.comment?index_of("是否")!=-1)>
	private Boolean ${func.convertUnderLine(col.columnName)};
	<#elseif (col.colType=="Integer") && (col.precision<=4)>
	private Short ${func.convertUnderLine(col.columnName)};
	<#elseif (col.colType=="Integer") && (col.precision>=9)>
	private Long ${func.convertUnderLine(col.columnName)};
	<#else>
	private ${col.colType}  ${func.convertUnderLine(col.columnName)};
	</#if>
</#list>
<#-- 字表属性生成 -->
<#if subtables?exists && subtables?size!=0>
	<#list subtables as table>
	<#assign vars=table.variables>
	//${table.tabComment}列表
	protected List<${vars.class}> ${vars.classVar}List=new ArrayList<${vars.class}>();
	</#list>
</#if>

<#-- 主表属性getter/setter生成 -->
<#list model.columnList as col>
	<#assign colName=func.convertUnderLine(col.columnName)>
	/** 设置  ${col.comment} 值 */
	public void set${colName?cap_first}(<#if (col.colType=="Integer") && (col.precision==1) && (col.columnName?starts_with("IS") || col.columnName?starts_with("is") || col.comment?index_of("是否")!=-1)>Boolean<#elseif (col.colType=="Integer") && (col.precision<=4)>Short<#elseif (col.colType=="Integer") && (col.precision>=9)>Long<#else>${col.colType}</#if> ${colName}){
		this.${colName} = ${colName};
	}
	/** 获取 ${col.comment} 值 */
	public <#if (col.colType=="Integer") && (col.precision==1) && (col.columnName?starts_with("IS") || col.columnName?starts_with("is") || col.comment?index_of("是否")!=-1)>Boolean<#elseif (col.colType=="Integer") && (col.precision<=4)>Short<#elseif (col.colType=="Integer") && (col.precision>=9)>Long<#else>${col.colType}</#if> get${colName?cap_first}(){
		return this.${colName};
	}
</#list>

<#-- 子表属性getter/setter生成 -->
<#if subtables?exists && subtables?size!=0>
<#list subtables as table>
<#assign vars=table.variables>
	public void set${vars.classVar?cap_first}List(List<${vars.class}> ${vars.classVar}List) 
	{
		this.${vars.classVar}List = ${vars.classVar}List;
	}
	/**
	 * 返回 ${table.tabComment}列表
	 * @return
	 */
	public List<${vars.class}> get${vars.classVar?cap_first}List() 
	{
		return this.${vars.classVar}List;
	}
</#list>
</#if>
}