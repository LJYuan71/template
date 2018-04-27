package tk.ljyuan71.permissions.zbgc.model;

import java.io.Serializable;

/**
 * 
 * 表ZB_GC实体
 */
public class ZBGongCheng implements Serializable {
private static final long serialVersionUID = 1L;
	// 招标项目主键
	private String  gcGuid;
	// 事项id
	private String  shixiangGuid;
	// 招标报建编号
	private String  gcBaojianBh;
	// 工程编号
	private String  gcBh;
	// 工程名称
	private String  gcName;
	// 工程类型:0工程，1国内货物，2服务，3国际货物
	private String  gcLeixing;
	// 工程其他类型
	private String  gcLeixingQita;
	// 招标方式:公开招标，邀请招标
	private Short zbFangshi;
	// 资审方式
	private Short zsFangshi;
	// 是否场外工程
	private Boolean isChangwaiGc;
	// 是否批量招标
	private Boolean isPlzb;
	// 项目备案主管部门编号
	private String  zhuguanBumenBh;
	// 项目备案主管部门名称
	private String  zhuguanBumenName;
	// 招标人id
	private String  zbrGuid;
	// 招标人编号
	private String  zbrBh;
	// 招标人名称
	private String  zbrName;
	// 联系人名称
	private String  lianxirenName;
	// 联系人电话
	private String  lianxirenPhone;
	// 联系人手机号
	private String  lianxirenMobile;
	// 招标人单位性质
	private String  zbrDanweiXingzhi;
	// 招标人单位级别
	private String  zbrDanweiJibie;
	// 招标人所属系统
	private String  zbrSuoshuXitong;
	// 采购机构
	private String  caigouJigou;
	// 经办人
	private String  jingbanrenName;
	// 经办人手机
	private String  jingbanrenMobile;
	// 经办人邮箱
	private String  jingbanrenEmail;
	// 经办人联系电话
	private String  jingbanrenPhone;
	// 经办人微信号
	private String  jingbanrenWeixin;
	// 经办人QQ号
	private String  jingbanrenQq;
	// 招标组织形式
	private String  cgZuzhiXingshi;
	// 组织形式—其他
	private String  zbZuzhiXingshiQita;
	// 是否接受网上报名
	private Boolean bmWangshang;
	// 是否接受窗口报名
	private Boolean bmChuangkou;
	// 是否接受网上截标
	private Boolean jbWangshang;
	// 是否接受窗口截标
	private Boolean jbChuangkou;
	// 评标方式 1:电子评标 2:纸质评标
	private Integer  pbFangshi;
	// 招标组织形式:1自行组织招标 2委托招标
	private Integer  zbZuzhiXingshi;
	// 创建时间
	private Long  createTime;
	// 创建人id
	private String  creatorGuid;
	// 创建人名称
	private String  creatorName;
	// 修改时间
	private Long  modifyTime;
	// 修改人
	private String  modifyerName;
	// 报建企业编号
	private String  baojianQiyeBh;
	// 审批状态
	private Integer  shenpiZhuangtai;
	// 是否删除
	private Boolean isDeleted;
	// 项目id
	private String  xmGuid;
	// 主管部门编号2
	private String  zhuguanBumenBh2;
	// 监督部门编号
	private String  jianduBumenBh;
	// 监督部门名称
	private String  jianduBumenName;
	// 建设单位id
	private String  jsdwGuid;
	// 建设单位编号
	private String  jsdwBh;
	// 公共服务编号
	private String  gonggongFuwuBh;
	// 是否兜底新增
	private Boolean isDoudiXinzeng;
	// 是否兜底修改
	private Boolean isDoudiXiugai;
	// 招标分确定方式
	private Integer  zbrQuedingFangshi;
	// 是否中广核工程
	private Boolean isZhongguanheGc;
	// 是否批量招标2
	private Boolean isPlzb2;
	// 招标代理id
	private String  zbdlGuid;
	// 是否旧数据
	private Boolean isOlddata;
	// 工程父id
	private String  gcGuidParent;
	// 申报责任人
	private String  shenbaoZerenren;
	// 申报责任人编号
	private String  shenbaoZerenrenBh;
	// 转招标方式
	private String  zhuanZbFangshi;
	// 分类代码
	private String  feileiDaima;
	// 协议单位编号
	private String  xieyiDanweiBh;
	// 协议单位名称
	private String  xieyiDanweiName;
	// 抽签原则
	private String  chouqianYuanze;
	// 是否建筑工业化项目
	private Boolean isJianzhuHangye;
	// 项目编号2
	private String  xmBh2;
	// 工程编号2
	private String  gcBh2;
	// 是否需要业绩文件
	private Boolean isXuyaoYejiwenjian;
	// 是否需要报名
	private Boolean isBaoming;
	// 是否确认
	private Boolean isQueren;
	// 项目类型
	private Short xmLeixing;
	// 服务费收取方式
	private Short fuwufeiShouquFs;
	// 服务费
	private Long  fuwufei;
	// 监督人编号
	private String  jiandurenbh;
	// 项目经理id
	private String  projectManagerguid;
	// 项目经理名称
	private String  projectManagername;
	// 招标说明
	private String  zbShuoming;
	// 是否依法报名
	private String  isyifaBaoming;
	// 备注
	private String  beizhu;
	// 招标项目文件
	private String  zbxiangmuwenjian;
	// 招标项目旧文件
	private String  zbxiangmuwenjianoldname;
	// 招标代理名称
	private String  zbdlName;
	// 是否自动生成编号
	private Boolean isAutobh;
	// 部门id
	private String  deptGuid;
	// 项目概况与范围
	private String  zbGkfw;
	// 资格要求
	private String  zbRequire;
	// 招标条件
	private String  zbCondition;
	// 市场类型
	private Short shichangLeixing;
	// 工程平台编号
	private String  gcPtbh;
	// 非依法理由
	private String  feiyifaliyou;

	/** 设置  招标项目主键 值 */
	public void setGcGuid(String gcGuid){
		this.gcGuid = gcGuid;
	}
	/** 获取 招标项目主键 值 */
	public String getGcGuid(){
		return this.gcGuid;
	}
	/** 设置  事项id 值 */
	public void setShixiangGuid(String shixiangGuid){
		this.shixiangGuid = shixiangGuid;
	}
	/** 获取 事项id 值 */
	public String getShixiangGuid(){
		return this.shixiangGuid;
	}
	/** 设置  招标报建编号 值 */
	public void setGcBaojianBh(String gcBaojianBh){
		this.gcBaojianBh = gcBaojianBh;
	}
	/** 获取 招标报建编号 值 */
	public String getGcBaojianBh(){
		return this.gcBaojianBh;
	}
	/** 设置  工程编号 值 */
	public void setGcBh(String gcBh){
		this.gcBh = gcBh;
	}
	/** 获取 工程编号 值 */
	public String getGcBh(){
		return this.gcBh;
	}
	/** 设置  工程名称 值 */
	public void setGcName(String gcName){
		this.gcName = gcName;
	}
	/** 获取 工程名称 值 */
	public String getGcName(){
		return this.gcName;
	}
	/** 设置  工程类型:0工程，1国内货物，2服务，3国际货物 值 */
	public void setGcLeixing(String gcLeixing){
		this.gcLeixing = gcLeixing;
	}
	/** 获取 工程类型:0工程，1国内货物，2服务，3国际货物 值 */
	public String getGcLeixing(){
		return this.gcLeixing;
	}
	/** 设置  工程其他类型 值 */
	public void setGcLeixingQita(String gcLeixingQita){
		this.gcLeixingQita = gcLeixingQita;
	}
	/** 获取 工程其他类型 值 */
	public String getGcLeixingQita(){
		return this.gcLeixingQita;
	}
	/** 设置  招标方式:公开招标，邀请招标 值 */
	public void setZbFangshi(Short zbFangshi){
		this.zbFangshi = zbFangshi;
	}
	/** 获取 招标方式:公开招标，邀请招标 值 */
	public Short getZbFangshi(){
		return this.zbFangshi;
	}
	/** 设置  资审方式 值 */
	public void setZsFangshi(Short zsFangshi){
		this.zsFangshi = zsFangshi;
	}
	/** 获取 资审方式 值 */
	public Short getZsFangshi(){
		return this.zsFangshi;
	}
	/** 设置  是否场外工程 值 */
	public void setIsChangwaiGc(Boolean isChangwaiGc){
		this.isChangwaiGc = isChangwaiGc;
	}
	/** 获取 是否场外工程 值 */
	public Boolean getIsChangwaiGc(){
		return this.isChangwaiGc;
	}
	/** 设置  是否批量招标 值 */
	public void setIsPlzb(Boolean isPlzb){
		this.isPlzb = isPlzb;
	}
	/** 获取 是否批量招标 值 */
	public Boolean getIsPlzb(){
		return this.isPlzb;
	}
	/** 设置  项目备案主管部门编号 值 */
	public void setZhuguanBumenBh(String zhuguanBumenBh){
		this.zhuguanBumenBh = zhuguanBumenBh;
	}
	/** 获取 项目备案主管部门编号 值 */
	public String getZhuguanBumenBh(){
		return this.zhuguanBumenBh;
	}
	/** 设置  项目备案主管部门名称 值 */
	public void setZhuguanBumenName(String zhuguanBumenName){
		this.zhuguanBumenName = zhuguanBumenName;
	}
	/** 获取 项目备案主管部门名称 值 */
	public String getZhuguanBumenName(){
		return this.zhuguanBumenName;
	}
	/** 设置  招标人id 值 */
	public void setZbrGuid(String zbrGuid){
		this.zbrGuid = zbrGuid;
	}
	/** 获取 招标人id 值 */
	public String getZbrGuid(){
		return this.zbrGuid;
	}
	/** 设置  招标人编号 值 */
	public void setZbrBh(String zbrBh){
		this.zbrBh = zbrBh;
	}
	/** 获取 招标人编号 值 */
	public String getZbrBh(){
		return this.zbrBh;
	}
	/** 设置  招标人名称 值 */
	public void setZbrName(String zbrName){
		this.zbrName = zbrName;
	}
	/** 获取 招标人名称 值 */
	public String getZbrName(){
		return this.zbrName;
	}
	/** 设置  联系人名称 值 */
	public void setLianxirenName(String lianxirenName){
		this.lianxirenName = lianxirenName;
	}
	/** 获取 联系人名称 值 */
	public String getLianxirenName(){
		return this.lianxirenName;
	}
	/** 设置  联系人电话 值 */
	public void setLianxirenPhone(String lianxirenPhone){
		this.lianxirenPhone = lianxirenPhone;
	}
	/** 获取 联系人电话 值 */
	public String getLianxirenPhone(){
		return this.lianxirenPhone;
	}
	/** 设置  联系人手机号 值 */
	public void setLianxirenMobile(String lianxirenMobile){
		this.lianxirenMobile = lianxirenMobile;
	}
	/** 获取 联系人手机号 值 */
	public String getLianxirenMobile(){
		return this.lianxirenMobile;
	}
	/** 设置  招标人单位性质 值 */
	public void setZbrDanweiXingzhi(String zbrDanweiXingzhi){
		this.zbrDanweiXingzhi = zbrDanweiXingzhi;
	}
	/** 获取 招标人单位性质 值 */
	public String getZbrDanweiXingzhi(){
		return this.zbrDanweiXingzhi;
	}
	/** 设置  招标人单位级别 值 */
	public void setZbrDanweiJibie(String zbrDanweiJibie){
		this.zbrDanweiJibie = zbrDanweiJibie;
	}
	/** 获取 招标人单位级别 值 */
	public String getZbrDanweiJibie(){
		return this.zbrDanweiJibie;
	}
	/** 设置  招标人所属系统 值 */
	public void setZbrSuoshuXitong(String zbrSuoshuXitong){
		this.zbrSuoshuXitong = zbrSuoshuXitong;
	}
	/** 获取 招标人所属系统 值 */
	public String getZbrSuoshuXitong(){
		return this.zbrSuoshuXitong;
	}
	/** 设置  采购机构 值 */
	public void setCaigouJigou(String caigouJigou){
		this.caigouJigou = caigouJigou;
	}
	/** 获取 采购机构 值 */
	public String getCaigouJigou(){
		return this.caigouJigou;
	}
	/** 设置  经办人 值 */
	public void setJingbanrenName(String jingbanrenName){
		this.jingbanrenName = jingbanrenName;
	}
	/** 获取 经办人 值 */
	public String getJingbanrenName(){
		return this.jingbanrenName;
	}
	/** 设置  经办人手机 值 */
	public void setJingbanrenMobile(String jingbanrenMobile){
		this.jingbanrenMobile = jingbanrenMobile;
	}
	/** 获取 经办人手机 值 */
	public String getJingbanrenMobile(){
		return this.jingbanrenMobile;
	}
	/** 设置  经办人邮箱 值 */
	public void setJingbanrenEmail(String jingbanrenEmail){
		this.jingbanrenEmail = jingbanrenEmail;
	}
	/** 获取 经办人邮箱 值 */
	public String getJingbanrenEmail(){
		return this.jingbanrenEmail;
	}
	/** 设置  经办人联系电话 值 */
	public void setJingbanrenPhone(String jingbanrenPhone){
		this.jingbanrenPhone = jingbanrenPhone;
	}
	/** 获取 经办人联系电话 值 */
	public String getJingbanrenPhone(){
		return this.jingbanrenPhone;
	}
	/** 设置  经办人微信号 值 */
	public void setJingbanrenWeixin(String jingbanrenWeixin){
		this.jingbanrenWeixin = jingbanrenWeixin;
	}
	/** 获取 经办人微信号 值 */
	public String getJingbanrenWeixin(){
		return this.jingbanrenWeixin;
	}
	/** 设置  经办人QQ号 值 */
	public void setJingbanrenQq(String jingbanrenQq){
		this.jingbanrenQq = jingbanrenQq;
	}
	/** 获取 经办人QQ号 值 */
	public String getJingbanrenQq(){
		return this.jingbanrenQq;
	}
	/** 设置  招标组织形式 值 */
	public void setCgZuzhiXingshi(String cgZuzhiXingshi){
		this.cgZuzhiXingshi = cgZuzhiXingshi;
	}
	/** 获取 招标组织形式 值 */
	public String getCgZuzhiXingshi(){
		return this.cgZuzhiXingshi;
	}
	/** 设置  组织形式—其他 值 */
	public void setZbZuzhiXingshiQita(String zbZuzhiXingshiQita){
		this.zbZuzhiXingshiQita = zbZuzhiXingshiQita;
	}
	/** 获取 组织形式—其他 值 */
	public String getZbZuzhiXingshiQita(){
		return this.zbZuzhiXingshiQita;
	}
	/** 设置  是否接受网上报名 值 */
	public void setBmWangshang(Boolean bmWangshang){
		this.bmWangshang = bmWangshang;
	}
	/** 获取 是否接受网上报名 值 */
	public Boolean getBmWangshang(){
		return this.bmWangshang;
	}
	/** 设置  是否接受窗口报名 值 */
	public void setBmChuangkou(Boolean bmChuangkou){
		this.bmChuangkou = bmChuangkou;
	}
	/** 获取 是否接受窗口报名 值 */
	public Boolean getBmChuangkou(){
		return this.bmChuangkou;
	}
	/** 设置  是否接受网上截标 值 */
	public void setJbWangshang(Boolean jbWangshang){
		this.jbWangshang = jbWangshang;
	}
	/** 获取 是否接受网上截标 值 */
	public Boolean getJbWangshang(){
		return this.jbWangshang;
	}
	/** 设置  是否接受窗口截标 值 */
	public void setJbChuangkou(Boolean jbChuangkou){
		this.jbChuangkou = jbChuangkou;
	}
	/** 获取 是否接受窗口截标 值 */
	public Boolean getJbChuangkou(){
		return this.jbChuangkou;
	}
	/** 设置  评标方式 1:电子评标 2:纸质评标 值 */
	public void setPbFangshi(Integer pbFangshi){
		this.pbFangshi = pbFangshi;
	}
	/** 获取 评标方式 1:电子评标 2:纸质评标 值 */
	public Integer getPbFangshi(){
		return this.pbFangshi;
	}
	/** 设置  招标组织形式:1自行组织招标 2委托招标 值 */
	public void setZbZuzhiXingshi(Integer zbZuzhiXingshi){
		this.zbZuzhiXingshi = zbZuzhiXingshi;
	}
	/** 获取 招标组织形式:1自行组织招标 2委托招标 值 */
	public Integer getZbZuzhiXingshi(){
		return this.zbZuzhiXingshi;
	}
	/** 设置  创建时间 值 */
	public void setCreateTime(Long createTime){
		this.createTime = createTime;
	}
	/** 获取 创建时间 值 */
	public Long getCreateTime(){
		return this.createTime;
	}
	/** 设置  创建人id 值 */
	public void setCreatorGuid(String creatorGuid){
		this.creatorGuid = creatorGuid;
	}
	/** 获取 创建人id 值 */
	public String getCreatorGuid(){
		return this.creatorGuid;
	}
	/** 设置  创建人名称 值 */
	public void setCreatorName(String creatorName){
		this.creatorName = creatorName;
	}
	/** 获取 创建人名称 值 */
	public String getCreatorName(){
		return this.creatorName;
	}
	/** 设置  修改时间 值 */
	public void setModifyTime(Long modifyTime){
		this.modifyTime = modifyTime;
	}
	/** 获取 修改时间 值 */
	public Long getModifyTime(){
		return this.modifyTime;
	}
	/** 设置  修改人 值 */
	public void setModifyerName(String modifyerName){
		this.modifyerName = modifyerName;
	}
	/** 获取 修改人 值 */
	public String getModifyerName(){
		return this.modifyerName;
	}
	/** 设置  报建企业编号 值 */
	public void setBaojianQiyeBh(String baojianQiyeBh){
		this.baojianQiyeBh = baojianQiyeBh;
	}
	/** 获取 报建企业编号 值 */
	public String getBaojianQiyeBh(){
		return this.baojianQiyeBh;
	}
	/** 设置  审批状态 值 */
	public void setShenpiZhuangtai(Integer shenpiZhuangtai){
		this.shenpiZhuangtai = shenpiZhuangtai;
	}
	/** 获取 审批状态 值 */
	public Integer getShenpiZhuangtai(){
		return this.shenpiZhuangtai;
	}
	/** 设置  是否删除 值 */
	public void setIsDeleted(Boolean isDeleted){
		this.isDeleted = isDeleted;
	}
	/** 获取 是否删除 值 */
	public Boolean getIsDeleted(){
		return this.isDeleted;
	}
	/** 设置  项目id 值 */
	public void setXmGuid(String xmGuid){
		this.xmGuid = xmGuid;
	}
	/** 获取 项目id 值 */
	public String getXmGuid(){
		return this.xmGuid;
	}
	/** 设置  主管部门编号2 值 */
	public void setZhuguanBumenBh2(String zhuguanBumenBh2){
		this.zhuguanBumenBh2 = zhuguanBumenBh2;
	}
	/** 获取 主管部门编号2 值 */
	public String getZhuguanBumenBh2(){
		return this.zhuguanBumenBh2;
	}
	/** 设置  监督部门编号 值 */
	public void setJianduBumenBh(String jianduBumenBh){
		this.jianduBumenBh = jianduBumenBh;
	}
	/** 获取 监督部门编号 值 */
	public String getJianduBumenBh(){
		return this.jianduBumenBh;
	}
	/** 设置  监督部门名称 值 */
	public void setJianduBumenName(String jianduBumenName){
		this.jianduBumenName = jianduBumenName;
	}
	/** 获取 监督部门名称 值 */
	public String getJianduBumenName(){
		return this.jianduBumenName;
	}
	/** 设置  建设单位id 值 */
	public void setJsdwGuid(String jsdwGuid){
		this.jsdwGuid = jsdwGuid;
	}
	/** 获取 建设单位id 值 */
	public String getJsdwGuid(){
		return this.jsdwGuid;
	}
	/** 设置  建设单位编号 值 */
	public void setJsdwBh(String jsdwBh){
		this.jsdwBh = jsdwBh;
	}
	/** 获取 建设单位编号 值 */
	public String getJsdwBh(){
		return this.jsdwBh;
	}
	/** 设置  公共服务编号 值 */
	public void setGonggongFuwuBh(String gonggongFuwuBh){
		this.gonggongFuwuBh = gonggongFuwuBh;
	}
	/** 获取 公共服务编号 值 */
	public String getGonggongFuwuBh(){
		return this.gonggongFuwuBh;
	}
	/** 设置  是否兜底新增 值 */
	public void setIsDoudiXinzeng(Boolean isDoudiXinzeng){
		this.isDoudiXinzeng = isDoudiXinzeng;
	}
	/** 获取 是否兜底新增 值 */
	public Boolean getIsDoudiXinzeng(){
		return this.isDoudiXinzeng;
	}
	/** 设置  是否兜底修改 值 */
	public void setIsDoudiXiugai(Boolean isDoudiXiugai){
		this.isDoudiXiugai = isDoudiXiugai;
	}
	/** 获取 是否兜底修改 值 */
	public Boolean getIsDoudiXiugai(){
		return this.isDoudiXiugai;
	}
	/** 设置  招标分确定方式 值 */
	public void setZbrQuedingFangshi(Integer zbrQuedingFangshi){
		this.zbrQuedingFangshi = zbrQuedingFangshi;
	}
	/** 获取 招标分确定方式 值 */
	public Integer getZbrQuedingFangshi(){
		return this.zbrQuedingFangshi;
	}
	/** 设置  是否中广核工程 值 */
	public void setIsZhongguanheGc(Boolean isZhongguanheGc){
		this.isZhongguanheGc = isZhongguanheGc;
	}
	/** 获取 是否中广核工程 值 */
	public Boolean getIsZhongguanheGc(){
		return this.isZhongguanheGc;
	}
	/** 设置  是否批量招标2 值 */
	public void setIsPlzb2(Boolean isPlzb2){
		this.isPlzb2 = isPlzb2;
	}
	/** 获取 是否批量招标2 值 */
	public Boolean getIsPlzb2(){
		return this.isPlzb2;
	}
	/** 设置  招标代理id 值 */
	public void setZbdlGuid(String zbdlGuid){
		this.zbdlGuid = zbdlGuid;
	}
	/** 获取 招标代理id 值 */
	public String getZbdlGuid(){
		return this.zbdlGuid;
	}
	/** 设置  是否旧数据 值 */
	public void setIsOlddata(Boolean isOlddata){
		this.isOlddata = isOlddata;
	}
	/** 获取 是否旧数据 值 */
	public Boolean getIsOlddata(){
		return this.isOlddata;
	}
	/** 设置  工程父id 值 */
	public void setGcGuidParent(String gcGuidParent){
		this.gcGuidParent = gcGuidParent;
	}
	/** 获取 工程父id 值 */
	public String getGcGuidParent(){
		return this.gcGuidParent;
	}
	/** 设置  申报责任人 值 */
	public void setShenbaoZerenren(String shenbaoZerenren){
		this.shenbaoZerenren = shenbaoZerenren;
	}
	/** 获取 申报责任人 值 */
	public String getShenbaoZerenren(){
		return this.shenbaoZerenren;
	}
	/** 设置  申报责任人编号 值 */
	public void setShenbaoZerenrenBh(String shenbaoZerenrenBh){
		this.shenbaoZerenrenBh = shenbaoZerenrenBh;
	}
	/** 获取 申报责任人编号 值 */
	public String getShenbaoZerenrenBh(){
		return this.shenbaoZerenrenBh;
	}
	/** 设置  转招标方式 值 */
	public void setZhuanZbFangshi(String zhuanZbFangshi){
		this.zhuanZbFangshi = zhuanZbFangshi;
	}
	/** 获取 转招标方式 值 */
	public String getZhuanZbFangshi(){
		return this.zhuanZbFangshi;
	}
	/** 设置  分类代码 值 */
	public void setFeileiDaima(String feileiDaima){
		this.feileiDaima = feileiDaima;
	}
	/** 获取 分类代码 值 */
	public String getFeileiDaima(){
		return this.feileiDaima;
	}
	/** 设置  协议单位编号 值 */
	public void setXieyiDanweiBh(String xieyiDanweiBh){
		this.xieyiDanweiBh = xieyiDanweiBh;
	}
	/** 获取 协议单位编号 值 */
	public String getXieyiDanweiBh(){
		return this.xieyiDanweiBh;
	}
	/** 设置  协议单位名称 值 */
	public void setXieyiDanweiName(String xieyiDanweiName){
		this.xieyiDanweiName = xieyiDanweiName;
	}
	/** 获取 协议单位名称 值 */
	public String getXieyiDanweiName(){
		return this.xieyiDanweiName;
	}
	/** 设置  抽签原则 值 */
	public void setChouqianYuanze(String chouqianYuanze){
		this.chouqianYuanze = chouqianYuanze;
	}
	/** 获取 抽签原则 值 */
	public String getChouqianYuanze(){
		return this.chouqianYuanze;
	}
	/** 设置  是否建筑工业化项目 值 */
	public void setIsJianzhuHangye(Boolean isJianzhuHangye){
		this.isJianzhuHangye = isJianzhuHangye;
	}
	/** 获取 是否建筑工业化项目 值 */
	public Boolean getIsJianzhuHangye(){
		return this.isJianzhuHangye;
	}
	/** 设置  项目编号2 值 */
	public void setXmBh2(String xmBh2){
		this.xmBh2 = xmBh2;
	}
	/** 获取 项目编号2 值 */
	public String getXmBh2(){
		return this.xmBh2;
	}
	/** 设置  工程编号2 值 */
	public void setGcBh2(String gcBh2){
		this.gcBh2 = gcBh2;
	}
	/** 获取 工程编号2 值 */
	public String getGcBh2(){
		return this.gcBh2;
	}
	/** 设置  是否需要业绩文件 值 */
	public void setIsXuyaoYejiwenjian(Boolean isXuyaoYejiwenjian){
		this.isXuyaoYejiwenjian = isXuyaoYejiwenjian;
	}
	/** 获取 是否需要业绩文件 值 */
	public Boolean getIsXuyaoYejiwenjian(){
		return this.isXuyaoYejiwenjian;
	}
	/** 设置  是否需要报名 值 */
	public void setIsBaoming(Boolean isBaoming){
		this.isBaoming = isBaoming;
	}
	/** 获取 是否需要报名 值 */
	public Boolean getIsBaoming(){
		return this.isBaoming;
	}
	/** 设置  是否确认 值 */
	public void setIsQueren(Boolean isQueren){
		this.isQueren = isQueren;
	}
	/** 获取 是否确认 值 */
	public Boolean getIsQueren(){
		return this.isQueren;
	}
	/** 设置  项目类型 值 */
	public void setXmLeixing(Short xmLeixing){
		this.xmLeixing = xmLeixing;
	}
	/** 获取 项目类型 值 */
	public Short getXmLeixing(){
		return this.xmLeixing;
	}
	/** 设置  服务费收取方式 值 */
	public void setFuwufeiShouquFs(Short fuwufeiShouquFs){
		this.fuwufeiShouquFs = fuwufeiShouquFs;
	}
	/** 获取 服务费收取方式 值 */
	public Short getFuwufeiShouquFs(){
		return this.fuwufeiShouquFs;
	}
	/** 设置  服务费 值 */
	public void setFuwufei(Long fuwufei){
		this.fuwufei = fuwufei;
	}
	/** 获取 服务费 值 */
	public Long getFuwufei(){
		return this.fuwufei;
	}
	/** 设置  监督人编号 值 */
	public void setJiandurenbh(String jiandurenbh){
		this.jiandurenbh = jiandurenbh;
	}
	/** 获取 监督人编号 值 */
	public String getJiandurenbh(){
		return this.jiandurenbh;
	}
	/** 设置  项目经理id 值 */
	public void setProjectManagerguid(String projectManagerguid){
		this.projectManagerguid = projectManagerguid;
	}
	/** 获取 项目经理id 值 */
	public String getProjectManagerguid(){
		return this.projectManagerguid;
	}
	/** 设置  项目经理名称 值 */
	public void setProjectManagername(String projectManagername){
		this.projectManagername = projectManagername;
	}
	/** 获取 项目经理名称 值 */
	public String getProjectManagername(){
		return this.projectManagername;
	}
	/** 设置  招标说明 值 */
	public void setZbShuoming(String zbShuoming){
		this.zbShuoming = zbShuoming;
	}
	/** 获取 招标说明 值 */
	public String getZbShuoming(){
		return this.zbShuoming;
	}
	/** 设置  是否依法报名 值 */
	public void setIsyifaBaoming(String isyifaBaoming){
		this.isyifaBaoming = isyifaBaoming;
	}
	/** 获取 是否依法报名 值 */
	public String getIsyifaBaoming(){
		return this.isyifaBaoming;
	}
	/** 设置  备注 值 */
	public void setBeizhu(String beizhu){
		this.beizhu = beizhu;
	}
	/** 获取 备注 值 */
	public String getBeizhu(){
		return this.beizhu;
	}
	/** 设置  招标项目文件 值 */
	public void setZbxiangmuwenjian(String zbxiangmuwenjian){
		this.zbxiangmuwenjian = zbxiangmuwenjian;
	}
	/** 获取 招标项目文件 值 */
	public String getZbxiangmuwenjian(){
		return this.zbxiangmuwenjian;
	}
	/** 设置  招标项目旧文件 值 */
	public void setZbxiangmuwenjianoldname(String zbxiangmuwenjianoldname){
		this.zbxiangmuwenjianoldname = zbxiangmuwenjianoldname;
	}
	/** 获取 招标项目旧文件 值 */
	public String getZbxiangmuwenjianoldname(){
		return this.zbxiangmuwenjianoldname;
	}
	/** 设置  招标代理名称 值 */
	public void setZbdlName(String zbdlName){
		this.zbdlName = zbdlName;
	}
	/** 获取 招标代理名称 值 */
	public String getZbdlName(){
		return this.zbdlName;
	}
	/** 设置  是否自动生成编号 值 */
	public void setIsAutobh(Boolean isAutobh){
		this.isAutobh = isAutobh;
	}
	/** 获取 是否自动生成编号 值 */
	public Boolean getIsAutobh(){
		return this.isAutobh;
	}
	/** 设置  部门id 值 */
	public void setDeptGuid(String deptGuid){
		this.deptGuid = deptGuid;
	}
	/** 获取 部门id 值 */
	public String getDeptGuid(){
		return this.deptGuid;
	}
	/** 设置  项目概况与范围 值 */
	public void setZbGkfw(String zbGkfw){
		this.zbGkfw = zbGkfw;
	}
	/** 获取 项目概况与范围 值 */
	public String getZbGkfw(){
		return this.zbGkfw;
	}
	/** 设置  资格要求 值 */
	public void setZbRequire(String zbRequire){
		this.zbRequire = zbRequire;
	}
	/** 获取 资格要求 值 */
	public String getZbRequire(){
		return this.zbRequire;
	}
	/** 设置  招标条件 值 */
	public void setZbCondition(String zbCondition){
		this.zbCondition = zbCondition;
	}
	/** 获取 招标条件 值 */
	public String getZbCondition(){
		return this.zbCondition;
	}
	/** 设置  市场类型 值 */
	public void setShichangLeixing(Short shichangLeixing){
		this.shichangLeixing = shichangLeixing;
	}
	/** 获取 市场类型 值 */
	public Short getShichangLeixing(){
		return this.shichangLeixing;
	}
	/** 设置  工程平台编号 值 */
	public void setGcPtbh(String gcPtbh){
		this.gcPtbh = gcPtbh;
	}
	/** 获取 工程平台编号 值 */
	public String getGcPtbh(){
		return this.gcPtbh;
	}
	/** 设置  非依法理由 值 */
	public void setFeiyifaliyou(String feiyifaliyou){
		this.feiyifaliyou = feiyifaliyou;
	}
	/** 获取 非依法理由 值 */
	public String getFeiyifaliyou(){
		return this.feiyifaliyou;
	}

}