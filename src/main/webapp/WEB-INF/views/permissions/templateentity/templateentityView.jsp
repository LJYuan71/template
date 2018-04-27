<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>模板实体明细页面</title>
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
								<label class="col-sm-2 control-label">变量实体id:</label>
								<div class="col-sm-4 form-control-static">
									${templateEntity.guid }
								</div>
								<label class="col-sm-2 control-label">变量实体完整路径:</label>
								<div class="col-sm-4 form-control-static">
									${templateEntity.entityFullPath }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">变量实体注释:</label>
								<div class="col-sm-4 form-control-static">
									${templateEntity.entityComment }
								</div>
								<label class="col-sm-2 control-label">是否删除:</label>
								<div class="col-sm-4 form-control-static">
									${templateEntity.isDeleted }
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
