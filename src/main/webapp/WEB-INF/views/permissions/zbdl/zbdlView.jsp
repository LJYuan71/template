<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>工程-招标代理明细页面</title>
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
								<label class="col-sm-2 control-label">主键id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.gcZbdlGuid }
								</div>
								<label class="col-sm-2 control-label">工程id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.gcGuid }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">事项id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.shixiangGuid }
								</div>
								<label class="col-sm-2 control-label">招标代理id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlGuid }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标代理编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlBh }
								</div>
								<label class="col-sm-2 control-label">招标代理名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">资质等级:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlZizhiDengji }
								</div>
								<label class="col-sm-2 control-label">资质证书号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlZizhiZhengshuBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">负责人:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlFuzerenName }
								</div>
								<label class="col-sm-2 control-label">负责人职务:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlFuzerenZhiwu }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标负责人:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlZbFuzerenName }
								</div>
								<label class="col-sm-2 control-label">招标负责人联系电话:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlZbFuzerenPhone }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标负责人手机:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlZbFuzerenMobile }
								</div>
								<label class="col-sm-2 control-label">招标负责人邮箱:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlZbFuzerenEmail }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlJinbanrenName }
								</div>
								<label class="col-sm-2 control-label">经办人手机:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlJinbanrenMobile }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人邮箱:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlJinbanrenEmail }
								</div>
								<label class="col-sm-2 control-label">经办人联系电话:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlJinbanrenPhone }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">修改次数:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.xiugaiCishu }
								</div>
								<label class="col-sm-2 control-label">是否删除:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.isDeleted }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否兜底方案新增:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.isDoudiXinzeng }
								</div>
								<label class="col-sm-2 control-label">是否兜底方案修改:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.isDoudiXiugai }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">修改时间:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.modifyTime }
								</div>
								<label class="col-sm-2 control-label">招标代理权限:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlQuanxian }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标代理机构地址:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlAddress }
								</div>
								<label class="col-sm-2 control-label">招标代理机构邮编:</label>
								<div class="col-sm-4 form-control-static">
									${zBGcZbdl.zbdlPostcode }
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
