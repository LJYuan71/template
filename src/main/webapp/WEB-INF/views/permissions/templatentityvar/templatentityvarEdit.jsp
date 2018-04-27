<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>模板实体变量编辑页面</title>
<script>
   	$(function(){
   		//Validform表单验证
   		$("#templatEntityVarForm").Validform();
   		var options = {
		   beforeSubmit: showRequest,  //提交前的回调函数
		   success: showResponse,      //提交后的回调函数
		   timeout: 3000               //限制请求的时间，当请求大于3秒后，跳出请求
		}
   		//jquery.form表单提交
		function showRequest(formData, jqForm, options){
		   	return true;  //只要不返回false，表单都会提交,在这里可以对表单元素进行验证
		};
		function showResponse(responseText, statusText){
			if (responseText.code == 200) {
				//layer.msg("保存成功", {icon: 1,time: 2000});
				layer.alert('保存成功！',{title:'提示'},function(index){
					parentEditCloseWin();
				});
			}else {
				//失败
				layer.alert(responseText.message+"!", {icon: 2});
			}
		};
		
		$("#submit").click(function(){
			$("#templatEntityVarForm").ajaxForm(options);
		});
		
		loadMatter();
		loadEntity();
   	})
   	
   	function addMatter(){
   		parentOpenEdit('添加模板事项表','${ctx }/permissions/templatematter/edit.do','1000px','500px');
   	}
   	
   	function addEntity(){
   		parentOpenEdit('添加模板实体','${ctx }/permissions/templateentity/edit.do','1000px','500px');
   	}
   	var matterId = '${templatEntityVar.matterId }';
   	function loadMatter(){
   		$.ajax({
			type  : "post",
			async : false,
			url   : '${ctx }/permissions/templatematter/queryAllJson.do',
			data  :{"limit":100},
			success : function(data) {
				if(data.rows){
					var testtable = $("select[name='matterId'] option");
					$("select[name='matterId'] option").remove();
					var entity = '<option value="" selected="selected">--请选择--</option>';
					$.each(data.rows,function(idx,obj){
						if(matterId == obj.guid){
							entity += '<option value="'+obj.guid+'" title="'+obj.remark+'" selected="selected">'+obj.matterName+'</option>';
						} else {
							entity += '<option value="'+obj.guid+'" title="'+obj.remark+'">'+obj.matterName+'</option>';
						}
					});
					$("select[name='matterId']").append(entity);
				}
			},
			error : function(data){
				layer.alert('程序错误!');
			}
		});
   	}
   	var entityId = '${templatEntityVar.entityId }';
	function loadEntity(){
		$.ajax({
			type  : "post",
			async : false,
			url   : '${ctx }/permissions/templateentity/queryAllJson.do',
			data  :{"limit":100},
			success : function(data) {
				if(data.rows){
					var testtable = $("select[name='entityId'] option");
					$("select[name='entityId'] option").remove();
					var entity = '<option value="" selected="selected">--请选择--</option>';
					$.each(data.rows,function(idx,obj){
						if(entityId == obj.guid){
							entity += '<option value="'+obj.guid+'" title="'+obj.entityFullPath+'" selected="selected">'+obj.entityComment+'</option>';
						} else {
							entity += '<option value="'+obj.guid+'" title="'+obj.entityFullPath+'">'+obj.entityComment+'</option>';
						}
					});
					$("select[name='entityId']").append(entity);
				}
			},
			error : function(data){
				layer.alert('程序错误!');
			}
		});
   	}
</script>
</head>

<body class="gray-bg">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content" style="display: block;">
						<form class="form-horizontal" method="post" id="templatEntityVarForm" action="${ctx }/permissions/templatentityvar/save.do">
							<input class="form-control" type="hidden"  name="guid" value="${templatEntityVar.guid }">
							<div class="form-group"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">事项:</label>
								<div class="col-sm-3">
									<select class="form-control" type="text" name="matterId">
										<option value="">--请选择--</option>
									</select>
								</div>
								<div class="col-sm-1">
									<span class="glyphicon glyphicon-plus" onclick="addMatter()" title="新增事项"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">变量实体:</label>
								<div class="col-sm-3">
									<select class="form-control" type="text"  name="entityId">
										<option value="">--请选择--</option>
									</select>
								</div>
								<div class="col-sm-1">
									<span class="glyphicon glyphicon-plus" onclick="addEntity()" title="新增变量实体"></span>
								</div>
								<label class="col-sm-2 control-label">实体的属性名:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="attrName" value="${templatEntityVar.attrName }" datatype="*">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">实体的属性备注:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="attrComment" value="${templatEntityVar.attrComment }" datatype="*">
								</div>
								<label class="col-sm-2 control-label">属性默认值:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="defaultVar" value="${templatEntityVar.defaultVar }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">属性类型:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="type" value="${templatEntityVar.type }" placeholder="例：jiSuan,LongTime,Date,jinE">
								</div>
								<label class="col-sm-2 control-label">属性类型样式:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="typeStyle" value="${templatEntityVar.typeStyle }" placeholder="例：N/3+10.5-6/3,yyyy-MM-dd HH:mm,￥##.##">
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button class="btn btn-primary" id="submit" style="display: none;">保存内容</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
