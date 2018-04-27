<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="ctx" value="<%=pageContext.getServletContext().getContextPath()%>" />
<c:set var="PAGE_LIST" value="[5, 10, 20, 50]" />  
<link rel="stylesheet" href="${ctx }/ui/bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctx }/ui/bootstrap-table/dist/bootstrap-table.min.css">
<script src="${ctx }/ui/js/jquery.min.js"></script>
<script src="${ctx }/ui/js/jquery.form.js"></script>
<script src="${ctx }/ui/js/Validform_v5.3.2_min.js"></script>
<script src="${ctx }/ui/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="${ctx }/ui/bootstrap-table/dist/bootstrap-table.min.js"></script>
<script src="${ctx }/ui/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${ctx }/ui/layer-v3.1.1/layer/layer.js"></script>
<script src="${ctx }/ui/js/layerUtils.js?<%=Math.random() %>"></script>
<script>
	function showTitle(value){
		return '<span title='+value+'>'+value+'</span>';
	}
	function indexFormatter(value, row, index){
		return (index+1);
	}
	$(window).resize(function() {
	    $('table[data-toggle="table"]').bootstrapTable('resetView');
	});
</script>