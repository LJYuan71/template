<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>zb_gc_bd明细页面</title>
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
								<label class="col-sm-2 control-label">标段id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.bdGuid }
								</div>
								<label class="col-sm-2 control-label">工程id:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.gcGuid }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">标段编号:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.bdBh }
								</div>
								<label class="col-sm-2 control-label">标段名称:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.bdName }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">评标办法:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.pbBanfa }
								</div>
								<label class="col-sm-2 control-label">创建时间:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.createTime }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否删除:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.isDeleted }
								</div>
								<label class="col-sm-2 control-label">修改时间:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.modifyTime }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">评标方式:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.pbFangshi }
								</div>
								<label class="col-sm-2 control-label">是否接受联合体投标:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.isJieshouLianheti }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否收取平台服务费:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.isPtfwf }
								</div>
								<label class="col-sm-2 control-label">平台服务费市区方式【“按金额收取”和“按比例收取”】:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.ptfwfShouqufangshi }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">保证金计算方式【固定金额、固定比例】:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.bzjJisuanfangshi }
								</div>
								<label class="col-sm-2 control-label">是否有招标控制价【1：是，0：否】:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.isZbkzj }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">开标形式【线上开标、线下开标】:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.kaibiaoXingshi }
								</div>
								<label class="col-sm-2 control-label">评标形式【线上评标、线下评标】:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.pingbiaoXingshi }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">投标保证金，金额或者比例:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.bzjJineBili }
								</div>
								<label class="col-sm-2 control-label">收取金额或收取比例:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.ptfwfJine }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否有清单文件【1：是，0：否】:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.isQingdanwenjian }
								</div>
								<label class="col-sm-2 control-label">招标文件发布时间:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.zbwjFabutime }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否出售资格预审文件:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.yswjIssell }
								</div>
								<label class="col-sm-2 control-label">资格预审文件标书费用金额:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.yswjbsJine }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否出售招标文件:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.zbwjIssell }
								</div>
								<label class="col-sm-2 control-label">招标文件标书费用金额:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.zbwjbsJine }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否有图纸文件的选择:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.isTuzhiwenjian }
								</div>
								<label class="col-sm-2 control-label">图纸文件的押金金额:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.yajinjine }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">标段内容:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.bdContent }
								</div>
								<label class="col-sm-2 control-label">工期限制:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.dayLimit }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">建设地址:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.jiansheaddress }
								</div>
								<label class="col-sm-2 control-label">运输方式:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.transporttype }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">到站:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.arrivestation }
								</div>
								<label class="col-sm-2 control-label">货款结算办法:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.paytype }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">交货期:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.deliverydate }
								</div>
								<label class="col-sm-2 control-label">交货方式:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.delivertype }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">交货地点:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.deliveraddress }
								</div>
								<label class="col-sm-2 control-label">文件递交地点:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.filetoaddress }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">建筑面积:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.coverArea }
								</div>
								<label class="col-sm-2 control-label">结构:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.structLayer }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">层数:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.structFloor }
								</div>
								<label class="col-sm-2 control-label">保证金缴纳方式【1：系统自动生成保证金收款账号、2：招标文件指定账号】:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.bzjJiaonafangshi }
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">开标地点:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.kbPlace }
								</div>
								<label class="col-sm-2 control-label">预审开标地点:</label>
								<div class="col-sm-4 form-control-static">
									${zBGongChengBD.yskbPlace }
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
