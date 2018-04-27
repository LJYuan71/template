<#import "function.ftl" as func>
<#assign pk=func.getPk(model) >
<!DOCTYPE html>
<html lang="zh-CN">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#noparse><#include "/head.html"/></#noparse>
<head>
<title>${model.tabComment}编辑/新增页面</title>
<script>
   	$(function(){
   		var dataGuid = getReqParam(location.href,"dataGuid");  //获取guid
		if (!dataGuid) return;
		$(".big_title").find("h2").text("编辑${model.tabComment}");
		$(".table_title").find("h2").text("编辑${model.tabComment}");
		$.ajax({
	        async: false,
	        cache: false,
	        type : 'POST',  
	        dataType: "json",
	        contentType : 'application/json', 
	        url: '<#noparse>${</#noparse>base}/${modular}/${packagename}/queryById.do?id='+dataGuid,
	        success: function(data) {
	    		//赋值选择1 或 2中一种
			var bean = data.bean;
			//1
			loadBeanValue(bean);//根据id赋值
			$("#startTime").datetimebox('setValue', formatDateByType(bean.startTime, timePattern));//时间处理
			
			//2
			chgLongToDateStr(bean,'creatorName',timePattern);//时间处理
			$("#${modelname?uncap_first}Form").form('load',bean)根据name赋值
	        },
	        error : function(data) {  
	        	alertMessage("请求失败");
	        } 
    	});
   	})
   	
   	function save(flag) {
		//获取数据
		if(!$("#${modelname?uncap_first}Form").form("validate")){//校验必填项
			alertMessage("请先填写所需完整信息!");
			return;
		}
		var formObj = $("#${modelname?uncap_first}Form").serializeObject();
		//chgDateToLong(formObj, "startTime");时间处理
		if (flag == 'qr') {//确认
			formObj["zhuangTai"] = 2;
		} else {
			formObj["zhuangTai"] = 1;
		}
		$.ajax({
 			type : 'POST',  
 			data: formObj,
 			url: '<#noparse>${</#noparse>base}/${modular}/${packagename}/save.do',
 			success : function(data) { 
 				if(data.code == '200'){
 					loadBeanValue(data.bean);//根据id赋值
					$("#startTime").datetimebox('setValue', formatDateByType(bean.startTime, timePattern));//时间处理
 					$.messager.show({title:'提示',msg:data.message,timeout:1000,showType:'slide'});
 					parent.refreshTabByTitle($.getUrlParam('parentTitle'));
 					if (flag == 'qr') {
 						$("#queren").hide();
						$("#save").hide();
 						$.messager.show({title:'提示',msg:data.message,timeout:1000,showType:'slide'});
 						parent.removePanel(parent.currentTitle);
 					}
 				} else {
 					alertMessage(data.message);
 				}
 		    },  
 		   	error : function(data) {  
 	          	alertMessage("请求失败");
 	        }  
 		});
	}
</script>
</head>

<body>
	<div class="divMainContent">
		<!--中间内容开始-->
		<div class="big_title">
			<div class="tool_bar">
				<span class="btn save" id="save" onclick="save()"><i></i>保存</span>
				<span class="btn save" id="queren" onclick="save('qr')"><i></i>确认</span> 
				<span class="btn recall" onclick="parent.removePanel(parent.currentTitle)"><i></i>返回</span>
			</div>
			<h2>新增${model.tabComment}</h2>
		</div>
		<div class="main_con">

			<!--table_con_list开始-->
			<form id="${modelname?uncap_first}Form">
				<div class="table_con_list">
					<div class="table_title">
						<h2>新增${model.tabComment}</h2>
					</div>
					<div class="table_details">
						<div class="table_box">
							<table>
								<tr>
									<!-- 必输和时间控件
									<th width="15%"><span style="color: red;">*</span>必输项红色*：</th>
									<td width="35%">
										<input id="startTime" class="easyui-datetimebox"
											name="startTime" data-options="showSeconds:false,editable:false,required:true"/>
									</td>
									<input type="text" id="zbrName" name="zbrName" class="easyui-validatebox" data-options="required:true"></input>
									-->
									<input type="hidden" id="guid" name="guid"/>
									<#list model.columnList as col>
									<#if 0<col_index  && (col_index % 2)==0>
									</tr>
									<tr>
									</#if>
										<th width="15%">${col.comment}:</th>
										<td width="35%">
										<#if col.colType=="Long" && (col.columnName?index_of("TIME")!=-1||col.columnName?index_of("time"))>
										<input id="${func.convertUnderLine(col.columnName)}" name="${func.convertUnderLine(col.columnName)}" class="easyui-datetimebox" data-options="showSeconds:false,editable:false"/>
										<#else>
										<input type="text" id="${func.convertUnderLine(col.columnName)}" name="${func.convertUnderLine(col.columnName)}" class="easyui-validatebox"></input>
										</#if>
										</td>
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
