<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自定义模板页面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/ui/bootstrap-3.3.7/css/bootstrap.min.css"> 
<%-- <link id="MainCss" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/ui/css/bundle-LuxInteriorDark.css"/> 
<link id="mobile-style" media="only screen and (max-width: 767px)" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/ui/css/bundle-LuxInteriorDark-mobile.css"/>
 --%><script src="${pageContext.request.contextPath }/ui/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/ui/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/ui/layer-v3.1.1/layer/layer.js"></script>
<script type="text/javascript">
	$(function(){
		templateTypeChange();
		$.ajax({
			type  : "post",
			async : false,
			url   : '${pageContext.request.contextPath }/core/gencode/getAllTable.do',
			success : function(data) {
				if(data.code == 200){
					var testtable = $("select[name='testtable'] option");
					$("select[name='testtable'] option").remove();
					var testOption = '<option value="" selected="selected">默认</option>';
					$.each(data.tables,function(idx,obj){
						var tabComment = "";
						if(obj.tabComment) tabComment="("+obj.tabComment+")";
						testOption += '<option value="'+obj.tableName+'">'+obj.tableName+tabComment+'</option>';
					});
					$("select[name='testtable']").append(testOption);
				} else {
					layer.alert('程序错误!');
				}
			},
			error : function(data){
				layer.alert('程序错误!');
			}
		});
	});
	
	function codeTypeChange(type){
		if(type == 1){
			$("select[name='templatetype'] option[value='xml']").hide();
			$("select[name='templatetype'] option[value='daoImpl']").show();
		} else {
			$("select[name='templatetype'] option[value='xml']").show();
			$("select[name='templatetype'] option[value='daoImpl']").hide();
		}
		$("select[name='templatetype'] option:eq(0)").prop("selected",true);
		templateTypeChange();
	}
	
	function templateTypeChange(){
		var codetype = $("select[name='codetype']").val();
		var templatetype = $("select[name='templatetype']").val();
		$("#customtemplate").val("");
		$("#textcustomtemplate").val("");
		$("#isPass").val("");
		$.ajax({
			type  : "post",
			async : false,
			url   : '${pageContext.request.contextPath }/core/gencode/getcustomtemplate.do',
			data  : {"templatetype":templatetype,"codetype":codetype},
			success : function(data) {
				if(data.code == 200){
					$("#customtemplate").val(data.ftlStr);
				} else {
					layer.alert('程序错误!');
				}
			},
			error : function(data){
				layer.alert('程序错误!');
			}
		});
	}
	
	function testtemplate(){
		var ftlStr = $("#customtemplate").val();
		if(!ftlStr){
			$("#customtemplate").focus();
			return;
		}
		var testtable = $("select[name='testtable']").val();
		$("#textcustomtemplate").val("");
		$.ajax({
			type  : "post",
			async : false,
			url   : '${pageContext.request.contextPath }/core/gencode/testcustomtemplate.do',
			data  : {"ftlStr":ftlStr,"tablename":testtable},
			success : function(data) {
				$("#textcustomtemplate").val(data.retStr);
				if(data.code == 200){
					$("#isPass").val(1);
				}
			},
			error : function(data){
				layer.alert('程序错误!');
			}
		});
	}
	
	function savetemplate(){
		var isPass = $("#isPass").val();
		if(isPass == 1){
			var codetype = $("select[name='codetype']").val();
			var templatetype = $("select[name='templatetype']").val(); 
			var ftlStr = $("#customtemplate").val();
			if(!codetype || !templatetype || !ftlStr){
				layer.alert('请完善信息!', {time:2000});
				return;
			}
			$.ajax({
				type  : "post",
				async : false,
				url   : '${pageContext.request.contextPath }/core/gencode/savecustomtemplate.do',
				data  : {"ftlStr":ftlStr,"templatetype":templatetype,"codetype":codetype},
				success : function(data) {
					if(data.code == 200){
						layer.alert('模板文件保存成功!', {time:1000});
					}else{
						layer.alert('程序错误!');
					}
				},
				error : function(data){
					layer.alert('程序错误!');
				}
			});
		} else {
			layer.alert('模板未通过测试,无法保存');
		}
	}
	
	function resettemplate(){
		var codetype = $("select[name='codetype']").val();
		var templatetype = $("select[name='templatetype']").val();
		$("#customtemplate").val("");
		$.ajax({
			type  : "post",
			async : false,
			url   : '${pageContext.request.contextPath }/core/gencode/resettemplate.do',
			data  : {"templatetype":templatetype,"codetype":codetype},
			success : function(data) {
				if(data.code == 200){
					$("#customtemplate").val(data.ftlStr);
					layer.alert('重置成功!', {time:1000});
				} else {
					layer.alert('程序错误!');
				}
			},
			error : function(data){
				layer.alert('程序错误!');
			}
		});
	}
</script>
</head>
<body>
	<div class="container_fluid">
		<div class="row">
			<div class="form-horizontal">
				<div class="form-group"></div>
				<div class="row">
					<input type="hidden" id="isPass">
					<div class="form-group">
						<label class="col-sm-1 control-label">代码类型:</label>
						<div class="col-sm-2">
							<select class="form-control" name="codetype" onchange="codeTypeChange(this.value);">
								<option value="1" selected="selected">hibernate</option>
								<option value="2">mybatis</option>
							</select>
						</div>
						<label class="col-sm-1 control-label">模板类型:</label>
						<div class="col-sm-2">
							<select class="form-control" name="templatetype" onchange="templateTypeChange(this.value);">
								<option value="model" selected="selected">model</option>
								<option value="controller">controller</option>
								<option value="service">service</option>
								<option value="serviceImpl">serviceImpl</option>
								<option value="dao">dao</option>
								<option value="edit">edit</option>
								<option value="list">list</option>
								<option value="view">view</option>
								<option value="daoImpl">daoImpl</option>
								<option value="xml" style="display: none;">xml</option>
							</select>
						</div>
						<label class="col-sm-1 control-label">测试表:</label>
						<div class="col-sm-2">
							<select class="form-control" name="testtable">
								<option value="" selected="selected">默认</option>
							</select>
						</div>
						<div class="col-sm-3">
							<button class="btn" onclick="testtemplate();">生成测试</button>
							<button class="btn" onclick="savetemplate();">保存模板</button>
							<button class="btn" onclick="resettemplate();">重置模板</button>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-12">
				<div class="col-sm-6">
					<textarea rows="100" cols="100" placeholder="模板编辑" name="customtemplate" id="customtemplate"></textarea>
				</div>
				<div class="col-sm-6">
					<textarea rows="100" cols="100" placeholder="模板输出测试" name="textcustomtemplate" id="textcustomtemplate"></textarea>
				</div>
			</div>
		</div>
	</div>
</body>
</html>