<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>模板实体变量管理页面</title>
  
</head>
<script type="text/javascript">
	$(function () { 
	   	$("#add").click(function(){
	   		parentOpenEdit('添加','${ctx }/permissions/templatentityvar/edit.do','1300px','700px');
	   	});
	   	$("#edit").click(function(){
			var $table = $('#table');
	   	 	var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
            	return row.guid;
            });
	   	 	if(ids.length == 0){
		   	 	layer.alert("请选择一项进行编辑！");
				return false;
			}
	   	 	parentOpenEdit('编辑用户信息','${ctx }/permissions/templatentityvar/edit.do?id='+ids,'1300px','700px')
	   	});
		$("#del").click(function(){
			var $table = $('#table');
	   	 	var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
            	return row.guid;
            });
            if(ids.length == 0){
		   	 	layer.alert("还没有选择,请至少选择一项进行删除");
				return false;
			}
            layer.confirm("删除后数据不可恢复，是否确定删除？", function(){
            	//继续删除
		  		$.ajax({
					type : "post",
					url : "${ctx }/permissions/templatentityvar/action.do?guid="+ids+"&actionName=sc",
					success : function(data) {
						if(data.code==200){
							layer.msg("删除成功", {icon: 1,time: 2000});
						}else{
							layer.alert(data.message+"!", {icon: 2});
						}
					}
				});
            })
	   	});
	   	$("#find").click(function(){
	   		$("#table").bootstrapTable("refresh");
	   	});
	   	//复制变量
	   	$("#copyvar").click(function(){
	   		var toMatterId = $("select[name='matterId']").val();
	   		if(copyGuid && toMatterId){
	   			$.ajax({
					type : "post",
					url : "${ctx }/permissions/templatentityvar/copyvar.do?copyGuid="+copyGuid+"&toMatterId="+toMatterId,
					success : function(data) {
						if(data.code==200){
							layer.close(layer.index);
							layer.msg("复制成功", {icon: 1,time: 2000});
							$('#find').click();
						}else{
							layer.alert(data.message+"!", {icon: 2});
						}
					}
				});
	   		} else {
	   			layer.alert("所需信息不完整,无法复制,请重试！", {icon: 2});
	   		}
	   	});
	});
	//操作按钮
	function actionFormatter(value, row, index) {
		return [
				'<a class="get" href="javascript:void(0)" title="查询详情">详情</a>' +'&nbsp;|&nbsp;'+
				'<a class="edit" href="javascript:void(0)" title="编辑">编辑</a>'+'&nbsp;|&nbsp;'+
				'<a class="copy" href="javascript:void(0)" title="复制">复制</a>'+'&nbsp;|&nbsp;'+
				'<a class="del" href="javascript:void(0)" title="删除">删除</a>'
		].join('');
	}
	window.actionEvents = {
			//对应class="get"的操作
		'click .get' : function(e, value, row, index) {
			parentOpenGet('查看模板变量信息','${ctx }/permissions/templatentityvar/view.do?id='+row.guid,'1300px','600px')
		},
		'click .edit' : function(e, value, row, index) {
			parentOpenEdit('编辑模板变量信息','${ctx }/permissions/templatentityvar/edit.do?id='+row.guid,'1300px','700px')
		},
		'click .del' : function(e, value, row, index) {
			layer.confirm("删除后数据不可恢复，是否确定删除？", function(){
            	//继续删除
		  		$.ajax({
					type : "post",
					url : "${ctx }/permissions/templatentityvar/action.do?guid="+row.guid+"&actionName=sc",
					success : function(data) {
						//var json = eval("(" + res + ")");
						if(data.code==200){
							layer.msg("删除成功", {icon: 1,time: 2000});
						}else{
							layer.alert(data.message+"!", {icon: 1});
						}
					}
				});
            })
		},
		'click .copy' : function(e, value, row, index) {
			matterId = row.matterId;
			copyGuid = row.guid;
			loadMatter();
			parentOpenDOMEdit('复制模板变量信息',$('#copy_var_win'),'1000px','500px','copyvar');
		}
	};
	var matterId;
	var copyGuid;
	function loadMatter(){
   		$.ajax({
			type  : "post",
			async : false,
			url   : '${ctx }/permissions/templatematter/queryAllJson.do',
			data  :{"limit":100},
			success : function(data) {
				if(data.rows){
					var testtable = $("select[name='matterId'] option");
					$("select[name='matterId'] option").remove();
					var entity = '<option value="" selected="selected">--请选择--</option>';
					$.each(data.rows,function(idx,obj){
						if(matterId == obj.guid){
							entity += '<option value="'+obj.guid+'" title="'+obj.remark+'" disabled="disabled">'+obj.matterName+'</option>';
						} else {
							entity += '<option value="'+obj.guid+'" title="'+obj.remark+'">'+obj.matterName+'</option>';
						}
					});
					$("select[name='matterId']").append(entity);
				}
			},
			error : function(data){
				layer.alert('程序错误!');
			}
		});
   	}
	//table设置查询参数
	function queryParams(params) {  //配置参数
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        	sort: params.sort,  //排序列名
           	order: params.order,//排位命令（desc，asc）
           	limit: params.limit,   //每页显示多少条记录
           	offset: params.offset,  //从多少调记录开始显示
           	search: encodeURI(params.search==undefined?"":params.search)  //模糊查询
        };
        return temp;
    }
	
</script>
<body>
	<div class="col-sm-12">
	
	<div id="toolbar" style="margin-left:10px;">
   		<button type="button" class="btn btn-success" id="add" >新增</button>
   		<button type="button" class="btn btn-info" id="edit" >编辑</button>
    	<button type="button" class="btn btn-danger" id="del" >删除</button>
	    <button type="button" class="btn btn-success" style="display: none;" id="find" >搜索</button>
	</div>
	<table id="table" data-toggle="table" data-url="${ctx }/permissions/templatentityvar/queryAllJson.do"
		data-pagination="true" data-side-pagination="server" data-show-refresh="true"
		data-page-list="${PAGE_LIST }" data-search="true" data-striped="true"
		data-content-type="application/x-www-form-urlencoded" data-method="post"
		data-click-to-select="true" data-show-columns="true" 
		data-toolbar="#toolbar" data-sort-order="desc"
		data-query-params="queryParams" data-height="100%">
		<thead>
			<tr>
				<th  data-checkbox="true" ></th>
				<th data-field="matter.matterName">模板事项</th>
				<th data-field="templateEntity.entityFullPath" data-title-tooltip="变量实体全路径">变量实体全路径</th>
				<th data-field="templateEntity.entityComment" data-formatter="showTitle">变量实体名称</th>
				<th data-field="attrName" data-sortable="true">实体属性</th>
				<th data-field="attrComment" data-sortable="true">实体属性名称</th>
				<th data-field="defaultVar" data-sortable="true">属性默认值</th>
				<th data-field="type" data-sortable="true">属性类型</th>
				<th data-field="typeStyle" data-sortable="true">属性类型样式</th>
				<th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">操作</th>
			</tr>
		</thead>
	</table>
	</div>
	<div id="copy_var_win" style="display: none;">
		<div class="form-group">
			<label class="col-sm-3 control-label">选择复制到事项:</label>
			<div class="col-sm-4">
				<select class="form-control" type="text" name="matterId">
					<option value="">--请选择--</option>
				</select>
				<button id="copyvar" style="display: none;"></button>
			</div>
		</div>
	</div>
</body>
</html>
