<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>数据字典表编辑页面</title>
<script>
   	$(function(){
   		//Validform表单验证
   		$("#sysDictForm").Validform();
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
				layer.alert(responseText.message+"!", {icon: 2});
			}
		};
		//表单提交
		$("#submit").click(function(){
			$("#sysDictForm").ajaxForm(options);
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
						<form class="form-horizontal" method="post" id="sysDictForm" action="${ctx }/permissions/sysdict/save.do">
							<div class="form-group"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">数据字典主键:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="dictGuid" value="${sysDict.dictGuid }">
								</div>
								<label class="col-sm-2 control-label">字典类型:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="typename" value="${sysDict.typename }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">字典键:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="key" value="${sysDict.key }">
								</div>
								<label class="col-sm-2 control-label">字典值:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="value" value="${sysDict.value }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">值排序:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="sequence" value="${sysDict.sequence }">
								</div>
								<label class="col-sm-2 control-label">状态:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="status" value="${sysDict.status }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">父字典主键:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="parentGuid" value="${sysDict.parentGuid }">
								</div>
								<label class="col-sm-2 control-label">备注:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="remarks" value="${sysDict.remarks }">
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
