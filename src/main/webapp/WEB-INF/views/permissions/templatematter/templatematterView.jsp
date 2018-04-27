<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>模板事项表明细页面</title>
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
								<label class="col-sm-2 control-label">事项主键:</label>
								<div class="col-sm-4 form-control-static">
									${templateMatter.guid }
								</div>
								<label class="col-sm-2 control-label">事项名称:</label>
								<div class="col-sm-4 form-control-static">
									${templateMatter.matterName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">事项备注:</label>
								<div class="col-sm-4 form-control-static">
									${templateMatter.remark }
								</div>
								<label class="col-sm-2 control-label">是否删除:</label>
								<div class="col-sm-4 form-control-static">
									${templateMatter.isDeleted }
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
