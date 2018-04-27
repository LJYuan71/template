<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>招标工程表编辑页面</title>
<script>
   	$(function(){
   		//Validform表单验证
   		$("#zBGongChengForm").Validform();
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
						<form class="form-horizontal" method="post" id="zBGongChengForm" action="${ctx }/permissions/zbgc/save.do">
							<div class="form-group">
								<label class="col-sm-2 control-label">招标项目主键:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcGuid" value="${zBGongCheng.gcGuid }">
								</div>
								<label class="col-sm-2 control-label">事项id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="shixiangGuid" value="${zBGongCheng.shixiangGuid }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标报建编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcBaojianBh" value="${zBGongCheng.gcBaojianBh }">
								</div>
								<label class="col-sm-2 control-label">工程编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcBh" value="${zBGongCheng.gcBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">工程名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcName" value="${zBGongCheng.gcName }">
								</div>
								<label class="col-sm-2 control-label">工程类型:0工程，1国内货物，2服务，3国际货物:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcLeixing" value="${zBGongCheng.gcLeixing }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">工程其他类型:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcLeixingQita" value="${zBGongCheng.gcLeixingQita }">
								</div>
								<label class="col-sm-2 control-label">招标方式:公开招标，邀请招标:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbFangshi" value="${zBGongCheng.zbFangshi }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">资审方式:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zsFangshi" value="${zBGongCheng.zsFangshi }">
								</div>
								<label class="col-sm-2 control-label">是否场外工程:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isChangwaiGc" value="${zBGongCheng.isChangwaiGc }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否批量招标:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isPlzb" value="${zBGongCheng.isPlzb }">
								</div>
								<label class="col-sm-2 control-label">项目备案主管部门编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zhuguanBumenBh" value="${zBGongCheng.zhuguanBumenBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目备案主管部门名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zhuguanBumenName" value="${zBGongCheng.zhuguanBumenName }">
								</div>
								<label class="col-sm-2 control-label">招标人id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbrGuid" value="${zBGongCheng.zbrGuid }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标人编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbrBh" value="${zBGongCheng.zbrBh }">
								</div>
								<label class="col-sm-2 control-label">招标人名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbrName" value="${zBGongCheng.zbrName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">联系人名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="lianxirenName" value="${zBGongCheng.lianxirenName }">
								</div>
								<label class="col-sm-2 control-label">联系人电话:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="lianxirenPhone" value="${zBGongCheng.lianxirenPhone }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">联系人手机号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="lianxirenMobile" value="${zBGongCheng.lianxirenMobile }">
								</div>
								<label class="col-sm-2 control-label">招标人单位性质:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbrDanweiXingzhi" value="${zBGongCheng.zbrDanweiXingzhi }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标人单位级别:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbrDanweiJibie" value="${zBGongCheng.zbrDanweiJibie }">
								</div>
								<label class="col-sm-2 control-label">招标人所属系统:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbrSuoshuXitong" value="${zBGongCheng.zbrSuoshuXitong }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">采购机构:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="caigouJigou" value="${zBGongCheng.caigouJigou }">
								</div>
								<label class="col-sm-2 control-label">经办人:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jingbanrenName" value="${zBGongCheng.jingbanrenName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人手机:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jingbanrenMobile" value="${zBGongCheng.jingbanrenMobile }">
								</div>
								<label class="col-sm-2 control-label">经办人邮箱:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jingbanrenEmail" value="${zBGongCheng.jingbanrenEmail }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人联系电话:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jingbanrenPhone" value="${zBGongCheng.jingbanrenPhone }">
								</div>
								<label class="col-sm-2 control-label">经办人微信号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jingbanrenWeixin" value="${zBGongCheng.jingbanrenWeixin }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人QQ号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jingbanrenQq" value="${zBGongCheng.jingbanrenQq }">
								</div>
								<label class="col-sm-2 control-label">招标组织形式:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="cgZuzhiXingshi" value="${zBGongCheng.cgZuzhiXingshi }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">组织形式—其他:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbZuzhiXingshiQita" value="${zBGongCheng.zbZuzhiXingshiQita }">
								</div>
								<label class="col-sm-2 control-label">是否接受网上报名:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="bmWangshang" value="${zBGongCheng.bmWangshang }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否接受窗口报名:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="bmChuangkou" value="${zBGongCheng.bmChuangkou }">
								</div>
								<label class="col-sm-2 control-label">是否接受网上截标:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jbWangshang" value="${zBGongCheng.jbWangshang }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否接受窗口截标:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jbChuangkou" value="${zBGongCheng.jbChuangkou }">
								</div>
								<label class="col-sm-2 control-label">评标方式 1:电子评标 2:纸质评标:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="pbFangshi" value="${zBGongCheng.pbFangshi }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标组织形式:1自行组织招标 2委托招标:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbZuzhiXingshi" value="${zBGongCheng.zbZuzhiXingshi }">
								</div>
								<label class="col-sm-2 control-label">创建时间:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="createTime" value="${zBGongCheng.createTime }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">创建人id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="creatorGuid" value="${zBGongCheng.creatorGuid }">
								</div>
								<label class="col-sm-2 control-label">创建人名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="creatorName" value="${zBGongCheng.creatorName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">修改时间:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="modifyTime" value="${zBGongCheng.modifyTime }">
								</div>
								<label class="col-sm-2 control-label">修改人:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="modifyerName" value="${zBGongCheng.modifyerName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">报建企业编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="baojianQiyeBh" value="${zBGongCheng.baojianQiyeBh }">
								</div>
								<label class="col-sm-2 control-label">审批状态:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="shenpiZhuangtai" value="${zBGongCheng.shenpiZhuangtai }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否删除:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isDeleted" value="${zBGongCheng.isDeleted }">
								</div>
								<label class="col-sm-2 control-label">项目id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xmGuid" value="${zBGongCheng.xmGuid }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">主管部门编号2:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zhuguanBumenBh2" value="${zBGongCheng.zhuguanBumenBh2 }">
								</div>
								<label class="col-sm-2 control-label">监督部门编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jianduBumenBh" value="${zBGongCheng.jianduBumenBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">监督部门名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jianduBumenName" value="${zBGongCheng.jianduBumenName }">
								</div>
								<label class="col-sm-2 control-label">建设单位id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jsdwGuid" value="${zBGongCheng.jsdwGuid }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">建设单位编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jsdwBh" value="${zBGongCheng.jsdwBh }">
								</div>
								<label class="col-sm-2 control-label">公共服务编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gonggongFuwuBh" value="${zBGongCheng.gonggongFuwuBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否兜底新增:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isDoudiXinzeng" value="${zBGongCheng.isDoudiXinzeng }">
								</div>
								<label class="col-sm-2 control-label">是否兜底修改:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isDoudiXiugai" value="${zBGongCheng.isDoudiXiugai }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标分确定方式:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbrQuedingFangshi" value="${zBGongCheng.zbrQuedingFangshi }">
								</div>
								<label class="col-sm-2 control-label">是否中广核工程:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isZhongguanheGc" value="${zBGongCheng.isZhongguanheGc }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否批量招标2:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isPlzb2" value="${zBGongCheng.isPlzb2 }">
								</div>
								<label class="col-sm-2 control-label">招标代理id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlGuid" value="${zBGongCheng.zbdlGuid }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否旧数据:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isOlddata" value="${zBGongCheng.isOlddata }">
								</div>
								<label class="col-sm-2 control-label">工程父id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcGuidParent" value="${zBGongCheng.gcGuidParent }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">申报责任人:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="shenbaoZerenren" value="${zBGongCheng.shenbaoZerenren }">
								</div>
								<label class="col-sm-2 control-label">申报责任人编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="shenbaoZerenrenBh" value="${zBGongCheng.shenbaoZerenrenBh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">转招标方式:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zhuanZbFangshi" value="${zBGongCheng.zhuanZbFangshi }">
								</div>
								<label class="col-sm-2 control-label">分类代码:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="feileiDaima" value="${zBGongCheng.feileiDaima }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">协议单位编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xieyiDanweiBh" value="${zBGongCheng.xieyiDanweiBh }">
								</div>
								<label class="col-sm-2 control-label">协议单位名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xieyiDanweiName" value="${zBGongCheng.xieyiDanweiName }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">抽签原则:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="chouqianYuanze" value="${zBGongCheng.chouqianYuanze }">
								</div>
								<label class="col-sm-2 control-label">是否建筑工业化项目:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isJianzhuHangye" value="${zBGongCheng.isJianzhuHangye }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目编号2:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xmBh2" value="${zBGongCheng.xmBh2 }">
								</div>
								<label class="col-sm-2 control-label">工程编号2:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcBh2" value="${zBGongCheng.gcBh2 }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否需要业绩文件:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isXuyaoYejiwenjian" value="${zBGongCheng.isXuyaoYejiwenjian }">
								</div>
								<label class="col-sm-2 control-label">是否需要报名:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isBaoming" value="${zBGongCheng.isBaoming }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否确认:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isQueren" value="${zBGongCheng.isQueren }">
								</div>
								<label class="col-sm-2 control-label">项目类型:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="xmLeixing" value="${zBGongCheng.xmLeixing }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">服务费收取方式:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="fuwufeiShouquFs" value="${zBGongCheng.fuwufeiShouquFs }">
								</div>
								<label class="col-sm-2 control-label">服务费:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="fuwufei" value="${zBGongCheng.fuwufei }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">监督人编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="jiandurenbh" value="${zBGongCheng.jiandurenbh }">
								</div>
								<label class="col-sm-2 control-label">项目经理id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="projectManagerguid" value="${zBGongCheng.projectManagerguid }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目经理名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="projectManagername" value="${zBGongCheng.projectManagername }">
								</div>
								<label class="col-sm-2 control-label">招标说明:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbShuoming" value="${zBGongCheng.zbShuoming }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否依法报名:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isyifaBaoming" value="${zBGongCheng.isyifaBaoming }">
								</div>
								<label class="col-sm-2 control-label">备注:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="beizhu" value="${zBGongCheng.beizhu }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标项目文件:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbxiangmuwenjian" value="${zBGongCheng.zbxiangmuwenjian }">
								</div>
								<label class="col-sm-2 control-label">招标项目旧文件:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbxiangmuwenjianoldname" value="${zBGongCheng.zbxiangmuwenjianoldname }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标代理名称:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbdlName" value="${zBGongCheng.zbdlName }">
								</div>
								<label class="col-sm-2 control-label">是否自动生成编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="isAutobh" value="${zBGongCheng.isAutobh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">部门id:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="deptGuid" value="${zBGongCheng.deptGuid }">
								</div>
								<label class="col-sm-2 control-label">项目概况与范围:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbGkfw" value="${zBGongCheng.zbGkfw }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">资格要求:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbRequire" value="${zBGongCheng.zbRequire }">
								</div>
								<label class="col-sm-2 control-label">招标条件:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="zbCondition" value="${zBGongCheng.zbCondition }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">市场类型:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="shichangLeixing" value="${zBGongCheng.shichangLeixing }">
								</div>
								<label class="col-sm-2 control-label">工程平台编号:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="gcPtbh" value="${zBGongCheng.gcPtbh }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">非依法理由:</label>
								<div class="col-sm-4">
									<input class="form-control" type="text"  name="feiyifaliyou" value="${zBGongCheng.feiyifaliyou }">
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
