<#import "function.ftl" as func>
<#assign pk=func.getPk(model) >
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${domainsuf}.${system}.${modular}.${packagename}.dao.${modelname}Dao" >
    <resultMap id="${modelname}" type="${domainsuf}.${system}.${modular}.${packagename}.model.${modelname}">
    	<#list model.columnList as col>
		<#assign colName=func.convertUnderLine(col.columnName)>
		<#if (col.isPK) >
		<id property="${colName}" column="${col.columnName}" jdbcType="${func.getJdbcType(col.colDbType)}"/>
		<#else>
		<result property="${colName}" column="${col.columnName}" jdbcType="${func.getJdbcType(col.colDbType)}"/>
		</#if>
		</#list>
	</resultMap>
	<sql id="columns">
		<#list model.columnList as col>${col.columnName}<#if col_has_next>,</#if></#list>
	</sql>
	<sql id="dynamicWhere">
		<where>
			<#list model.columnList as col>
			<#assign colName=func.convertUnderLine(col.columnName)>
			<#if (col.colType=="String")>
			<if test="@Ognl@isNotEmpty(${colName})"> AND instr(${col.columnName},'<#noparse>${</#noparse>${colName}}')>0  </if>
			<if test="@Ognl@isNotEmpty(${colName}Equals)"> AND ${col.columnName}  =#<#noparse>{</#noparse>${colName}Equals}  </if>
			<#else>
			<#if (col.colType=="java.util.Date")>
			<if test="@Ognl@isNotEmpty(${colName})"> AND ${col.columnName}  =<#noparse>#{</#noparse>${colName}} </if>
			<if test="@Ognl@isNotEmpty(begin${colName})"> AND ${col.columnName}  >=<#noparse>#{</#noparse>begin${colName},jdbcType=DATE} </if>
			<if test="@Ognl@isNotEmpty(end${colName})"> AND ${col.columnName} <![CDATA[ <=<#noparse>#{</#noparse>end${colName},jdbcType=DATE}]]> </if>
			<#else>
			<if test="@Ognl@isNotEmpty(${colName})"> AND ${col.columnName}  =<#noparse>#{</#noparse>${colName}} </if>
			</#if>
			</#if>
			</#list>
			<if test="@Ognl@isNotEmpty(search)"> AND  
					(	
						<#list model.columnList as col>
							<#assign colName=func.convertUnderLine(col.columnName)>
							instr(${col.columnName},'<#noparse>${</#noparse>search}')>0  <#if col_has_next>  or </#if>
						</#list>
					)  
			</if>
		</where>
	</sql>
	<insert id="add" parameterType="${domainsuf}.${system}.${modular}.${packagename}.model.${modelname}">
        insert into ${tablename}
		(<include refid="columns"/>)
		values
		(
		<#list model.columnList as col>
			<#assign colName=func.convertUnderLine(col.columnName)>
			<#noparse>#{</#noparse>${colName},jdbcType=${func.getJdbcType(col.colDbType)}<#noparse>}</#noparse><#if col_has_next>, </#if>
		</#list>
		)
    </insert>
    <update id="update" parameterType="${domainsuf}.${system}.${modular}.${packagename}.model.${modelname}">
		update ${tablename} 
		<set>
		<#list model.columnList as col>
		<#if pk != col.columnName>
		<#assign colName=func.convertUnderLine(col.columnName)>
	        <if test="@Ognl@isNotEmpty(${colName})">
	        	${col.columnName}=<#noparse>#{</#noparse>${colName},jdbcType=${func.getJdbcType(col.colDbType)}<#noparse>}</#noparse>,
	        </if>
        </#if>
		</#list>
		</set>
		WHERE
		${pk}=<#noparse>#{</#noparse>${func.convertUnderLine(pk)}}
	</update>
	<select id="getById" parameterType="String" resultType="${domainsuf}.${system}.${modular}.${packagename}.model.${modelname}">
        select <include refid="columns"/> from ${tablename} where ${pk}=<#noparse>#{</#noparse>${func.convertUnderLine(pk)}}
    </select>
     <delete id="delById" parameterType="String" >
        delete from  ${tablename} where ${pk}=<#noparse>#{</#noparse>${func.convertUnderLine(pk)}}
    </delete>
    <select id="queryTotal"  resultType="Integer">
        select count(*) from ${tablename} 
        <include refid="dynamicWhere" /> 
    </select>
    <select id="queryAll"  resultMap="${modelname}">
        select <include refid="columns"/> from ${tablename} 
        <include refid="dynamicWhere" /> 
        <if test="@Ognl@isNotEmpty(sort)">
			order by <#noparse>${sort} ${order}</#noparse>
		</if>
		<if test="@Ognl@isEmpty(sort)">
			order by ${pk}  desc
		</if>
    </select>
</mapper>
	