<#import "function.ftl" as func>
<#assign pk=func.getPk(model) >
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${model.tabComment}查看页面</title>
<#noparse><#include "/head.html"/></#noparse>
<script>
   	$(function(){
		$(function(){
		var dataGuid = getReqParam(location.href,"dataGuid");  //获取guid
		if (!dataGuid) return;
		$.ajax({
	        async: false,
	        cache: false,
	        type : 'POST',  
	        dataType: "json",
	        contentType : 'application/json', 
	        url: '<#noparse>${</#noparse>base}/${modular}/${packagename}/queryById.do?id='+dataGuid,
	        success: function(data) {
    		//赋值
    		var bean = data.bean;
			loadBeanValue(bean);//根据id赋值
			//$("#startTime").datetimebox('setValue', formatDateByType(bean.startTime, timePattern));//时间处理
	        },
	        error : function(data) {  
	        	alertMessage("请求失败");
	        } 
    	});
   	})
</script>
</head>

<body>
	<div class="divMainContent">
		<!--中间内容开始-->
		<div class="big_title">
			<div class="tool_bar">
				<span class="btn recall" onclick="parent.removePanel(parent.currentTitle)"><i></i>返回</span>
			</div>
			<h2>查看${model.tabComment}</h2>
		</div>
		<div class="main_con">

			<!--table_con_list开始-->
			<form id="${modelname?uncap_first}Form">
				<div class="table_con_list">
					<div class="table_title">
						<h2>查看${model.tabComment}</h2>
					</div>
					<div class="table_details">
						<div class="table_box">
							<table>
								<tr>
								<#list model.columnList as col>
								<#if 0<col_index  && (col_index % 2)==0>
								</tr>
								<tr>
								</#if>
									<th width="15%"> ${col.comment}:</th>
									<td ><span id="${func.convertUnderLine(col.columnName)}" name="${func.convertUnderLine(col.columnName)}"></span></td>
								</#list>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
