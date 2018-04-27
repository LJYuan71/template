<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>招标项目明细页面</title>
<script>
   
</script>
</head>

<body class="gray-bg">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content" style="display: block;">
						<form class="form-horizontal" >
							<div class="form-group">
								<label class="col-sm-2 control-label">项目id:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xmGuid }
								</div>
								<label class="col-sm-2 control-label">项目报建id:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xmBaojianBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xmBh }
								</div>
								<label class="col-sm-2 control-label">项目名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xmName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目地址:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xmDizhi }
								</div>
								<label class="col-sm-2 control-label">是否重大项目:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.isZhongdaXm }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">重大项目编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zhongdaXmBh }
								</div>
								<label class="col-sm-2 control-label">重大项目名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zhongdaXmName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否场外项目:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.isChangwaiXm }
								</div>
								<label class="col-sm-2 control-label">是否政府投资:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.isZhengfuTouzi }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">主管部门编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zhuguanBumenBh }
								</div>
								<label class="col-sm-2 control-label">主管部门名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zhuguanBumenName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">计划立项文号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.jihuaLixiangBh }
								</div>
								<label class="col-sm-2 control-label">计划立项文号附件:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.jihuaLixiangFujian }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">计划立项文号附件名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.jihuaLixiangFujianName }
								</div>
								<label class="col-sm-2 control-label">规划许可证号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.guihuaXukeBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">规划许可证附件组:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.guihuaXukeFujian }
								</div>
								<label class="col-sm-2 control-label">规划许可证附件名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.guihuaXukeFujianName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">宗地号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zongdiBh }
								</div>
								<label class="col-sm-2 control-label">其他批复文号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.qitaPifuBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">其他批复文号附件组:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.qitaPifuFujian }
								</div>
								<label class="col-sm-2 control-label">其他批复文号附件名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.qitaPifuFujianName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">其他批复文号附件名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zbrGuid }
								</div>
								<label class="col-sm-2 control-label">建设单位编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zbrBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">建设单位名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zbrName }
								</div>
								<label class="col-sm-2 control-label">单位联系人:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.lianxirenName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">联系人电话:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.lianxirenPhone }
								</div>
								<label class="col-sm-2 control-label">联系人手机号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.lianxirenMobile }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目所在行政区代码:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xingzhengDiquBh }
								</div>
								<label class="col-sm-2 control-label">项目行业分类:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.hangyeBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">政府投资比例:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zijinLaiyuanZhengfu }
								</div>
								<label class="col-sm-2 control-label">国企投资比例:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zijinLaiyuanGuoqi }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">私企投资比例:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zijinLaiyuanSiqi }
								</div>
								<label class="col-sm-2 control-label">集体投资比例:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zijinLaiyuanJiti }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">外资投资比例:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zijinLaiyuanWaizi }
								</div>
								<label class="col-sm-2 control-label">其他投资比例:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zijinLaiyuanQita }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.jingbanrenName }
								</div>
								<label class="col-sm-2 control-label">经办人手机:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.jingbanrenMobile }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人联系电话:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.jingbanrenPhone }
								</div>
								<label class="col-sm-2 control-label">经办人微信号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.jingbanrenWeixin }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">建设规模:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.jiansheGuimo }
								</div>
								<label class="col-sm-2 control-label">计划总投资币种:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.jihuaZongtouziBizhong }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">计划总投资金额:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.jihuaZongtouziJe }
								</div>
								<label class="col-sm-2 control-label">建筑面积:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.jianzhuMianji }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">特殊情况说明:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.teshuQingkuang }
								</div>
								<label class="col-sm-2 control-label">特殊说明附件组:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.teshuQingkuangFujian }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">特殊说明附件名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.teshuQingkuangFujianName }
								</div>
								<label class="col-sm-2 control-label">创建时间:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.createTime }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">创建人id:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.creatorGuid }
								</div>
								<label class="col-sm-2 control-label">创建人名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.creatorName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">创建人名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.modifyTime }
								</div>
								<label class="col-sm-2 control-label">修改时间:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.modifierName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">报建企业编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.baojianQiyeBh }
								</div>
								<label class="col-sm-2 control-label">审批状态:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.shenpiZhuangtai }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否删除状态:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.isDeleted }
								</div>
								<label class="col-sm-2 control-label">是否应急项目:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.isYingjiGc }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否兜底方案新增:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.isDoudiXinzeng }
								</div>
								<label class="col-sm-2 control-label">是否兜底方案修改:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.isDoudiXiugai }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目流水号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.serialNumber }
								</div>
								<label class="col-sm-2 control-label">申请时间:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.applyTime }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目分类:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.proClassification }
								</div>
								<label class="col-sm-2 control-label">项目分类-二级子类:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.proClassificationSub }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否重点区域:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.keyArea }
								</div>
								<label class="col-sm-2 control-label">重点区域名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.keyAreaName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">核准备案证编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.approvalrecordNumber }
								</div>
								<label class="col-sm-2 control-label">建设工程用地许可证:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.landplanningPermission }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目来源:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xmLaiyuan }
								</div>
								<label class="col-sm-2 control-label">协议单位编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xieyiDanweiBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">协议单位名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xieyiDanweiName }
								</div>
								<label class="col-sm-2 control-label">项目编号2:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xmBh2 }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">省id:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.province }
								</div>
								<label class="col-sm-2 control-label">市id:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.city }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">区id:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.area }
								</div>
								<label class="col-sm-2 control-label">是否最终确认:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.queRen }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">资金来源:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zijinLaiyuan }
								</div>
								<label class="col-sm-2 control-label">二级行业编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.hangyeBhErji }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">其他招标人id:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.otherZbrGuid }
								</div>
								<label class="col-sm-2 control-label">其他招标人编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.otherZbrBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">其他招标人名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.otherZbrName }
								</div>
								<label class="col-sm-2 control-label">项目文件:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xiangmuwenjian }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">旧的项目文件:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xiangmuwenjianoldname }
								</div>
								<label class="col-sm-2 control-label">是否指派项目:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.isTask }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">负责人id:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.fzrGuid }
								</div>
								<label class="col-sm-2 control-label">任务指派id:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.taskzpGuid }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标人地址:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.zbrAddress }
								</div>
								<label class="col-sm-2 control-label">项目平台编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.xmPtbh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">行业三级分类:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.hangyeBhSanji }
								</div>
								<label class="col-sm-2 control-label">行业四级分类:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.hangyeBhSiji }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目下招标项目的最大流水:</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.maxLiushui }
								</div>
								<label class="col-sm-2 control-label">项目下删除的招标项目的流水号 :</label>
								<div class="col-sm-4 form-control-static">
									${zBXiangMu.deletedLiushui }
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
