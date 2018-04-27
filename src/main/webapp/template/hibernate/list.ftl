<#import "function.ftl" as func>
<#assign pk=func.getPk(model) >
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${model.tabComment}列表页面</title><#noparse><#include "/head.html"/></#noparse>
<script type="text/javascript" src="<#noparse>${</#noparse>base}/html/xmzl/action_common.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		//回车键搜索
		$("input").keyup(function(event){
			var e = event || window.event ;
			if (e && e.keyCode == 13) { // enter 键
				$("#dg").datagrid("load", createQueryParams());
			}
		});
		//清空搜索条件
		$("#clearSearch").click(function() {
			$(".queryForm").form("clear");
		});

		//点击搜索
		$("#search").click(function() {
			$("#dg").datagrid("load", createQueryParams());
		});
	});
	//查询条件
	var createQueryParams = function() {
		var jsonInfo = $(".queryForm").serializeObject();
		chgDateToLong(jsonInfo, "hyDate");
		return jsonInfo;
	};
	
	function showTab(iName, iUrl, guid, flag) {
		if (!guid)
			return;
		if (!iUrl)
			return;
		var name = iName || 'tab';
		var tabText = "<lable>" + name + "<span style='display:none'>" + guid
				+ "</span></lable>";
		var urlTmp = iUrl + "?dataGuid=" + guid;
		parent.addPanel(tabText, urlTmp, true);
	}
	//操作
	fucntion actionEvents(val, row, index){
		var ck = '<a href="javascript:showTab(\'查看${model.tabComment}\',\'${packagename}/${packagename}_view.html\',\''
				+ row.guid + '\')" title="查看">查看</a>';
		var bj = '<a href="javascript:showTab(\'编辑${model.tabComment}\',\'${packagename}/${packagename}_edit.html\',\''
					+ row.guid + '\')" title="编辑">编辑</a>';
		var sc = '<a href="javascript:del(\'' + val + '\')">删除</a>&nbsp;|&nbsp';
		return bj + "&nbsp;|&nbsp;" + ck + "&nbsp;|&nbsp;" + sc;
	}
	
	//删除
	function del(guid) {
		if (!guid)
			return;
		var dataObj = {};
		dataObj['guid'] = guid;
		dataObj['isShow'] = false;//不居中弹窗显示
		czActions('<#noparse>${</#noparse>base}/${modular}/${packagename}/action.do', $("#dg"), dataObj, 'sc');
	}
	//失效
	function shiXiao(guid) {
		if (!guid)
			return;
		var dataObj = {};
		dataObj['guid'] = guid;
		dataObj['isShow'] = false;//不居中弹窗显示
		dataObj['tableId'] = $("#dg");//刷新table
		dataObj['url'] = '<#noparse>${</#noparse>base}/${modular}/${packagename}/action.do';
		dataObj['actionName'] = 'sx';
		$.messager.confirm('确认失效', '确认要失效？', function(r) {
			if (r) {
				czObjectByGuid(dataObj);
			}
		});
	}
	//页面大小动态调整
	$(window).resize(function() {
		$('#dg').datagrid('resize');
	});
	//刷新
	function refreshFunc() {
		$('#dg').datagrid('reload');
	}
</script>
<body>
	<div class="divMainContent">
		<div class="big_title">
			<div class="tool_bar">
				<!-- <span class="btn save" style="text-align:center" onclick="showHelp(126,126)">系统帮助</span> -->
				<span class="btn save" onclick="parent.addPanel('新增${model.tabComment}', '<#noparse>${</#noparse>base}/${packagename}_Edit.html',true);"><i></i>新增</span>
			</div>
			<h2>
				${model.tabComment}<a href="javascript:void(0);">高级搜索</a>
			</h2>
		</div>
		<div class="advanced_search">
			<form class="queryForm">
				<span id="clearSearch" class="submit_btn">清空</span> <span
					id="search" class="submit_btn">搜 索</span>
				<ul>
					<li>
						<label>搜索条件:</label><input id="" name="" type="text"/>
					</li>
					<li>
						<label>...</label><input id="" name=""type="text" />
					</li>
					
				</ul>
			</form>
		</div>
		<div class="main_con">
			<table id="dg" class=""
				data-options="url:'<#noparse>${</#noparse>base}/${modular}/${packagename}/queryAll.do',rownumbers:true,pagination:true">
				<thead>
					<tr>
						<#list model.columnList as col>
						<#if col.colType=="Long" && (col.columnName?index_of("TIME")!=-1||col.columnName?index_of("time"))>
						<th data-options="field:'${func.convertUnderLine(col.columnName)}',align:'center', formatter:formatToDateTimes">${col.comment}</th>
						<#else>
						<th data-options="field:'${func.convertUnderLine(col.columnName)}'">${col.comment}</th>
						</#if>
						</#list>
						<th data-options="field:'guid',formatter:actionEvents,width:150,align:'center'">操作</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</body>
</html>
