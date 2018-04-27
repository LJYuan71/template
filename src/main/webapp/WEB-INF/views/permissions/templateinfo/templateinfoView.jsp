<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>模板信息明细页面</title>
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
								<label class="col-sm-2 control-label">模板信息id:</label>
								<div class="col-sm-4 form-control-static">
									${templateInfo.guid }
								</div>
								<label class="col-sm-2 control-label">模板名称:</label>
								<div class="col-sm-4 form-control-static">
									${templateInfo.templateName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">模板事项:</label>
								<div class="col-sm-4 form-control-static">
									${templateInfo.matterId }
								</div>
								<label class="col-sm-2 control-label">是否删除:</label>
								<div class="col-sm-4 form-control-static">
									${templateInfo.isDeleted }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">模板内容:</label>
								<div class="col-sm-10 form-control-static">
									${templateInfo.templateContent }
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
