<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>zb_gc_bd管理页面</title>
</head>
<script type="text/javascript">
	$(function () { 
	   	$("#add").click(function(){
	   		parentOpenEdit('添加zb_gc_bd','${ctx }/permissions/zbgcbd/edit.do','1300px','700px')
	   	});
	   	$("#edit").click(function(){
			var $table = $('#table');
	   	 	var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
            	return row.bdGuid;
            });
	   	 	if(ids.length == 0){
		   	 	layer.alert("请选择一项进行编辑！");
				return false;
			}
	   	 	parentOpenEdit('编辑zb_gc_bd','${ctx }/permissions/zbgcbd/edit.do?id='+ids,'1300px','700px')
	   	});
		$("#del").click(function(){
		
			var $table = $('#table');
	   	 	var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
            	return row.bdGuid;
            });
            if(ids.length == 0){
		   	 	layer.alert("还没有选择,请至少选择一项进行删除");
				return false;
			}
            layer.confirm("删除后数据不可恢复，是否确定删除？", function(){
            	//继续删除
		  		$.ajax({
					type : "post",
					url : "${ctx}/permissions/zbgcbd/action.do?id="+ids+"&actionName=sc",
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
			parentOpenGet('查看zb_gc_bd','${ctx}/permissions/zbgcbd/view.do?id='+row.bdGuid,'1200px','600px')
		},
		'click .edit' : function(e, value, row, index) {
			parentOpenEdit('编辑zb_gc_bd','${ctx}/permissions/zbgcbd/edit.do?id='+row.bdGuid,'1200px','700px')
		},
		'click .del' : function(e, value, row, index) {
			layer.confirm("删除后数据不可恢复，是否确定删除？", function(){
            	//继续删除
		  		$.ajax({
					type : "post",
					url : "${ctx}/permissions/zbgcbd/action.do?id="+row.bdGuid+"&actionName=sc",
					success : function(data) {
						if(data.code==200){
							layer.msg("删除成功", {icon: 1,time: 2000});
						}else{
							layer.alert(data.message+"!", {icon: 2});
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
    	<button type="button" class="btn btn-danger" id="del" >删除</button>
	    <button type="button" class="btn btn-success" style="display: none;" id="find" >搜索</button>
	</div>
	<table id="table" data-toggle="table" data-url="${ctx }/permissions/zbgcbd/queryAllJson.do"
		data-pagination="true" data-side-pagination="server" data-show-refresh="true"
		data-page-list="${PAGE_LIST }" data-search="true"
		data-content-type="application/x-www-form-urlencoded" data-method="post"
		data-click-to-select="true" data-show-columns="true" 
		data-toolbar="#toolbar" data-sort-order="desc"
		data-query-params="queryParams" data-height="100%">
		<thead>
			<tr>
				<th  data-checkbox="true" ></th>
				<th data-formatter="indexFormatter">序号</th>
				<th data-field="bdGuid" data-sortable="true">标段id</th>
				<th data-field="gcGuid" data-sortable="true">工程id</th>
				<th data-field="bdBh" data-sortable="true">标段编号</th>
				<th data-field="bdName" data-sortable="true">标段名称</th>
				<th data-field="pbBanfa" data-sortable="true">评标办法</th>
				<th data-field="createTime" data-sortable="true">创建时间</th>
				<th data-field="isDeleted" data-sortable="true">是否删除</th>
				<th data-field="modifyTime" data-sortable="true">修改时间</th>
				<th data-field="pbFangshi" data-sortable="true">评标方式</th>
				<th data-field="isJieshouLianheti" data-sortable="true">是否接受联合体投标</th>
				<th data-field="isPtfwf" data-sortable="true">是否收取平台服务费</th>
				<th data-field="ptfwfShouqufangshi" data-sortable="true">平台服务费市区方式【“按金额收取”和“按比例收取”】</th>
				<th data-field="bzjJisuanfangshi" data-sortable="true">保证金计算方式【固定金额、固定比例】</th>
				<th data-field="isZbkzj" data-sortable="true">是否有招标控制价【1：是，0：否】</th>
				<th data-field="kaibiaoXingshi" data-sortable="true">开标形式【线上开标、线下开标】</th>
				<th data-field="pingbiaoXingshi" data-sortable="true">评标形式【线上评标、线下评标】</th>
				<th data-field="bzjJineBili" data-sortable="true">投标保证金，金额或者比例</th>
				<th data-field="ptfwfJine" data-sortable="true">收取金额或收取比例</th>
				<th data-field="isQingdanwenjian" data-sortable="true">是否有清单文件【1：是，0：否】</th>
				<th data-field="zbwjFabutime" data-sortable="true">招标文件发布时间</th>
				<th data-field="yswjIssell" data-sortable="true">是否出售资格预审文件</th>
				<th data-field="yswjbsJine" data-sortable="true">资格预审文件标书费用金额</th>
				<th data-field="zbwjIssell" data-sortable="true">是否出售招标文件</th>
				<th data-field="zbwjbsJine" data-sortable="true">招标文件标书费用金额</th>
				<th data-field="isTuzhiwenjian" data-sortable="true">是否有图纸文件的选择</th>
				<th data-field="yajinjine" data-sortable="true">图纸文件的押金金额</th>
				<th data-field="bdContent" data-sortable="true">标段内容</th>
				<th data-field="dayLimit" data-sortable="true">工期限制</th>
				<th data-field="jiansheaddress" data-sortable="true">建设地址</th>
				<th data-field="transporttype" data-sortable="true">运输方式</th>
				<th data-field="arrivestation" data-sortable="true">到站</th>
				<th data-field="paytype" data-sortable="true">货款结算办法</th>
				<th data-field="deliverydate" data-sortable="true">交货期</th>
				<th data-field="delivertype" data-sortable="true">交货方式</th>
				<th data-field="deliveraddress" data-sortable="true">交货地点</th>
				<th data-field="filetoaddress" data-sortable="true">文件递交地点</th>
				<th data-field="coverArea" data-sortable="true">建筑面积</th>
				<th data-field="structLayer" data-sortable="true">结构</th>
				<th data-field="structFloor" data-sortable="true">层数</th>
				<th data-field="bzjJiaonafangshi" data-sortable="true">保证金缴纳方式【1：系统自动生成保证金收款账号、2：招标文件指定账号】</th>
				<th data-field="kbPlace" data-sortable="true">开标地点</th>
				<th data-field="yskbPlace" data-sortable="true">预审开标地点</th>
				<th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">操作</th>
			</tr>
		</thead>
	</table>
</body>
</html>
