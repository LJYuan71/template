<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>模板实体变量明细页面</title>
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content" style="display: block;">
						<form class="form-horizontal" >
							<div class="form-group">
								<label class="col-sm-2 control-label">主键id:</label>
								<div class="col-sm-4 form-control-static">
									${templatEntityVar.guid }
								</div>
								<label class="col-sm-2 control-label">事项id:</label>
								<div class="col-sm-4 form-control-static">
									${templatEntityVar.matterId }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">变量实体id:</label>
								<div class="col-sm-4 form-control-static">
									${templatEntityVar.entityId }
								</div>
								<label class="col-sm-2 control-label">实体的属性名称:</label>
								<div class="col-sm-4 form-control-static">
									${templatEntityVar.attrName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">实体的属性备注:</label>
								<div class="col-sm-4 form-control-static">
									${templatEntityVar.attrComment }
								</div>
								<label class="col-sm-2 control-label">属性默认值:</label>
								<div class="col-sm-4 form-control-static">
									${templatEntityVar.defaultVar }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">属性类型:</label>
								<div class="col-sm-4 form-control-static">
									${templatEntityVar.type }
								</div>
								<label class="col-sm-2 control-label">属性类型样式:</label>
								<div class="col-sm-4 form-control-static">
									${templatEntityVar.typeStyle }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否删除:</label>
								<div class="col-sm-4 form-control-static">
									${templatEntityVar.isDeleted }
								</div>
							</div>
							<div class="hr-line-dashed"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
