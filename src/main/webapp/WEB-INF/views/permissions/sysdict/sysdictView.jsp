<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>数据字典表明细页面</title>
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
								<label class="col-sm-2 control-label">数据字典主键:</label>
								<div class="col-sm-4 form-control-static">
									${sysDict.dictGuid }
								</div>
								<label class="col-sm-2 control-label">字典类型:</label>
								<div class="col-sm-4 form-control-static">
									${sysDict.typename }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">字典键:</label>
								<div class="col-sm-4 form-control-static">
									${sysDict.key }
								</div>
								<label class="col-sm-2 control-label">字典值:</label>
								<div class="col-sm-4 form-control-static">
									${sysDict.value }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">值排序:</label>
								<div class="col-sm-4 form-control-static">
									${sysDict.sequence }
								</div>
								<label class="col-sm-2 control-label">状态:</label>
								<div class="col-sm-4 form-control-static">
									${sysDict.status }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">父字典主键:</label>
								<div class="col-sm-4 form-control-static">
									${sysDict.parentGuid }
								</div>
								<label class="col-sm-2 control-label">备注:</label>
								<div class="col-sm-4 form-control-static">
									${sysDict.remarks }
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
