<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>招标项目编辑页面</title>
<script>
   	$(function(){
   		//Validform表单验证
   		$("#zBXiangMuForm").Validform();
   		var options = {
		   beforeSubmit: showRequest,  //提交前的回调函数
		   success: showResponse,      //提交后的回调函数
		   timeout: 3000               //限制请求的时间，当请求大于3秒后，跳出请求
		}
		//jquery.form表单提交
		function showRequest(formData, jqForm, options){
		   	return true;  //只要不返回false，表单都会提交,在这里可以对表单元素进行验证
		};
		function showResponse(responseText, statusText){
			if (responseText.code == 200) {
				 layer.alert('保存成功！',{title:'提示'},function(index){
					parentEditCloseWin();
				});
			}else {
				//失败
				layer.alert(responseText.message+"!", {icon: 1});
			}
		};
   	})
</script>
</head>

<body class="gray-bg">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content" style="display: block;">
						<form class="form-horizontal" method="post" id="zBXiangMuForm" action="${ctx }/permissions/zbxiangmu/save.do">
							<div class="form-group">
								<label class="col-sm-2 control-label">项目id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xmGuid" value="${zBXiangMu.xmGuid }">
								</div>
								<label class="col-sm-2 control-label">项目报建id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xmBaojianBh" value="${zBXiangMu.xmBaojianBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xmBh" value="${zBXiangMu.xmBh }">
								</div>
								<label class="col-sm-2 control-label">项目名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xmName" value="${zBXiangMu.xmName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目地址:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xmDizhi" value="${zBXiangMu.xmDizhi }">
								</div>
								<label class="col-sm-2 control-label">是否重大项目:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isZhongdaXm" value="${zBXiangMu.isZhongdaXm }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">重大项目编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zhongdaXmBh" value="${zBXiangMu.zhongdaXmBh }">
								</div>
								<label class="col-sm-2 control-label">重大项目名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zhongdaXmName" value="${zBXiangMu.zhongdaXmName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否场外项目:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isChangwaiXm" value="${zBXiangMu.isChangwaiXm }">
								</div>
								<label class="col-sm-2 control-label">是否政府投资:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isZhengfuTouzi" value="${zBXiangMu.isZhengfuTouzi }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">主管部门编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zhuguanBumenBh" value="${zBXiangMu.zhuguanBumenBh }">
								</div>
								<label class="col-sm-2 control-label">主管部门名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zhuguanBumenName" value="${zBXiangMu.zhuguanBumenName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">计划立项文号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jihuaLixiangBh" value="${zBXiangMu.jihuaLixiangBh }">
								</div>
								<label class="col-sm-2 control-label">计划立项文号附件:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jihuaLixiangFujian" value="${zBXiangMu.jihuaLixiangFujian }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">计划立项文号附件名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jihuaLixiangFujianName" value="${zBXiangMu.jihuaLixiangFujianName }">
								</div>
								<label class="col-sm-2 control-label">规划许可证号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="guihuaXukeBh" value="${zBXiangMu.guihuaXukeBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">规划许可证附件组:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="guihuaXukeFujian" value="${zBXiangMu.guihuaXukeFujian }">
								</div>
								<label class="col-sm-2 control-label">规划许可证附件名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="guihuaXukeFujianName" value="${zBXiangMu.guihuaXukeFujianName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">宗地号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zongdiBh" value="${zBXiangMu.zongdiBh }">
								</div>
								<label class="col-sm-2 control-label">其他批复文号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="qitaPifuBh" value="${zBXiangMu.qitaPifuBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">其他批复文号附件组:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="qitaPifuFujian" value="${zBXiangMu.qitaPifuFujian }">
								</div>
								<label class="col-sm-2 control-label">其他批复文号附件名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="qitaPifuFujianName" value="${zBXiangMu.qitaPifuFujianName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">其他批复文号附件名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbrGuid" value="${zBXiangMu.zbrGuid }">
								</div>
								<label class="col-sm-2 control-label">建设单位编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbrBh" value="${zBXiangMu.zbrBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">建设单位名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbrName" value="${zBXiangMu.zbrName }">
								</div>
								<label class="col-sm-2 control-label">单位联系人:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="lianxirenName" value="${zBXiangMu.lianxirenName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">联系人电话:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="lianxirenPhone" value="${zBXiangMu.lianxirenPhone }">
								</div>
								<label class="col-sm-2 control-label">联系人手机号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="lianxirenMobile" value="${zBXiangMu.lianxirenMobile }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目所在行政区代码:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xingzhengDiquBh" value="${zBXiangMu.xingzhengDiquBh }">
								</div>
								<label class="col-sm-2 control-label">项目行业分类:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="hangyeBh" value="${zBXiangMu.hangyeBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">政府投资比例:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zijinLaiyuanZhengfu" value="${zBXiangMu.zijinLaiyuanZhengfu }">
								</div>
								<label class="col-sm-2 control-label">国企投资比例:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zijinLaiyuanGuoqi" value="${zBXiangMu.zijinLaiyuanGuoqi }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">私企投资比例:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zijinLaiyuanSiqi" value="${zBXiangMu.zijinLaiyuanSiqi }">
								</div>
								<label class="col-sm-2 control-label">集体投资比例:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zijinLaiyuanJiti" value="${zBXiangMu.zijinLaiyuanJiti }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">外资投资比例:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zijinLaiyuanWaizi" value="${zBXiangMu.zijinLaiyuanWaizi }">
								</div>
								<label class="col-sm-2 control-label">其他投资比例:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zijinLaiyuanQita" value="${zBXiangMu.zijinLaiyuanQita }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jingbanrenName" value="${zBXiangMu.jingbanrenName }">
								</div>
								<label class="col-sm-2 control-label">经办人手机:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jingbanrenMobile" value="${zBXiangMu.jingbanrenMobile }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人联系电话:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jingbanrenPhone" value="${zBXiangMu.jingbanrenPhone }">
								</div>
								<label class="col-sm-2 control-label">经办人微信号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jingbanrenWeixin" value="${zBXiangMu.jingbanrenWeixin }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">建设规模:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jiansheGuimo" value="${zBXiangMu.jiansheGuimo }">
								</div>
								<label class="col-sm-2 control-label">计划总投资币种:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jihuaZongtouziBizhong" value="${zBXiangMu.jihuaZongtouziBizhong }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">计划总投资金额:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jihuaZongtouziJe" value="${zBXiangMu.jihuaZongtouziJe }">
								</div>
								<label class="col-sm-2 control-label">建筑面积:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jianzhuMianji" value="${zBXiangMu.jianzhuMianji }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">特殊情况说明:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="teshuQingkuang" value="${zBXiangMu.teshuQingkuang }">
								</div>
								<label class="col-sm-2 control-label">特殊说明附件组:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="teshuQingkuangFujian" value="${zBXiangMu.teshuQingkuangFujian }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">特殊说明附件名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="teshuQingkuangFujianName" value="${zBXiangMu.teshuQingkuangFujianName }">
								</div>
								<label class="col-sm-2 control-label">创建时间:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="createTime" value="${zBXiangMu.createTime }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">创建人id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="creatorGuid" value="${zBXiangMu.creatorGuid }">
								</div>
								<label class="col-sm-2 control-label">创建人名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="creatorName" value="${zBXiangMu.creatorName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">创建人名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="modifyTime" value="${zBXiangMu.modifyTime }">
								</div>
								<label class="col-sm-2 control-label">修改时间:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="modifierName" value="${zBXiangMu.modifierName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">报建企业编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="baojianQiyeBh" value="${zBXiangMu.baojianQiyeBh }">
								</div>
								<label class="col-sm-2 control-label">审批状态:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="shenpiZhuangtai" value="${zBXiangMu.shenpiZhuangtai }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否删除状态:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isDeleted" value="${zBXiangMu.isDeleted }">
								</div>
								<label class="col-sm-2 control-label">是否应急项目:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isYingjiGc" value="${zBXiangMu.isYingjiGc }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否兜底方案新增:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isDoudiXinzeng" value="${zBXiangMu.isDoudiXinzeng }">
								</div>
								<label class="col-sm-2 control-label">是否兜底方案修改:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isDoudiXiugai" value="${zBXiangMu.isDoudiXiugai }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目流水号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="serialNumber" value="${zBXiangMu.serialNumber }">
								</div>
								<label class="col-sm-2 control-label">申请时间:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="applyTime" value="${zBXiangMu.applyTime }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目分类:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="proClassification" value="${zBXiangMu.proClassification }">
								</div>
								<label class="col-sm-2 control-label">项目分类-二级子类:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="proClassificationSub" value="${zBXiangMu.proClassificationSub }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否重点区域:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="keyArea" value="${zBXiangMu.keyArea }">
								</div>
								<label class="col-sm-2 control-label">重点区域名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="keyAreaName" value="${zBXiangMu.keyAreaName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">核准备案证编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="approvalrecordNumber" value="${zBXiangMu.approvalrecordNumber }">
								</div>
								<label class="col-sm-2 control-label">建设工程用地许可证:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="landplanningPermission" value="${zBXiangMu.landplanningPermission }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目来源:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xmLaiyuan" value="${zBXiangMu.xmLaiyuan }">
								</div>
								<label class="col-sm-2 control-label">协议单位编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xieyiDanweiBh" value="${zBXiangMu.xieyiDanweiBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">协议单位名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xieyiDanweiName" value="${zBXiangMu.xieyiDanweiName }">
								</div>
								<label class="col-sm-2 control-label">项目编号2:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xmBh2" value="${zBXiangMu.xmBh2 }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">省id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="province" value="${zBXiangMu.province }">
								</div>
								<label class="col-sm-2 control-label">市id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="city" value="${zBXiangMu.city }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">区id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="area" value="${zBXiangMu.area }">
								</div>
								<label class="col-sm-2 control-label">是否最终确认:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="queRen" value="${zBXiangMu.queRen }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">资金来源:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zijinLaiyuan" value="${zBXiangMu.zijinLaiyuan }">
								</div>
								<label class="col-sm-2 control-label">二级行业编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="hangyeBhErji" value="${zBXiangMu.hangyeBhErji }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">其他招标人id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="otherZbrGuid" value="${zBXiangMu.otherZbrGuid }">
								</div>
								<label class="col-sm-2 control-label">其他招标人编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="otherZbrBh" value="${zBXiangMu.otherZbrBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">其他招标人名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="otherZbrName" value="${zBXiangMu.otherZbrName }">
								</div>
								<label class="col-sm-2 control-label">项目文件:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xiangmuwenjian" value="${zBXiangMu.xiangmuwenjian }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">旧的项目文件:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xiangmuwenjianoldname" value="${zBXiangMu.xiangmuwenjianoldname }">
								</div>
								<label class="col-sm-2 control-label">是否指派项目:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isTask" value="${zBXiangMu.isTask }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">负责人id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="fzrGuid" value="${zBXiangMu.fzrGuid }">
								</div>
								<label class="col-sm-2 control-label">任务指派id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="taskzpGuid" value="${zBXiangMu.taskzpGuid }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标人地址:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbrAddress" value="${zBXiangMu.zbrAddress }">
								</div>
								<label class="col-sm-2 control-label">项目平台编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xmPtbh" value="${zBXiangMu.xmPtbh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">行业三级分类:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="hangyeBhSanji" value="${zBXiangMu.hangyeBhSanji }">
								</div>
								<label class="col-sm-2 control-label">行业四级分类:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="hangyeBhSiji" value="${zBXiangMu.hangyeBhSiji }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目下招标项目的最大流水:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="maxLiushui" value="${zBXiangMu.maxLiushui }">
								</div>
								<label class="col-sm-2 control-label">项目下删除的招标项目的流水号 :</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="deletedLiushui" value="${zBXiangMu.deletedLiushui }">
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button class="btn btn-primary" id="submit" style="display: none;">保存内容</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
