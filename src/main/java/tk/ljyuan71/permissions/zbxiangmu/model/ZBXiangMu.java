package tk.ljyuan71.permissions.zbxiangmu.model;

import java.io.Serializable;

/**
 * 
 * 表ZB_XIANGMU实体
 */
public class ZBXiangMu implements Serializable {
private static final long serialVersionUID = 1L;
	// 项目id
	private String  xmGuid;
	// 项目报建id
	private String  xmBaojianBh;
	// 项目编号
	private String  xmBh;
	// 项目名称
	private String  xmName;
	// 项目地址
	private String  xmDizhi;
	// 是否重大项目
	private Boolean isZhongdaXm;
	// 重大项目编号
	private String  zhongdaXmBh;
	// 重大项目名称
	private String  zhongdaXmName;
	// 是否场外项目
	private Boolean isChangwaiXm;
	// 是否政府投资
	private Boolean isZhengfuTouzi;
	// 主管部门编号
	private String  zhuguanBumenBh;
	// 主管部门名称
	private String  zhuguanBumenName;
	// 计划立项文号
	private String  jihuaLixiangBh;
	// 计划立项文号附件
	private String  jihuaLixiangFujian;
	// 计划立项文号附件名称
	private String  jihuaLixiangFujianName;
	// 规划许可证号
	private String  guihuaXukeBh;
	// 规划许可证附件组
	private String  guihuaXukeFujian;
	// 规划许可证附件名称
	private String  guihuaXukeFujianName;
	// 宗地号
	private String  zongdiBh;
	// 其他批复文号
	private String  qitaPifuBh;
	// 其他批复文号附件组
	private String  qitaPifuFujian;
	// 其他批复文号附件名称
	private String  qitaPifuFujianName;
	// 其他批复文号附件名称
	private String  zbrGuid;
	// 建设单位编号
	private String  zbrBh;
	// 建设单位名称
	private String  zbrName;
	// 单位联系人
	private String  lianxirenName;
	// 联系人电话
	private String  lianxirenPhone;
	// 联系人手机号
	private String  lianxirenMobile;
	// 项目所在行政区代码
	private String  xingzhengDiquBh;
	// 项目行业分类
	private String  hangyeBh;
	// 政府投资比例
	private Double  zijinLaiyuanZhengfu;
	// 国企投资比例
	private Double  zijinLaiyuanGuoqi;
	// 私企投资比例
	private Double  zijinLaiyuanSiqi;
	// 集体投资比例
	private Double  zijinLaiyuanJiti;
	// 外资投资比例
	private Double  zijinLaiyuanWaizi;
	// 其他投资比例
	private Double  zijinLaiyuanQita;
	// 经办人
	private String  jingbanrenName;
	// 经办人手机
	private String  jingbanrenMobile;
	// 经办人联系电话
	private String  jingbanrenPhone;
	// 经办人微信号
	private String  jingbanrenWeixin;
	// 建设规模
	private String  jiansheGuimo;
	// 计划总投资币种
	private String  jihuaZongtouziBizhong;
	// 计划总投资金额
	private Long  jihuaZongtouziJe;
	// 建筑面积
	private Double  jianzhuMianji;
	// 特殊情况说明
	private String  teshuQingkuang;
	// 特殊说明附件组
	private String  teshuQingkuangFujian;
	// 特殊说明附件名称
	private String  teshuQingkuangFujianName;
	// 创建时间
	private Long  createTime;
	// 创建人id
	private String  creatorGuid;
	// 创建人名称
	private String  creatorName;
	// 创建人名称
	private Long  modifyTime;
	// 修改时间
	private String  modifierName;
	// 报建企业编号
	private String  baojianQiyeBh;
	// 审批状态
	private Integer  shenpiZhuangtai;
	// 是否删除状态
	private Boolean isDeleted;
	// 是否应急项目
	private Boolean isYingjiGc;
	// 是否兜底方案新增
	private Boolean isDoudiXinzeng;
	// 是否兜底方案修改
	private Boolean isDoudiXiugai;
	// 项目流水号
	private String  serialNumber;
	// 申请时间
	private Long  applyTime;
	// 项目分类
	private String  proClassification;
	// 项目分类-二级子类
	private String  proClassificationSub;
	// 是否重点区域
	private Boolean keyArea;
	// 重点区域名称
	private String  keyAreaName;
	// 核准备案证编号
	private String  approvalrecordNumber;
	// 建设工程用地许可证
	private String  landplanningPermission;
	// 项目来源
	private Integer  xmLaiyuan;
	// 协议单位编号
	private String  xieyiDanweiBh;
	// 协议单位名称
	private String  xieyiDanweiName;
	// 项目编号2
	private String  xmBh2;
	// 省id
	private Integer  province;
	// 市id
	private Integer  city;
	// 区id
	private Integer  area;
	// 是否最终确认
	private Boolean queRen;
	// 资金来源
	private String  zijinLaiyuan;
	// 二级行业编号
	private String  hangyeBhErji;
	// 其他招标人id
	private String  otherZbrGuid;
	// 其他招标人编号
	private String  otherZbrBh;
	// 其他招标人名称
	private String  otherZbrName;
	// 项目文件
	private String  xiangmuwenjian;
	// 旧的项目文件
	private String  xiangmuwenjianoldname;
	// 是否指派项目
	private Boolean isTask;
	// 负责人id
	private String  fzrGuid;
	// 任务指派id
	private String  taskzpGuid;
	// 招标人地址
	private String  zbrAddress;
	// 项目平台编号
	private String  xmPtbh;
	// 行业三级分类
	private String  hangyeBhSanji;
	// 行业四级分类
	private String  hangyeBhSiji;
	// 项目下招标项目的最大流水
	private Integer  maxLiushui;
	// 项目下删除的招标项目的流水号 
	private String  deletedLiushui;

	/** 设置  项目id 值 */
	public void setXmGuid(String xmGuid){
		this.xmGuid = xmGuid;
	}
	/** 获取 项目id 值 */
	public String getXmGuid(){
		return this.xmGuid;
	}
	/** 设置  项目报建id 值 */
	public void setXmBaojianBh(String xmBaojianBh){
		this.xmBaojianBh = xmBaojianBh;
	}
	/** 获取 项目报建id 值 */
	public String getXmBaojianBh(){
		return this.xmBaojianBh;
	}
	/** 设置  项目编号 值 */
	public void setXmBh(String xmBh){
		this.xmBh = xmBh;
	}
	/** 获取 项目编号 值 */
	public String getXmBh(){
		return this.xmBh;
	}
	/** 设置  项目名称 值 */
	public void setXmName(String xmName){
		this.xmName = xmName;
	}
	/** 获取 项目名称 值 */
	public String getXmName(){
		return this.xmName;
	}
	/** 设置  项目地址 值 */
	public void setXmDizhi(String xmDizhi){
		this.xmDizhi = xmDizhi;
	}
	/** 获取 项目地址 值 */
	public String getXmDizhi(){
		return this.xmDizhi;
	}
	/** 设置  是否重大项目 值 */
	public void setIsZhongdaXm(Boolean isZhongdaXm){
		this.isZhongdaXm = isZhongdaXm;
	}
	/** 获取 是否重大项目 值 */
	public Boolean getIsZhongdaXm(){
		return this.isZhongdaXm;
	}
	/** 设置  重大项目编号 值 */
	public void setZhongdaXmBh(String zhongdaXmBh){
		this.zhongdaXmBh = zhongdaXmBh;
	}
	/** 获取 重大项目编号 值 */
	public String getZhongdaXmBh(){
		return this.zhongdaXmBh;
	}
	/** 设置  重大项目名称 值 */
	public void setZhongdaXmName(String zhongdaXmName){
		this.zhongdaXmName = zhongdaXmName;
	}
	/** 获取 重大项目名称 值 */
	public String getZhongdaXmName(){
		return this.zhongdaXmName;
	}
	/** 设置  是否场外项目 值 */
	public void setIsChangwaiXm(Boolean isChangwaiXm){
		this.isChangwaiXm = isChangwaiXm;
	}
	/** 获取 是否场外项目 值 */
	public Boolean getIsChangwaiXm(){
		return this.isChangwaiXm;
	}
	/** 设置  是否政府投资 值 */
	public void setIsZhengfuTouzi(Boolean isZhengfuTouzi){
		this.isZhengfuTouzi = isZhengfuTouzi;
	}
	/** 获取 是否政府投资 值 */
	public Boolean getIsZhengfuTouzi(){
		return this.isZhengfuTouzi;
	}
	/** 设置  主管部门编号 值 */
	public void setZhuguanBumenBh(String zhuguanBumenBh){
		this.zhuguanBumenBh = zhuguanBumenBh;
	}
	/** 获取 主管部门编号 值 */
	public String getZhuguanBumenBh(){
		return this.zhuguanBumenBh;
	}
	/** 设置  主管部门名称 值 */
	public void setZhuguanBumenName(String zhuguanBumenName){
		this.zhuguanBumenName = zhuguanBumenName;
	}
	/** 获取 主管部门名称 值 */
	public String getZhuguanBumenName(){
		return this.zhuguanBumenName;
	}
	/** 设置  计划立项文号 值 */
	public void setJihuaLixiangBh(String jihuaLixiangBh){
		this.jihuaLixiangBh = jihuaLixiangBh;
	}
	/** 获取 计划立项文号 值 */
	public String getJihuaLixiangBh(){
		return this.jihuaLixiangBh;
	}
	/** 设置  计划立项文号附件 值 */
	public void setJihuaLixiangFujian(String jihuaLixiangFujian){
		this.jihuaLixiangFujian = jihuaLixiangFujian;
	}
	/** 获取 计划立项文号附件 值 */
	public String getJihuaLixiangFujian(){
		return this.jihuaLixiangFujian;
	}
	/** 设置  计划立项文号附件名称 值 */
	public void setJihuaLixiangFujianName(String jihuaLixiangFujianName){
		this.jihuaLixiangFujianName = jihuaLixiangFujianName;
	}
	/** 获取 计划立项文号附件名称 值 */
	public String getJihuaLixiangFujianName(){
		return this.jihuaLixiangFujianName;
	}
	/** 设置  规划许可证号 值 */
	public void setGuihuaXukeBh(String guihuaXukeBh){
		this.guihuaXukeBh = guihuaXukeBh;
	}
	/** 获取 规划许可证号 值 */
	public String getGuihuaXukeBh(){
		return this.guihuaXukeBh;
	}
	/** 设置  规划许可证附件组 值 */
	public void setGuihuaXukeFujian(String guihuaXukeFujian){
		this.guihuaXukeFujian = guihuaXukeFujian;
	}
	/** 获取 规划许可证附件组 值 */
	public String getGuihuaXukeFujian(){
		return this.guihuaXukeFujian;
	}
	/** 设置  规划许可证附件名称 值 */
	public void setGuihuaXukeFujianName(String guihuaXukeFujianName){
		this.guihuaXukeFujianName = guihuaXukeFujianName;
	}
	/** 获取 规划许可证附件名称 值 */
	public String getGuihuaXukeFujianName(){
		return this.guihuaXukeFujianName;
	}
	/** 设置  宗地号 值 */
	public void setZongdiBh(String zongdiBh){
		this.zongdiBh = zongdiBh;
	}
	/** 获取 宗地号 值 */
	public String getZongdiBh(){
		return this.zongdiBh;
	}
	/** 设置  其他批复文号 值 */
	public void setQitaPifuBh(String qitaPifuBh){
		this.qitaPifuBh = qitaPifuBh;
	}
	/** 获取 其他批复文号 值 */
	public String getQitaPifuBh(){
		return this.qitaPifuBh;
	}
	/** 设置  其他批复文号附件组 值 */
	public void setQitaPifuFujian(String qitaPifuFujian){
		this.qitaPifuFujian = qitaPifuFujian;
	}
	/** 获取 其他批复文号附件组 值 */
	public String getQitaPifuFujian(){
		return this.qitaPifuFujian;
	}
	/** 设置  其他批复文号附件名称 值 */
	public void setQitaPifuFujianName(String qitaPifuFujianName){
		this.qitaPifuFujianName = qitaPifuFujianName;
	}
	/** 获取 其他批复文号附件名称 值 */
	public String getQitaPifuFujianName(){
		return this.qitaPifuFujianName;
	}
	/** 设置  其他批复文号附件名称 值 */
	public void setZbrGuid(String zbrGuid){
		this.zbrGuid = zbrGuid;
	}
	/** 获取 其他批复文号附件名称 值 */
	public String getZbrGuid(){
		return this.zbrGuid;
	}
	/** 设置  建设单位编号 值 */
	public void setZbrBh(String zbrBh){
		this.zbrBh = zbrBh;
	}
	/** 获取 建设单位编号 值 */
	public String getZbrBh(){
		return this.zbrBh;
	}
	/** 设置  建设单位名称 值 */
	public void setZbrName(String zbrName){
		this.zbrName = zbrName;
	}
	/** 获取 建设单位名称 值 */
	public String getZbrName(){
		return this.zbrName;
	}
	/** 设置  单位联系人 值 */
	public void setLianxirenName(String lianxirenName){
		this.lianxirenName = lianxirenName;
	}
	/** 获取 单位联系人 值 */
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
	/** 设置  项目所在行政区代码 值 */
	public void setXingzhengDiquBh(String xingzhengDiquBh){
		this.xingzhengDiquBh = xingzhengDiquBh;
	}
	/** 获取 项目所在行政区代码 值 */
	public String getXingzhengDiquBh(){
		return this.xingzhengDiquBh;
	}
	/** 设置  项目行业分类 值 */
	public void setHangyeBh(String hangyeBh){
		this.hangyeBh = hangyeBh;
	}
	/** 获取 项目行业分类 值 */
	public String getHangyeBh(){
		return this.hangyeBh;
	}
	/** 设置  政府投资比例 值 */
	public void setZijinLaiyuanZhengfu(Double zijinLaiyuanZhengfu){
		this.zijinLaiyuanZhengfu = zijinLaiyuanZhengfu;
	}
	/** 获取 政府投资比例 值 */
	public Double getZijinLaiyuanZhengfu(){
		return this.zijinLaiyuanZhengfu;
	}
	/** 设置  国企投资比例 值 */
	public void setZijinLaiyuanGuoqi(Double zijinLaiyuanGuoqi){
		this.zijinLaiyuanGuoqi = zijinLaiyuanGuoqi;
	}
	/** 获取 国企投资比例 值 */
	public Double getZijinLaiyuanGuoqi(){
		return this.zijinLaiyuanGuoqi;
	}
	/** 设置  私企投资比例 值 */
	public void setZijinLaiyuanSiqi(Double zijinLaiyuanSiqi){
		this.zijinLaiyuanSiqi = zijinLaiyuanSiqi;
	}
	/** 获取 私企投资比例 值 */
	public Double getZijinLaiyuanSiqi(){
		return this.zijinLaiyuanSiqi;
	}
	/** 设置  集体投资比例 值 */
	public void setZijinLaiyuanJiti(Double zijinLaiyuanJiti){
		this.zijinLaiyuanJiti = zijinLaiyuanJiti;
	}
	/** 获取 集体投资比例 值 */
	public Double getZijinLaiyuanJiti(){
		return this.zijinLaiyuanJiti;
	}
	/** 设置  外资投资比例 值 */
	public void setZijinLaiyuanWaizi(Double zijinLaiyuanWaizi){
		this.zijinLaiyuanWaizi = zijinLaiyuanWaizi;
	}
	/** 获取 外资投资比例 值 */
	public Double getZijinLaiyuanWaizi(){
		return this.zijinLaiyuanWaizi;
	}
	/** 设置  其他投资比例 值 */
	public void setZijinLaiyuanQita(Double zijinLaiyuanQita){
		this.zijinLaiyuanQita = zijinLaiyuanQita;
	}
	/** 获取 其他投资比例 值 */
	public Double getZijinLaiyuanQita(){
		return this.zijinLaiyuanQita;
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
	/** 设置  建设规模 值 */
	public void setJiansheGuimo(String jiansheGuimo){
		this.jiansheGuimo = jiansheGuimo;
	}
	/** 获取 建设规模 值 */
	public String getJiansheGuimo(){
		return this.jiansheGuimo;
	}
	/** 设置  计划总投资币种 值 */
	public void setJihuaZongtouziBizhong(String jihuaZongtouziBizhong){
		this.jihuaZongtouziBizhong = jihuaZongtouziBizhong;
	}
	/** 获取 计划总投资币种 值 */
	public String getJihuaZongtouziBizhong(){
		return this.jihuaZongtouziBizhong;
	}
	/** 设置  计划总投资金额 值 */
	public void setJihuaZongtouziJe(Long jihuaZongtouziJe){
		this.jihuaZongtouziJe = jihuaZongtouziJe;
	}
	/** 获取 计划总投资金额 值 */
	public Long getJihuaZongtouziJe(){
		return this.jihuaZongtouziJe;
	}
	/** 设置  建筑面积 值 */
	public void setJianzhuMianji(Double jianzhuMianji){
		this.jianzhuMianji = jianzhuMianji;
	}
	/** 获取 建筑面积 值 */
	public Double getJianzhuMianji(){
		return this.jianzhuMianji;
	}
	/** 设置  特殊情况说明 值 */
	public void setTeshuQingkuang(String teshuQingkuang){
		this.teshuQingkuang = teshuQingkuang;
	}
	/** 获取 特殊情况说明 值 */
	public String getTeshuQingkuang(){
		return this.teshuQingkuang;
	}
	/** 设置  特殊说明附件组 值 */
	public void setTeshuQingkuangFujian(String teshuQingkuangFujian){
		this.teshuQingkuangFujian = teshuQingkuangFujian;
	}
	/** 获取 特殊说明附件组 值 */
	public String getTeshuQingkuangFujian(){
		return this.teshuQingkuangFujian;
	}
	/** 设置  特殊说明附件名称 值 */
	public void setTeshuQingkuangFujianName(String teshuQingkuangFujianName){
		this.teshuQingkuangFujianName = teshuQingkuangFujianName;
	}
	/** 获取 特殊说明附件名称 值 */
	public String getTeshuQingkuangFujianName(){
		return this.teshuQingkuangFujianName;
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
	/** 设置  创建人名称 值 */
	public void setModifyTime(Long modifyTime){
		this.modifyTime = modifyTime;
	}
	/** 获取 创建人名称 值 */
	public Long getModifyTime(){
		return this.modifyTime;
	}
	/** 设置  修改时间 值 */
	public void setModifierName(String modifierName){
		this.modifierName = modifierName;
	}
	/** 获取 修改时间 值 */
	public String getModifierName(){
		return this.modifierName;
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
	/** 设置  是否删除状态 值 */
	public void setIsDeleted(Boolean isDeleted){
		this.isDeleted = isDeleted;
	}
	/** 获取 是否删除状态 值 */
	public Boolean getIsDeleted(){
		return this.isDeleted;
	}
	/** 设置  是否应急项目 值 */
	public void setIsYingjiGc(Boolean isYingjiGc){
		this.isYingjiGc = isYingjiGc;
	}
	/** 获取 是否应急项目 值 */
	public Boolean getIsYingjiGc(){
		return this.isYingjiGc;
	}
	/** 设置  是否兜底方案新增 值 */
	public void setIsDoudiXinzeng(Boolean isDoudiXinzeng){
		this.isDoudiXinzeng = isDoudiXinzeng;
	}
	/** 获取 是否兜底方案新增 值 */
	public Boolean getIsDoudiXinzeng(){
		return this.isDoudiXinzeng;
	}
	/** 设置  是否兜底方案修改 值 */
	public void setIsDoudiXiugai(Boolean isDoudiXiugai){
		this.isDoudiXiugai = isDoudiXiugai;
	}
	/** 获取 是否兜底方案修改 值 */
	public Boolean getIsDoudiXiugai(){
		return this.isDoudiXiugai;
	}
	/** 设置  项目流水号 值 */
	public void setSerialNumber(String serialNumber){
		this.serialNumber = serialNumber;
	}
	/** 获取 项目流水号 值 */
	public String getSerialNumber(){
		return this.serialNumber;
	}
	/** 设置  申请时间 值 */
	public void setApplyTime(Long applyTime){
		this.applyTime = applyTime;
	}
	/** 获取 申请时间 值 */
	public Long getApplyTime(){
		return this.applyTime;
	}
	/** 设置  项目分类 值 */
	public void setProClassification(String proClassification){
		this.proClassification = proClassification;
	}
	/** 获取 项目分类 值 */
	public String getProClassification(){
		return this.proClassification;
	}
	/** 设置  项目分类-二级子类 值 */
	public void setProClassificationSub(String proClassificationSub){
		this.proClassificationSub = proClassificationSub;
	}
	/** 获取 项目分类-二级子类 值 */
	public String getProClassificationSub(){
		return this.proClassificationSub;
	}
	/** 设置  是否重点区域 值 */
	public void setKeyArea(Boolean keyArea){
		this.keyArea = keyArea;
	}
	/** 获取 是否重点区域 值 */
	public Boolean getKeyArea(){
		return this.keyArea;
	}
	/** 设置  重点区域名称 值 */
	public void setKeyAreaName(String keyAreaName){
		this.keyAreaName = keyAreaName;
	}
	/** 获取 重点区域名称 值 */
	public String getKeyAreaName(){
		return this.keyAreaName;
	}
	/** 设置  核准备案证编号 值 */
	public void setApprovalrecordNumber(String approvalrecordNumber){
		this.approvalrecordNumber = approvalrecordNumber;
	}
	/** 获取 核准备案证编号 值 */
	public String getApprovalrecordNumber(){
		return this.approvalrecordNumber;
	}
	/** 设置  建设工程用地许可证 值 */
	public void setLandplanningPermission(String landplanningPermission){
		this.landplanningPermission = landplanningPermission;
	}
	/** 获取 建设工程用地许可证 值 */
	public String getLandplanningPermission(){
		return this.landplanningPermission;
	}
	/** 设置  项目来源 值 */
	public void setXmLaiyuan(Integer xmLaiyuan){
		this.xmLaiyuan = xmLaiyuan;
	}
	/** 获取 项目来源 值 */
	public Integer getXmLaiyuan(){
		return this.xmLaiyuan;
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
	/** 设置  项目编号2 值 */
	public void setXmBh2(String xmBh2){
		this.xmBh2 = xmBh2;
	}
	/** 获取 项目编号2 值 */
	public String getXmBh2(){
		return this.xmBh2;
	}
	/** 设置  省id 值 */
	public void setProvince(Integer province){
		this.province = province;
	}
	/** 获取 省id 值 */
	public Integer getProvince(){
		return this.province;
	}
	/** 设置  市id 值 */
	public void setCity(Integer city){
		this.city = city;
	}
	/** 获取 市id 值 */
	public Integer getCity(){
		return this.city;
	}
	/** 设置  区id 值 */
	public void setArea(Integer area){
		this.area = area;
	}
	/** 获取 区id 值 */
	public Integer getArea(){
		return this.area;
	}
	/** 设置  是否最终确认 值 */
	public void setQueRen(Boolean queRen){
		this.queRen = queRen;
	}
	/** 获取 是否最终确认 值 */
	public Boolean getQueRen(){
		return this.queRen;
	}
	/** 设置  资金来源 值 */
	public void setZijinLaiyuan(String zijinLaiyuan){
		this.zijinLaiyuan = zijinLaiyuan;
	}
	/** 获取 资金来源 值 */
	public String getZijinLaiyuan(){
		return this.zijinLaiyuan;
	}
	/** 设置  二级行业编号 值 */
	public void setHangyeBhErji(String hangyeBhErji){
		this.hangyeBhErji = hangyeBhErji;
	}
	/** 获取 二级行业编号 值 */
	public String getHangyeBhErji(){
		return this.hangyeBhErji;
	}
	/** 设置  其他招标人id 值 */
	public void setOtherZbrGuid(String otherZbrGuid){
		this.otherZbrGuid = otherZbrGuid;
	}
	/** 获取 其他招标人id 值 */
	public String getOtherZbrGuid(){
		return this.otherZbrGuid;
	}
	/** 设置  其他招标人编号 值 */
	public void setOtherZbrBh(String otherZbrBh){
		this.otherZbrBh = otherZbrBh;
	}
	/** 获取 其他招标人编号 值 */
	public String getOtherZbrBh(){
		return this.otherZbrBh;
	}
	/** 设置  其他招标人名称 值 */
	public void setOtherZbrName(String otherZbrName){
		this.otherZbrName = otherZbrName;
	}
	/** 获取 其他招标人名称 值 */
	public String getOtherZbrName(){
		return this.otherZbrName;
	}
	/** 设置  项目文件 值 */
	public void setXiangmuwenjian(String xiangmuwenjian){
		this.xiangmuwenjian = xiangmuwenjian;
	}
	/** 获取 项目文件 值 */
	public String getXiangmuwenjian(){
		return this.xiangmuwenjian;
	}
	/** 设置  旧的项目文件 值 */
	public void setXiangmuwenjianoldname(String xiangmuwenjianoldname){
		this.xiangmuwenjianoldname = xiangmuwenjianoldname;
	}
	/** 获取 旧的项目文件 值 */
	public String getXiangmuwenjianoldname(){
		return this.xiangmuwenjianoldname;
	}
	/** 设置  是否指派项目 值 */
	public void setIsTask(Boolean isTask){
		this.isTask = isTask;
	}
	/** 获取 是否指派项目 值 */
	public Boolean getIsTask(){
		return this.isTask;
	}
	/** 设置  负责人id 值 */
	public void setFzrGuid(String fzrGuid){
		this.fzrGuid = fzrGuid;
	}
	/** 获取 负责人id 值 */
	public String getFzrGuid(){
		return this.fzrGuid;
	}
	/** 设置  任务指派id 值 */
	public void setTaskzpGuid(String taskzpGuid){
		this.taskzpGuid = taskzpGuid;
	}
	/** 获取 任务指派id 值 */
	public String getTaskzpGuid(){
		return this.taskzpGuid;
	}
	/** 设置  招标人地址 值 */
	public void setZbrAddress(String zbrAddress){
		this.zbrAddress = zbrAddress;
	}
	/** 获取 招标人地址 值 */
	public String getZbrAddress(){
		return this.zbrAddress;
	}
	/** 设置  项目平台编号 值 */
	public void setXmPtbh(String xmPtbh){
		this.xmPtbh = xmPtbh;
	}
	/** 获取 项目平台编号 值 */
	public String getXmPtbh(){
		return this.xmPtbh;
	}
	/** 设置  行业三级分类 值 */
	public void setHangyeBhSanji(String hangyeBhSanji){
		this.hangyeBhSanji = hangyeBhSanji;
	}
	/** 获取 行业三级分类 值 */
	public String getHangyeBhSanji(){
		return this.hangyeBhSanji;
	}
	/** 设置  行业四级分类 值 */
	public void setHangyeBhSiji(String hangyeBhSiji){
		this.hangyeBhSiji = hangyeBhSiji;
	}
	/** 获取 行业四级分类 值 */
	public String getHangyeBhSiji(){
		return this.hangyeBhSiji;
	}
	/** 设置  项目下招标项目的最大流水 值 */
	public void setMaxLiushui(Integer maxLiushui){
		this.maxLiushui = maxLiushui;
	}
	/** 获取 项目下招标项目的最大流水 值 */
	public Integer getMaxLiushui(){
		return this.maxLiushui;
	}
	/** 设置  项目下删除的招标项目的流水号  值 */
	public void setDeletedLiushui(String deletedLiushui){
		this.deletedLiushui = deletedLiushui;
	}
	/** 获取 项目下删除的招标项目的流水号  值 */
	public String getDeletedLiushui(){
		return this.deletedLiushui;
	}

}