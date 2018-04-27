package tk.ljyuan71.permissions.zbgcbd.model;

import java.io.Serializable;

/**
 * zb_gc_bd
 * 表ZB_GC_BD实体
 */
public class ZBGongChengBD implements Serializable {
private static final long serialVersionUID = 1L;
	// 标段id
	private String  bdGuid;
	// 工程id
	private String  gcGuid;
	// 标段编号
	private String  bdBh;
	// 标段名称
	private String  bdName;
	// 评标办法
	private Short pbBanfa;
	// 创建时间
	private Long  createTime;
	// 是否删除
	private Boolean isDeleted;
	// 修改时间
	private Long  modifyTime;
	// 评标方式
	private Integer  pbFangshi;
	// 是否接受联合体投标
	private Boolean isJieshouLianheti;
	// 是否收取平台服务费
	private String  isPtfwf;
	// 平台服务费市区方式【“按金额收取”和“按比例收取”】
	private String  ptfwfShouqufangshi;
	// 保证金计算方式【固定金额、固定比例】
	private String  bzjJisuanfangshi;
	// 是否有招标控制价【1：是，0：否】
	private String  isZbkzj;
	// 开标形式【线上开标、线下开标】
	private String  kaibiaoXingshi;
	// 评标形式【线上评标、线下评标】
	private String  pingbiaoXingshi;
	// 投标保证金，金额或者比例
	private Long  bzjJineBili;
	// 收取金额或收取比例
	private Long  ptfwfJine;
	// 是否有清单文件【1：是，0：否】
	private String  isQingdanwenjian;
	// 招标文件发布时间
	private Long  zbwjFabutime;
	// 是否出售资格预审文件
	private String  yswjIssell;
	// 资格预审文件标书费用金额
	private Long  yswjbsJine;
	// 是否出售招标文件
	private String  zbwjIssell;
	// 招标文件标书费用金额
	private Long zbwjbsJine;
	// 是否有图纸文件的选择
	private String  isTuzhiwenjian;
	// 图纸文件的押金金额
	private Long  yajinjine;
	// 标段内容
	private String  bdContent;
	// 工期限制
	private Long  dayLimit;
	// 建设地址
	private String  jiansheaddress;
	// 运输方式
	private String  transporttype;
	// 到站
	private String  arrivestation;
	// 货款结算办法
	private String  paytype;
	// 交货期
	private Long  deliverydate;
	// 交货方式
	private String  delivertype;
	// 交货地点
	private String  deliveraddress;
	// 文件递交地点
	private String  filetoaddress;
	// 建筑面积
	private String  coverArea;
	// 结构
	private String  structLayer;
	// 层数
	private String  structFloor;
	// 保证金缴纳方式【1：系统自动生成保证金收款账号、2：招标文件指定账号】
	private Short bzjJiaonafangshi;
	// 开标地点
	private String  kbPlace;
	// 预审开标地点
	private String  yskbPlace;

	/** 设置  标段id 值 */
	public void setBdGuid(String bdGuid){
		this.bdGuid = bdGuid;
	}
	/** 获取 标段id 值 */
	public String getBdGuid(){
		return this.bdGuid;
	}
	/** 设置  工程id 值 */
	public void setGcGuid(String gcGuid){
		this.gcGuid = gcGuid;
	}
	/** 获取 工程id 值 */
	public String getGcGuid(){
		return this.gcGuid;
	}
	/** 设置  标段编号 值 */
	public void setBdBh(String bdBh){
		this.bdBh = bdBh;
	}
	/** 获取 标段编号 值 */
	public String getBdBh(){
		return this.bdBh;
	}
	/** 设置  标段名称 值 */
	public void setBdName(String bdName){
		this.bdName = bdName;
	}
	/** 获取 标段名称 值 */
	public String getBdName(){
		return this.bdName;
	}
	/** 设置  评标办法 值 */
	public void setPbBanfa(Short pbBanfa){
		this.pbBanfa = pbBanfa;
	}
	/** 获取 评标办法 值 */
	public Short getPbBanfa(){
		return this.pbBanfa;
	}
	/** 设置  创建时间 值 */
	public void setCreateTime(Long createTime){
		this.createTime = createTime;
	}
	/** 获取 创建时间 值 */
	public Long getCreateTime(){
		return this.createTime;
	}
	/** 设置  是否删除 值 */
	public void setIsDeleted(Boolean isDeleted){
		this.isDeleted = isDeleted;
	}
	/** 获取 是否删除 值 */
	public Boolean getIsDeleted(){
		return this.isDeleted;
	}
	/** 设置  修改时间 值 */
	public void setModifyTime(Long modifyTime){
		this.modifyTime = modifyTime;
	}
	/** 获取 修改时间 值 */
	public Long getModifyTime(){
		return this.modifyTime;
	}
	/** 设置  评标方式 值 */
	public void setPbFangshi(Integer pbFangshi){
		this.pbFangshi = pbFangshi;
	}
	/** 获取 评标方式 值 */
	public Integer getPbFangshi(){
		return this.pbFangshi;
	}
	/** 设置  是否接受联合体投标 值 */
	public void setIsJieshouLianheti(Boolean isJieshouLianheti){
		this.isJieshouLianheti = isJieshouLianheti;
	}
	/** 获取 是否接受联合体投标 值 */
	public Boolean getIsJieshouLianheti(){
		return this.isJieshouLianheti;
	}
	/** 设置  是否收取平台服务费 值 */
	public void setIsPtfwf(String isPtfwf){
		this.isPtfwf = isPtfwf;
	}
	/** 获取 是否收取平台服务费 值 */
	public String getIsPtfwf(){
		return this.isPtfwf;
	}
	/** 设置  平台服务费市区方式【“按金额收取”和“按比例收取”】 值 */
	public void setPtfwfShouqufangshi(String ptfwfShouqufangshi){
		this.ptfwfShouqufangshi = ptfwfShouqufangshi;
	}
	/** 获取 平台服务费市区方式【“按金额收取”和“按比例收取”】 值 */
	public String getPtfwfShouqufangshi(){
		return this.ptfwfShouqufangshi;
	}
	/** 设置  保证金计算方式【固定金额、固定比例】 值 */
	public void setBzjJisuanfangshi(String bzjJisuanfangshi){
		this.bzjJisuanfangshi = bzjJisuanfangshi;
	}
	/** 获取 保证金计算方式【固定金额、固定比例】 值 */
	public String getBzjJisuanfangshi(){
		return this.bzjJisuanfangshi;
	}
	/** 设置  是否有招标控制价【1：是，0：否】 值 */
	public void setIsZbkzj(String isZbkzj){
		this.isZbkzj = isZbkzj;
	}
	/** 获取 是否有招标控制价【1：是，0：否】 值 */
	public String getIsZbkzj(){
		return this.isZbkzj;
	}
	/** 设置  开标形式【线上开标、线下开标】 值 */
	public void setKaibiaoXingshi(String kaibiaoXingshi){
		this.kaibiaoXingshi = kaibiaoXingshi;
	}
	/** 获取 开标形式【线上开标、线下开标】 值 */
	public String getKaibiaoXingshi(){
		return this.kaibiaoXingshi;
	}
	/** 设置  评标形式【线上评标、线下评标】 值 */
	public void setPingbiaoXingshi(String pingbiaoXingshi){
		this.pingbiaoXingshi = pingbiaoXingshi;
	}
	/** 获取 评标形式【线上评标、线下评标】 值 */
	public String getPingbiaoXingshi(){
		return this.pingbiaoXingshi;
	}
	/** 设置  投标保证金，金额或者比例 值 */
	public void setBzjJineBili(Long bzjJineBili){
		this.bzjJineBili = bzjJineBili;
	}
	/** 获取 投标保证金，金额或者比例 值 */
	public Long getBzjJineBili(){
		return this.bzjJineBili;
	}
	/** 设置  收取金额或收取比例 值 */
	public void setPtfwfJine(Long ptfwfJine){
		this.ptfwfJine = ptfwfJine;
	}
	/** 获取 收取金额或收取比例 值 */
	public Long getPtfwfJine(){
		return this.ptfwfJine;
	}
	/** 设置  是否有清单文件【1：是，0：否】 值 */
	public void setIsQingdanwenjian(String isQingdanwenjian){
		this.isQingdanwenjian = isQingdanwenjian;
	}
	/** 获取 是否有清单文件【1：是，0：否】 值 */
	public String getIsQingdanwenjian(){
		return this.isQingdanwenjian;
	}
	/** 设置  招标文件发布时间 值 */
	public void setZbwjFabutime(Long zbwjFabutime){
		this.zbwjFabutime = zbwjFabutime;
	}
	/** 获取 招标文件发布时间 值 */
	public Long getZbwjFabutime(){
		return this.zbwjFabutime;
	}
	/** 设置  是否出售资格预审文件 值 */
	public void setYswjIssell(String yswjIssell){
		this.yswjIssell = yswjIssell;
	}
	/** 获取 是否出售资格预审文件 值 */
	public String getYswjIssell(){
		return this.yswjIssell;
	}
	/** 设置  资格预审文件标书费用金额 值 */
	public void setYswjbsJine(Long yswjbsJine){
		this.yswjbsJine = yswjbsJine;
	}
	/** 获取 资格预审文件标书费用金额 值 */
	public Long getYswjbsJine(){
		return this.yswjbsJine;
	}
	/** 设置  是否出售招标文件 值 */
	public void setZbwjIssell(String zbwjIssell){
		this.zbwjIssell = zbwjIssell;
	}
	/** 获取 是否出售招标文件 值 */
	public String getZbwjIssell(){
		return this.zbwjIssell;
	}
	/** 设置  招标文件标书费用金额 值 */
	public void setZbwjbsJine(Long zbwjbsJine){
		this.zbwjbsJine = zbwjbsJine;
	}
	/** 获取 招标文件标书费用金额 值 */
	public Long getZbwjbsJine(){
		return this.zbwjbsJine;
	}
	/** 设置  是否有图纸文件的选择 值 */
	public void setIsTuzhiwenjian(String isTuzhiwenjian){
		this.isTuzhiwenjian = isTuzhiwenjian;
	}
	/** 获取 是否有图纸文件的选择 值 */
	public String getIsTuzhiwenjian(){
		return this.isTuzhiwenjian;
	}
	/** 设置  图纸文件的押金金额 值 */
	public void setYajinjine(Long yajinjine){
		this.yajinjine = yajinjine;
	}
	/** 获取 图纸文件的押金金额 值 */
	public Long getYajinjine(){
		return this.yajinjine;
	}
	/** 设置  标段内容 值 */
	public void setBdContent(String bdContent){
		this.bdContent = bdContent;
	}
	/** 获取 标段内容 值 */
	public String getBdContent(){
		return this.bdContent;
	}
	/** 设置  工期限制 值 */
	public void setDayLimit(Long dayLimit){
		this.dayLimit = dayLimit;
	}
	/** 获取 工期限制 值 */
	public Long getDayLimit(){
		return this.dayLimit;
	}
	/** 设置  建设地址 值 */
	public void setJiansheaddress(String jiansheaddress){
		this.jiansheaddress = jiansheaddress;
	}
	/** 获取 建设地址 值 */
	public String getJiansheaddress(){
		return this.jiansheaddress;
	}
	/** 设置  运输方式 值 */
	public void setTransporttype(String transporttype){
		this.transporttype = transporttype;
	}
	/** 获取 运输方式 值 */
	public String getTransporttype(){
		return this.transporttype;
	}
	/** 设置  到站 值 */
	public void setArrivestation(String arrivestation){
		this.arrivestation = arrivestation;
	}
	/** 获取 到站 值 */
	public String getArrivestation(){
		return this.arrivestation;
	}
	/** 设置  货款结算办法 值 */
	public void setPaytype(String paytype){
		this.paytype = paytype;
	}
	/** 获取 货款结算办法 值 */
	public String getPaytype(){
		return this.paytype;
	}
	/** 设置  交货期 值 */
	public void setDeliverydate(Long deliverydate){
		this.deliverydate = deliverydate;
	}
	/** 获取 交货期 值 */
	public Long getDeliverydate(){
		return this.deliverydate;
	}
	/** 设置  交货方式 值 */
	public void setDelivertype(String delivertype){
		this.delivertype = delivertype;
	}
	/** 获取 交货方式 值 */
	public String getDelivertype(){
		return this.delivertype;
	}
	/** 设置  交货地点 值 */
	public void setDeliveraddress(String deliveraddress){
		this.deliveraddress = deliveraddress;
	}
	/** 获取 交货地点 值 */
	public String getDeliveraddress(){
		return this.deliveraddress;
	}
	/** 设置  文件递交地点 值 */
	public void setFiletoaddress(String filetoaddress){
		this.filetoaddress = filetoaddress;
	}
	/** 获取 文件递交地点 值 */
	public String getFiletoaddress(){
		return this.filetoaddress;
	}
	/** 设置  建筑面积 值 */
	public void setCoverArea(String coverArea){
		this.coverArea = coverArea;
	}
	/** 获取 建筑面积 值 */
	public String getCoverArea(){
		return this.coverArea;
	}
	/** 设置  结构 值 */
	public void setStructLayer(String structLayer){
		this.structLayer = structLayer;
	}
	/** 获取 结构 值 */
	public String getStructLayer(){
		return this.structLayer;
	}
	/** 设置  层数 值 */
	public void setStructFloor(String structFloor){
		this.structFloor = structFloor;
	}
	/** 获取 层数 值 */
	public String getStructFloor(){
		return this.structFloor;
	}
	/** 设置  保证金缴纳方式【1：系统自动生成保证金收款账号、2：招标文件指定账号】 值 */
	public void setBzjJiaonafangshi(Short bzjJiaonafangshi){
		this.bzjJiaonafangshi = bzjJiaonafangshi;
	}
	/** 获取 保证金缴纳方式【1：系统自动生成保证金收款账号、2：招标文件指定账号】 值 */
	public Short getBzjJiaonafangshi(){
		return this.bzjJiaonafangshi;
	}
	/** 设置  开标地点 值 */
	public void setKbPlace(String kbPlace){
		this.kbPlace = kbPlace;
	}
	/** 获取 开标地点 值 */
	public String getKbPlace(){
		return this.kbPlace;
	}
	/** 设置  预审开标地点 值 */
	public void setYskbPlace(String yskbPlace){
		this.yskbPlace = yskbPlace;
	}
	/** 获取 预审开标地点 值 */
	public String getYskbPlace(){
		return this.yskbPlace;
	}

}