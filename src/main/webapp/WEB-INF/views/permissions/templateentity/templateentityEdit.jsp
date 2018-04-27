<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>模板实体编辑页面</title>
<script>
   	$(function(){
   		//Validform表单验证
   		$("#templateEntityForm").Validform();
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
				 layer.alert('保存成功！',{title:'提示'},function(index){
					parentEditCloseWin();
					parent.loadEntity();
				});
			}else {
				//失败
				layer.alert(responseText.message+"!", {icon: 1});
			}
		};
		
		$("#submit").click(function(){
			$("#templateEntityForm").ajaxForm(options);
		});
   	})
</script>
</head>

<body class="gray-bg">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content" style="display: block;">
						<form class="form-horizontal" method="post" id="templateEntityForm" action="${ctx }/permissions/templateentity/save.do">
							<input class="form-control" type="hidden"  name="guid" value="${templateEntity.guid }">
							<div class="form-group">
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">变量实体完整路径:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="entityFullPath" value="${templateEntity.entityFullPath }" datatype="*" errormsg="路径必须输入！">
								</div>
								<label class="col-sm-2 control-label">变量实体注释:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="entityComment" value="${templateEntity.entityComment }" datatype="*" errormsg="注释必须输入！">
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
