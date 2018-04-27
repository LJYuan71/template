<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>招标工程-用户关系表明细页面</title>
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
								<label class="col-sm-2 control-label">工程-用户关系id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcUser.gcUserGuid }
								</div>
								<label class="col-sm-2 control-label">工程id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcUser.gcGuid }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">用户id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcUser.userGuid }
								</div>
								<label class="col-sm-2 control-label">创建时间:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcUser.createTime }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">创建人:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcUser.creatorGuid }
								</div>
								<label class="col-sm-2 control-label">是否删除:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcUser.isDeleted }
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
