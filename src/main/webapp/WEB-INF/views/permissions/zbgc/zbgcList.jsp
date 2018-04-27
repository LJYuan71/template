<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>招标工程表管理页面</title>
</head>
<script type="text/javascript">
	$(function () { 
	   	$("#add").click(function(){
	   		parentOpenEdit('添加','${ctx }/permissions/zbgc/edit.do','1300px','700px')
	   	});
	   	$("#edit").click(function(){
			var $table = $('#table');
	   	 	var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
            	return row.gcGuid;
            });
	   	 	if(ids.length == 0){
		   	 	layer.alert("请选择一项进行编辑！");
				return false;
			}
	   	 	parentOpenEdit('编辑用户信息','${ctx }/permissions/zbgc/edit.do?id='+ids,'1300px','700px')
	   	});
		$("#del").click(function(){
		
			var $table = $('#table');
	   	 	var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
            	return row.gcGuid;
            });
            if(ids.length == 0){
		   	 	layer.alert("还没有选择,请至少选择一项进行删除");
				return false;
			}
            layer.confirm("删除后数据不可恢复，是否确定删除？", function(){
            	//继续删除
		  		$.ajax({
					type : "post",
					url : "${ctx}/permissions/zbgc/action.do?guid="+ids+"&actionName=sc",
					success : function(data) {
						//var json = eval("(" + res + ")");
						if(data.code==200){
							layer.msg("删除成功", {icon: 1,time: 2000});
						}else{
							layer.alert(json.message+"!", {icon: 1});
						}
					}
				});
            })
	   	});
	   	$("#find").click(function(){
	   		$("#table").bootstrapTable("refresh");
	   	});
	});
	//操作按钮
	function actionFormatter(value, row, index) {
		return [
				'<a class="get" href="javascript:void(0)" title="查询详情">详情</a>' +'&nbsp;|&nbsp;'+
				'<a class="edit" href="javascript:void(0)" title="编辑">编辑</a>'+'&nbsp;|&nbsp;'+
				'<a class="del" href="javascript:void(0)" title="删除">删除</a>' 
		].join('');
	}
	window.actionEvents = {
			//对应class="get"的操作
		'click .get' : function(e, value, row, index) {
			parentOpenGet('查看用户信息','${ctx}/permissions/zbgc/view.do?id='+row.gcGuid,'1300px','600px')
		},
		'click .edit' : function(e, value, row, index) {
			parentOpenEdit('编辑用户信息','${ctx}/permissions/zbgc/edit.do?id='+row.gcGuid,'1300px','700px')
		},
		'click .del' : function(e, value, row, index) {
			layer.confirm("删除后数据不可恢复，是否确定删除？", function(){
            	//继续删除
		  		$.ajax({
					type : "post",
					url : "${ctx}/permissions/zbgc/action.do?id="+row.gcGuid+"&actionName=sc",
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
		}
	};
	//bootstrap-table设置查询参数
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
	<div id="toolbar" style="margin-left:10px;">
   		<button type="button" class="btn btn-success" id="add" >新增</button>
   		<button type="button" class="btn btn-info" id="edit" >编辑</button>
    	<button type="button" class="btn btn-warning" id="del" >删除</button>
	    <button type="button" class="btn btn-success" style="display: none;" id="find" >搜索</button>
	</div>
	<table id="table" data-toggle="table" data-url="${ctx }/permissions/zbgc/queryAllJson.do"
		data-pagination="true" data-side-pagination="server" data-show-refresh="true"
		data-page-list="${PAGE_LIST }" data-search="true"
		data-click-to-select="true" data-show-columns="true"
		data-toolbar="#toolbar" data-sort-name="GC_GUID" data-sort-order="desc"
		data-query-params="queryParams" data-height="100%">
		<thead>
			<tr>
				<th  data-checkbox="true" ></th>
				<th data-formatter="indexFormatter">序号</th>
				<th data-field="gcBh" data-sortable="true">工程编号</th>
				<th data-field="gcName" data-sortable="true">工程名称</th>
				<th data-field="zbFangshi" data-sortable="true">招标方式</th>
				<th data-field="zsFangshi" data-sortable="true">资审方式</th>
				<th data-field="zbrBh" data-sortable="true">招标人编号</th>
				<th data-field="zbrName" data-sortable="true">招标人名称</th>
				<th data-field="createTime" data-sortable="true">创建时间</th>
				<th data-field="creatorGuid" data-sortable="true">创建人id</th>
				<th data-field="creatorName" data-sortable="true">创建人名称</th>
				<th data-field="modifyTime" data-sortable="true">修改时间</th>
				<th data-field="modifyerName" data-sortable="true">修改人</th>
				<th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">操作</th>
			</tr>
		</thead>
	</table>
</body>
</html>
