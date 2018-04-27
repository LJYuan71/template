<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="zh-CN">
<head>
<title>代码生成页面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/ui/bootstrap-3.3.7/css/bootstrap.min.css">  
<script src="${pageContext.request.contextPath }/ui/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/ui/layer-v3.1.1/layer/layer.js"></script>

<script>
	$(function() {
		$("input[name='pathtype']").click(function(){
			if($(this).val() == 2){
				$("#path").parent().parent().show();
			} else {
				$("#path").parent().parent().hide();
				$("#path").val("");
			}
		});
		$("#gencode").click(function() {
			var createType = $("input[name='createType']:checked").val();
			var tablename = $("#tablename").val();
			var modelname = $("#modelname").val();
			var packagename = $("#packagename").val();
			var path = $("#path").val();
			if(($("input[name='pathtype']:checked").val() == 2) && !path){
				$("#path").focus();
				return;
			}
			if (tablename != "" && modelname != ""&& packagename != ""&&createType!=undefined) {
				$.ajax({
					type : "post",
					async : false,
					url : '${pageContext.request.contextPath }/core/gencode/gencode.do',
					data:{"tablename":tablename,"modelname":modelname,"packagename":packagename,
						"createType":createType,"path":path,"template":$("input[name='template']:checked").val()},
					success : function(data) {
						if(data.code == 200){
							layer.alert('模板文件生成成功!', {time:1000});
						} else {
							layer.alert('程序错误!');
						}
					},
					error : function(data){
						layer.alert('程序错误!');
					}
				});
			} else {
				layer.alert('信息填写不完整，无法进行生成!', {time:2000});
			}
		});
	})
</script>
</head>

<body class="">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content" style="display: block;">
						<div class="form-horizontal">
							<div class="form-group"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">表名:</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="tablename" placeholder="请输入数据库表名.例：zb_gc"
										id="tablename">
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">包名:</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="packagename" placeholder="请输入生成的包名.例：zbgongcheng(全小写)"
										id="packagename">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">实体名:</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="modelname" placeholder="请输入生成的实体名.例：ZBGongCheng(字母顺序与包名一致)"
										id="modelname">
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">生成代码类型:</label>
								<div class="col-sm-4">
              						<label for="hibernate">hibernate
										<input tabindex="2" type="radio" id="hibernate" name="createType" value="hibernate" checked="checked">
									</label>
              						<label for="mybatis">mybatis
              							<input tabindex="2" type="radio" id="mybatis" name="createType" value="mybatis">
           							</label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">文件生成路径:</label>
								<div class="col-sm-4">
              						<label for="pathdefault">系统路径
										<input tabindex="2" type="radio" id="pathdefault" name="pathtype" value="1" checked="checked">
									</label>
              						<label for="pathcustom">自定义路径
              							<input tabindex="2" type="radio" id="pathcustom" name="pathtype" value="2">
           							</label>
								</div>
							</div>
							<div class="form-group" style="display: none;">
								<label class="col-sm-2 control-label"></label>
								<div class="col-sm-4">
									<input class="form-control" type="text" name="path" placeholder="请输入生成文件的完整路径"
										id="path">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">使用模板:</label>
								<div class="col-sm-4">
              						<label for="templatedefault">系统模板
										<input tabindex="2" type="radio" id="templatedefault" name="template" value="false" checked="checked">
									</label>
              						<label for="templatecustom">自定义模板
              							<input tabindex="2" type="radio" id="templatecustom" name="template" value="true">
           							</label>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button class="btn btn-primary" id="gencode">代码生成</button>
									<button class="btn btn-white" id="back">取消</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
