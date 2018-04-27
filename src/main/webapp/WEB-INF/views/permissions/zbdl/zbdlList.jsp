<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>工程-招标代理管理页面</title>
</head>
<script type="text/javascript">
	$(function () { 
	   	$("#add").click(function(){
	   		parentOpenEdit('添加','${ctx }/permissions/zbdl/edit.do','1300px','700px')
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
	   	 	parentOpenEdit('编辑用户信息','${ctx }/permissions/zbdl/edit.do?id='+ids,'1300px','700px')
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
					url : "${ctx}/permissions/zbdl/action.do?id="+ids+"&actionName=sc",
					success : function(data) {
						if(data.code==200){
							layer.msg("删除成功", {icon: 1,time: 2000});
						}else{
							layer.alert(data.message+"!", {icon: 1});
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
			parentOpenGet('查看用户信息','${ctx}/permissions/zbdl/view.do?id='+row.guid,'1300px','600px')
		},
		'click .edit' : function(e, value, row, index) {
			parentOpenEdit('编辑用户信息','${ctx}/permissions/zbdl/edit.do?id='+row.guid,'1300px','700px')
		},
		'click .del' : function(e, value, row, index) {
			layer.confirm("删除后数据不可恢复，是否确定删除？", function(){
            	//继续删除
		  		$.ajax({
					type : "post",
					url : "${ctx}/permissions/zbdl/action.do?id="+row.guid+"&actionName=sc",
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
	<table id="table" data-toggle="table" data-url="${ctx }/permissions/zbdl/queryAllJson.do"
		data-pagination="true" data-side-pagination="server" data-show-refresh="true"
		data-page-list="${PAGE_LIST }" data-search="true"
		data-click-to-select="true" data-show-columns="true"
		data-toolbar="#toolbar" data-sort-name="GC_ZBDL_GUID" data-sort-order="desc"
		data-query-params="queryParams" data-height="100%">
		<thead>
			<tr>
				<th  data-checkbox="true" ></th>
				<th data-formatter="indexFormatter">序号</th>
				<th data-field="gcZbdlGuid" data-sortable="true">主键id</th>
				<th data-field="gcGuid" data-sortable="true">工程id</th>
				<th data-field="shixiangGuid" data-sortable="true">事项id</th>
				<th data-field="zbdlGuid" data-sortable="true">招标代理id</th>
				<th data-field="zbdlBh" data-sortable="true">招标代理编号</th>
				<th data-field="zbdlName" data-sortable="true">招标代理名称</th>
				<th data-field="zbdlZizhiDengji" data-sortable="true">资质等级</th>
				<th data-field="zbdlZizhiZhengshuBh" data-sortable="true">资质证书号</th>
				<th data-field="zbdlFuzerenName" data-sortable="true">负责人</th>
				<th data-field="zbdlFuzerenZhiwu" data-sortable="true">负责人职务</th>
				<th data-field="zbdlZbFuzerenName" data-sortable="true">招标负责人</th>
				<th data-field="zbdlZbFuzerenPhone" data-sortable="true">招标负责人联系电话</th>
				<th data-field="zbdlZbFuzerenMobile" data-sortable="true">招标负责人手机</th>
				<th data-field="zbdlZbFuzerenEmail" data-sortable="true">招标负责人邮箱</th>
				<th data-field="zbdlJinbanrenName" data-sortable="true">经办人</th>
				<th data-field="zbdlJinbanrenMobile" data-sortable="true">经办人手机</th>
				<th data-field="zbdlJinbanrenEmail" data-sortable="true">经办人邮箱</th>
				<th data-field="zbdlJinbanrenPhone" data-sortable="true">经办人联系电话</th>
				<th data-field="xiugaiCishu" data-sortable="true">修改次数</th>
				<th data-field="isDeleted" data-sortable="true">是否删除</th>
				<th data-field="isDoudiXinzeng" data-sortable="true">是否兜底方案新增</th>
				<th data-field="isDoudiXiugai" data-sortable="true">是否兜底方案修改</th>
				<th data-field="modifyTime" data-sortable="true">修改时间</th>
				<th data-field="zbdlQuanxian" data-sortable="true">招标代理权限</th>
				<th data-field="zbdlAddress" data-sortable="true">招标代理机构地址</th>
				<th data-field="zbdlPostcode" data-sortable="true">招标代理机构邮编</th>
				<th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">操作</th>
			</tr>
		</thead>
	</table>
</body>
</html>
