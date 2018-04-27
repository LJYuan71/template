<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>招标工程表明细页面</title>
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
								<label class="col-sm-2 control-label">招标项目主键:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.gcGuid }
								</div>
								<label class="col-sm-2 control-label">事项id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.shixiangGuid }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标报建编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.gcBaojianBh }
								</div>
								<label class="col-sm-2 control-label">工程编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.gcBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">工程名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.gcName }
								</div>
								<label class="col-sm-2 control-label">工程类型:0工程，1国内货物，2服务，3国际货物:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.gcLeixing }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">工程其他类型:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.gcLeixingQita }
								</div>
								<label class="col-sm-2 control-label">招标方式:公开招标，邀请招标:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbFangshi }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">资审方式:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zsFangshi }
								</div>
								<label class="col-sm-2 control-label">是否场外工程:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isChangwaiGc }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否批量招标:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isPlzb }
								</div>
								<label class="col-sm-2 control-label">项目备案主管部门编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zhuguanBumenBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目备案主管部门名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zhuguanBumenName }
								</div>
								<label class="col-sm-2 control-label">招标人id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbrGuid }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标人编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbrBh }
								</div>
								<label class="col-sm-2 control-label">招标人名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbrName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">联系人名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.lianxirenName }
								</div>
								<label class="col-sm-2 control-label">联系人电话:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.lianxirenPhone }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">联系人手机号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.lianxirenMobile }
								</div>
								<label class="col-sm-2 control-label">招标人单位性质:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbrDanweiXingzhi }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标人单位级别:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbrDanweiJibie }
								</div>
								<label class="col-sm-2 control-label">招标人所属系统:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbrSuoshuXitong }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">采购机构:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.caigouJigou }
								</div>
								<label class="col-sm-2 control-label">经办人:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jingbanrenName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人手机:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jingbanrenMobile }
								</div>
								<label class="col-sm-2 control-label">经办人邮箱:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jingbanrenEmail }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人联系电话:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jingbanrenPhone }
								</div>
								<label class="col-sm-2 control-label">经办人微信号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jingbanrenWeixin }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">经办人QQ号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jingbanrenQq }
								</div>
								<label class="col-sm-2 control-label">招标组织形式:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.cgZuzhiXingshi }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">组织形式—其他:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbZuzhiXingshiQita }
								</div>
								<label class="col-sm-2 control-label">是否接受网上报名:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.bmWangshang }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否接受窗口报名:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.bmChuangkou }
								</div>
								<label class="col-sm-2 control-label">是否接受网上截标:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jbWangshang }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否接受窗口截标:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jbChuangkou }
								</div>
								<label class="col-sm-2 control-label">评标方式 1:电子评标 2:纸质评标:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.pbFangshi }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标组织形式:1自行组织招标 2委托招标:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbZuzhiXingshi }
								</div>
								<label class="col-sm-2 control-label">创建时间:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.createTime }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">创建人id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.creatorGuid }
								</div>
								<label class="col-sm-2 control-label">创建人名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.creatorName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">修改时间:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.modifyTime }
								</div>
								<label class="col-sm-2 control-label">修改人:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.modifyerName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">报建企业编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.baojianQiyeBh }
								</div>
								<label class="col-sm-2 control-label">审批状态:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.shenpiZhuangtai }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否删除:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isDeleted }
								</div>
								<label class="col-sm-2 control-label">项目id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.xmGuid }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">主管部门编号2:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zhuguanBumenBh2 }
								</div>
								<label class="col-sm-2 control-label">监督部门编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jianduBumenBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">监督部门名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jianduBumenName }
								</div>
								<label class="col-sm-2 control-label">建设单位id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jsdwGuid }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">建设单位编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jsdwBh }
								</div>
								<label class="col-sm-2 control-label">公共服务编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.gonggongFuwuBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否兜底新增:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isDoudiXinzeng }
								</div>
								<label class="col-sm-2 control-label">是否兜底修改:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isDoudiXiugai }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标分确定方式:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbrQuedingFangshi }
								</div>
								<label class="col-sm-2 control-label">是否中广核工程:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isZhongguanheGc }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否批量招标2:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isPlzb2 }
								</div>
								<label class="col-sm-2 control-label">招标代理id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbdlGuid }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否旧数据:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isOlddata }
								</div>
								<label class="col-sm-2 control-label">工程父id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.gcGuidParent }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">申报责任人:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.shenbaoZerenren }
								</div>
								<label class="col-sm-2 control-label">申报责任人编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.shenbaoZerenrenBh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">转招标方式:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zhuanZbFangshi }
								</div>
								<label class="col-sm-2 control-label">分类代码:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.feileiDaima }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">协议单位编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.xieyiDanweiBh }
								</div>
								<label class="col-sm-2 control-label">协议单位名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.xieyiDanweiName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">抽签原则:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.chouqianYuanze }
								</div>
								<label class="col-sm-2 control-label">是否建筑工业化项目:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isJianzhuHangye }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目编号2:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.xmBh2 }
								</div>
								<label class="col-sm-2 control-label">工程编号2:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.gcBh2 }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否需要业绩文件:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isXuyaoYejiwenjian }
								</div>
								<label class="col-sm-2 control-label">是否需要报名:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isBaoming }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否确认:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isQueren }
								</div>
								<label class="col-sm-2 control-label">项目类型:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.xmLeixing }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">服务费收取方式:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.fuwufeiShouquFs }
								</div>
								<label class="col-sm-2 control-label">服务费:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.fuwufei }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">监督人编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.jiandurenbh }
								</div>
								<label class="col-sm-2 control-label">项目经理id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.projectManagerguid }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">项目经理名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.projectManagername }
								</div>
								<label class="col-sm-2 control-label">招标说明:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbShuoming }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否依法报名:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isyifaBaoming }
								</div>
								<label class="col-sm-2 control-label">备注:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.beizhu }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标项目文件:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbxiangmuwenjian }
								</div>
								<label class="col-sm-2 control-label">招标项目旧文件:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbxiangmuwenjianoldname }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">招标代理名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbdlName }
								</div>
								<label class="col-sm-2 control-label">是否自动生成编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.isAutobh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">部门id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.deptGuid }
								</div>
								<label class="col-sm-2 control-label">项目概况与范围:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbGkfw }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">资格要求:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbRequire }
								</div>
								<label class="col-sm-2 control-label">招标条件:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.zbCondition }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">市场类型:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.shichangLeixing }
								</div>
								<label class="col-sm-2 control-label">工程平台编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.gcPtbh }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">非依法理由:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongCheng.feiyifaliyou }
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
