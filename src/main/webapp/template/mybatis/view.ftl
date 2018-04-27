<#import "function.ftl" as func>
<#assign pk=func.getPk(model) >
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>${model.tabComment}明细页面</title>
<script>
   
</script>
</head>

<body class="gray-bg">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content" style="display: block;">
						<form class="form-horizontal" >
							<div class="form-group">
							<#list model.columnList as col>
							<#if 0<col_index  && (col_index % 2)==0>
							</div>
							<div class="form-group">
							</#if>
								<label class="col-sm-2 control-label">${col.comment}:</label>
								<div class="col-sm-4 form-control-static">
									<#if (col.colType=="java.util.Date")>
									<fmt:formatDate value='<#noparse>${</#noparse>${modelname?uncap_first}.${func.convertUnderLine(col.columnName)} }' pattern='yyyy-MM-dd'/>
									<#else>
									<#noparse>${</#noparse>${modelname?uncap_first}.${func.convertUnderLine(col.columnName)} }
									</#if>
								</div>
							</#list>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
