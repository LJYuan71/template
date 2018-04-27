<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/ui/bootstrap-3.3.7/css/bootstrap.min.css">  
<script src="${pageContext.request.contextPath }/ui/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/ui/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function showFrame(url,obj){
		$("li").removeClass()
		if(obj){
			$(obj).parent("li").attr('class','active');
		}
		$('iframe').attr('src','${pageContext.request.contextPath }'+url);//'${pageContext.request.contextPath }'+
		
	}
</script>
</head>
<body >
<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid"> 
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
			<span class="sr-only">切换导航</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">freemaker练习</a>
	</div>
	<div class="collapse navbar-collapse" id="example-navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="active"><a onclick="showFrame('/gencode.jsp',this)" href="javaScript:void(0);">代码文件生成</a></li>
			<li><a onclick="showFrame('/customtemplate.jsp',this)" href="javaScript:void(0);">自定义代码模板</a></li>
			<li><a onclick="showFrame('/permissions/templatentityvar/list.do',this)" href="javaScript:void(0);">编辑器模板变量</a></li>
			<li><a onclick="showFrame('/templateeditor.jsp',this)" href="javaScript:void(0);">编辑器模板</a></li>
			<li><a onclick="showFrame('/permissions/templateinfo/list.do',this)" href="javaScript:void(0);">模板信息</a></li>
		</ul>
	</div>
	</div>
</nav>
<div class="container_fluid">
	<iframe class="J_iframe" name="iframe0" src="${pageContext.request.contextPath }/gencode.jsp"
		seamless="" frameborder="0" height="750" width="100%"></iframe>
</div>
</body>
</html>