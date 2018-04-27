<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>工程-招标代理编辑页面</title>
<script>
   	$(function(){
   		//Validform表单验证
   		$("#zBGcZbdlForm").Validform();
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
						<form class="form-horizontal" method="post" id="zBGcZbdlForm" action="${ctx }/permissions/zbdl/save.do">
							<div class="form-group">
								<label class="col-sm-2 control-label">主键id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcZbdlGuid" value="${zBGcZbdl.gcZbdlGuid }">
								</div>
								<label class="col-sm-2 control-label">工程id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcGuid" value="${zBGcZbdl.gcGuid }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">事项id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="shixiangGuid" value="${zBGcZbdl.shixiangGuid }">
								</div>
								<label class="col-sm-2 control-label">招标代理id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlGuid" value="${zBGcZbdl.zbdlGuid }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标代理编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlBh" value="${zBGcZbdl.zbdlBh }">
								</div>
								<label class="col-sm-2 control-label">招标代理名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlName" value="${zBGcZbdl.zbdlName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">资质等级:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlZizhiDengji" value="${zBGcZbdl.zbdlZizhiDengji }">
								</div>
								<label class="col-sm-2 control-label">资质证书号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlZizhiZhengshuBh" value="${zBGcZbdl.zbdlZizhiZhengshuBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">负责人:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlFuzerenName" value="${zBGcZbdl.zbdlFuzerenName }">
								</div>
								<label class="col-sm-2 control-label">负责人职务:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlFuzerenZhiwu" value="${zBGcZbdl.zbdlFuzerenZhiwu }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标负责人:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlZbFuzerenName" value="${zBGcZbdl.zbdlZbFuzerenName }">
								</div>
								<label class="col-sm-2 control-label">招标负责人联系电话:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlZbFuzerenPhone" value="${zBGcZbdl.zbdlZbFuzerenPhone }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标负责人手机:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlZbFuzerenMobile" value="${zBGcZbdl.zbdlZbFuzerenMobile }">
								</div>
								<label class="col-sm-2 control-label">招标负责人邮箱:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlZbFuzerenEmail" value="${zBGcZbdl.zbdlZbFuzerenEmail }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlJinbanrenName" value="${zBGcZbdl.zbdlJinbanrenName }">
								</div>
								<label class="col-sm-2 control-label">经办人手机:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlJinbanrenMobile" value="${zBGcZbdl.zbdlJinbanrenMobile }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人邮箱:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlJinbanrenEmail" value="${zBGcZbdl.zbdlJinbanrenEmail }">
								</div>
								<label class="col-sm-2 control-label">经办人联系电话:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlJinbanrenPhone" value="${zBGcZbdl.zbdlJinbanrenPhone }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">修改次数:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xiugaiCishu" value="${zBGcZbdl.xiugaiCishu }">
								</div>
								<label class="col-sm-2 control-label">是否删除:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isDeleted" value="${zBGcZbdl.isDeleted }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否兜底方案新增:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isDoudiXinzeng" value="${zBGcZbdl.isDoudiXinzeng }">
								</div>
								<label class="col-sm-2 control-label">是否兜底方案修改:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isDoudiXiugai" value="${zBGcZbdl.isDoudiXiugai }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">修改时间:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="modifyTime" value="${zBGcZbdl.modifyTime }">
								</div>
								<label class="col-sm-2 control-label">招标代理权限:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlQuanxian" value="${zBGcZbdl.zbdlQuanxian }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标代理机构地址:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlAddress" value="${zBGcZbdl.zbdlAddress }">
								</div>
								<label class="col-sm-2 control-label">招标代理机构邮编:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlPostcode" value="${zBGcZbdl.zbdlPostcode }">
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
