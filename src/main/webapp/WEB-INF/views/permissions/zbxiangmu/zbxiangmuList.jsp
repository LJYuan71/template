<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>招标项目管理页面</title>
</head>
<script type="text/javascript">
	$(function () { 
	   	$("#add").click(function(){
	   		parentOpenEdit('添加','${ctx }/permissions/zbxiangmu/edit.do','1300px','700px')
	   	});
	   	$("#edit").click(function(){
			var $table = $('#table');
	   	 	var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
            	return row.xmGuid;
            });
	   	 	if(ids.length == 0){
		   	 	layer.alert("请选择一项进行编辑！");
				return false;
			}
	   	 	parentOpenEdit('编辑用户信息','${ctx }/permissions/zbxiangmu/edit.do?id='+ids,'1300px','700px')
	   	});
		$("#del").click(function(){
		
			var $table = $('#table');
	   	 	var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
            	return row.xmGuid;
            });
            if(ids.length == 0){
		   	 	layer.alert("还没有选择,请至少选择一项进行删除");
				return false;
			}
            layer.confirm("删除后数据不可恢复，是否确定删除？", function(){
            	//继续删除
		  		$.ajax({
					type : "post",
					url : "${ctx}/permissions/zbxiangmu/action.do?id="+ids+"&actionName=sc",
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
			parentOpenGet('查看用户信息','${ctx}/permissions/zbxiangmu/view.do?id='+row.xmGuid,'1300px','600px')
		},
		'click .edit' : function(e, value, row, index) {
			parentOpenEdit('编辑用户信息','${ctx}/permissions/zbxiangmu/edit.do?id='+row.xmGuid,'1300px','700px')
		},
		'click .del' : function(e, value, row, index) {
			layer.confirm("删除后数据不可恢复，是否确定删除？", function(){
            	//继续删除
		  		$.ajax({
					type : "post",
					url : "${ctx}/permissions/zbxiangmu/action.do?id="+row.xmGuid+"&actionName=sc",
					success : function(data) {
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
	<table id="table" data-toggle="table" data-url="${ctx }/permissions/zbxiangmu/queryAllJson.do"
		data-pagination="true" data-side-pagination="server" data-show-refresh="true"
		data-page-list="${PAGE_LIST }" data-search="true"
		data-click-to-select="true" data-show-columns="true"
		data-toolbar="#toolbar" data-sort-name="XM_GUID" data-sort-order="desc"
		data-query-params="queryParams" data-height="100%">
		<thead>
			<tr>
				<th  data-checkbox="true" ></th>
				<th data-formatter="indexFormatter">序号</th>
				<th data-field="xmGuid" data-sortable="true">项目id</th>
				<th data-field="xmBaojianBh" data-sortable="true">项目报建id</th>
				<th data-field="xmBh" data-sortable="true">项目编号</th>
				<th data-field="xmName" data-sortable="true">项目名称</th>
				<th data-field="xmDizhi" data-sortable="true">项目地址</th>
				<th data-field="isZhongdaXm" data-sortable="true">是否重大项目</th>
				<th data-field="zhongdaXmBh" data-sortable="true">重大项目编号</th>
				<th data-field="zhongdaXmName" data-sortable="true">重大项目名称</th>
				<th data-field="isChangwaiXm" data-sortable="true">是否场外项目</th>
				<th data-field="isZhengfuTouzi" data-sortable="true">是否政府投资</th>
				<th data-field="zhuguanBumenBh" data-sortable="true">主管部门编号</th>
				<th data-field="zhuguanBumenName" data-sortable="true">主管部门名称</th>
				<th data-field="jihuaLixiangBh" data-sortable="true">计划立项文号</th>
				<th data-field="jihuaLixiangFujian" data-sortable="true">计划立项文号附件</th>
				<th data-field="jihuaLixiangFujianName" data-sortable="true">计划立项文号附件名称</th>
				<th data-field="guihuaXukeBh" data-sortable="true">规划许可证号</th>
				<th data-field="guihuaXukeFujian" data-sortable="true">规划许可证附件组</th>
				<th data-field="guihuaXukeFujianName" data-sortable="true">规划许可证附件名称</th>
				<th data-field="zongdiBh" data-sortable="true">宗地号</th>
				<th data-field="qitaPifuBh" data-sortable="true">其他批复文号</th>
				<th data-field="qitaPifuFujian" data-sortable="true">其他批复文号附件组</th>
				<th data-field="qitaPifuFujianName" data-sortable="true">其他批复文号附件名称</th>
				<th data-field="zbrGuid" data-sortable="true">其他批复文号附件名称</th>
				<th data-field="zbrBh" data-sortable="true">建设单位编号</th>
				<th data-field="zbrName" data-sortable="true">建设单位名称</th>
				<th data-field="lianxirenName" data-sortable="true">单位联系人</th>
				<th data-field="lianxirenPhone" data-sortable="true">联系人电话</th>
				<th data-field="lianxirenMobile" data-sortable="true">联系人手机号</th>
				<th data-field="xingzhengDiquBh" data-sortable="true">项目所在行政区代码</th>
				<th data-field="hangyeBh" data-sortable="true">项目行业分类</th>
				<th data-field="zijinLaiyuanZhengfu" data-sortable="true">政府投资比例</th>
				<th data-field="zijinLaiyuanGuoqi" data-sortable="true">国企投资比例</th>
				<th data-field="zijinLaiyuanSiqi" data-sortable="true">私企投资比例</th>
				<th data-field="zijinLaiyuanJiti" data-sortable="true">集体投资比例</th>
				<th data-field="zijinLaiyuanWaizi" data-sortable="true">外资投资比例</th>
				<th data-field="zijinLaiyuanQita" data-sortable="true">其他投资比例</th>
				<th data-field="jingbanrenName" data-sortable="true">经办人</th>
				<th data-field="jingbanrenMobile" data-sortable="true">经办人手机</th>
				<th data-field="jingbanrenPhone" data-sortable="true">经办人联系电话</th>
				<th data-field="jingbanrenWeixin" data-sortable="true">经办人微信号</th>
				<th data-field="jiansheGuimo" data-sortable="true">建设规模</th>
				<th data-field="jihuaZongtouziBizhong" data-sortable="true">计划总投资币种</th>
				<th data-field="jihuaZongtouziJe" data-sortable="true">计划总投资金额</th>
				<th data-field="jianzhuMianji" data-sortable="true">建筑面积</th>
				<th data-field="teshuQingkuang" data-sortable="true">特殊情况说明</th>
				<th data-field="teshuQingkuangFujian" data-sortable="true">特殊说明附件组</th>
				<th data-field="teshuQingkuangFujianName" data-sortable="true">特殊说明附件名称</th>
				<th data-field="createTime" data-sortable="true">创建时间</th>
				<th data-field="creatorGuid" data-sortable="true">创建人id</th>
				<th data-field="creatorName" data-sortable="true">创建人名称</th>
				<th data-field="modifyTime" data-sortable="true">创建人名称</th>
				<th data-field="modifierName" data-sortable="true">修改时间</th>
				<th data-field="baojianQiyeBh" data-sortable="true">报建企业编号</th>
				<th data-field="shenpiZhuangtai" data-sortable="true">审批状态</th>
				<th data-field="isDeleted" data-sortable="true">是否删除状态</th>
				<th data-field="isYingjiGc" data-sortable="true">是否应急项目</th>
				<th data-field="isDoudiXinzeng" data-sortable="true">是否兜底方案新增</th>
				<th data-field="isDoudiXiugai" data-sortable="true">是否兜底方案修改</th>
				<th data-field="serialNumber" data-sortable="true">项目流水号</th>
				<th data-field="applyTime" data-sortable="true">申请时间</th>
				<th data-field="proClassification" data-sortable="true">项目分类</th>
				<th data-field="proClassificationSub" data-sortable="true">项目分类-二级子类</th>
				<th data-field="keyArea" data-sortable="true">是否重点区域</th>
				<th data-field="keyAreaName" data-sortable="true">重点区域名称</th>
				<th data-field="approvalrecordNumber" data-sortable="true">核准备案证编号</th>
				<th data-field="landplanningPermission" data-sortable="true">建设工程用地许可证</th>
				<th data-field="xmLaiyuan" data-sortable="true">项目来源</th>
				<th data-field="xieyiDanweiBh" data-sortable="true">协议单位编号</th>
				<th data-field="xieyiDanweiName" data-sortable="true">协议单位名称</th>
				<th data-field="xmBh2" data-sortable="true">项目编号2</th>
				<th data-field="province" data-sortable="true">省id</th>
				<th data-field="city" data-sortable="true">市id</th>
				<th data-field="area" data-sortable="true">区id</th>
				<th data-field="queRen" data-sortable="true">是否最终确认</th>
				<th data-field="zijinLaiyuan" data-sortable="true">资金来源</th>
				<th data-field="hangyeBhErji" data-sortable="true">二级行业编号</th>
				<th data-field="otherZbrGuid" data-sortable="true">其他招标人id</th>
				<th data-field="otherZbrBh" data-sortable="true">其他招标人编号</th>
				<th data-field="otherZbrName" data-sortable="true">其他招标人名称</th>
				<th data-field="xiangmuwenjian" data-sortable="true">项目文件</th>
				<th data-field="xiangmuwenjianoldname" data-sortable="true">旧的项目文件</th>
				<th data-field="isTask" data-sortable="true">是否指派项目</th>
				<th data-field="fzrGuid" data-sortable="true">负责人id</th>
				<th data-field="taskzpGuid" data-sortable="true">任务指派id</th>
				<th data-field="zbrAddress" data-sortable="true">招标人地址</th>
				<th data-field="xmPtbh" data-sortable="true">项目平台编号</th>
				<th data-field="hangyeBhSanji" data-sortable="true">行业三级分类</th>
				<th data-field="hangyeBhSiji" data-sortable="true">行业四级分类</th>
				<th data-field="maxLiushui" data-sortable="true">项目下招标项目的最大流水</th>
				<th data-field="deletedLiushui" data-sortable="true">项目下删除的招标项目的流水号 </th>
				<th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">操作</th>
			</tr>
		</thead>
	</table>
</body>
</html>
