<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>招标工程-用户关系表编辑页面</title>
<script>
   	$(function(){
   		//Validform表单验证
   		$("#zBGcUserForm").Validform();
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
				});
			}else {
				//失败
				layer.alert(responseText.message+"!", {icon: 1});
			}
		};
   	})
</script>
</head>

<body class="gray-bg">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content" style="display: block;">
						<form class="form-horizontal" method="post" id="zBGcUserForm" action="${ctx }/permissions/zbgcuser/save.do">
							<div class="form-group">
								<label class="col-sm-2 control-label">工程-用户关系id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcUserGuid" value="${zBGcUser.gcUserGuid }">
								</div>
								<label class="col-sm-2 control-label">工程id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcGuid" value="${zBGcUser.gcGuid }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">用户id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="userGuid" value="${zBGcUser.userGuid }">
								</div>
								<label class="col-sm-2 control-label">创建时间:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="createTime" value="${zBGcUser.createTime }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">创建人:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="creatorGuid" value="${zBGcUser.creatorGuid }">
								</div>
								<label class="col-sm-2 control-label">是否删除:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isDeleted" value="${zBGcUser.isDeleted }">
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
