package tk.ljyuan71.permissions.zbdl.model;

import java.io.Serializable;

/**
 * 
 * 表ZB_GC_ZBDL实体
 */
public class ZBGcZbdl implements Serializable {
private static final long serialVersionUID = 1L;
	// 主键id
	private String  gcZbdlGuid;
	// 工程id
	private String  gcGuid;
	// 事项id
	private String  shixiangGuid;
	// 招标代理id
	private String  zbdlGuid;
	// 招标代理编号
	private String  zbdlBh;
	// 招标代理名称
	private String  zbdlName;
	// 资质等级
	private String  zbdlZizhiDengji;
	// 资质证书号
	private String  zbdlZizhiZhengshuBh;
	// 负责人
	private String  zbdlFuzerenName;
	// 负责人职务
	private String  zbdlFuzerenZhiwu;
	// 招标负责人
	private String  zbdlZbFuzerenName;
	// 招标负责人联系电话
	private String  zbdlZbFuzerenPhone;
	// 招标负责人手机
	private String  zbdlZbFuzerenMobile;
	// 招标负责人邮箱
	private String  zbdlZbFuzerenEmail;
	// 经办人
	private String  zbdlJinbanrenName;
	// 经办人手机
	private String  zbdlJinbanrenMobile;
	// 经办人邮箱
	private String  zbdlJinbanrenEmail;
	// 经办人联系电话
	private String  zbdlJinbanrenPhone;
	// 修改次数
	private Integer  xiugaiCishu;
	// 是否删除
	private Boolean isDeleted;
	// 是否兜底方案新增
	private Boolean isDoudiXinzeng;
	// 是否兜底方案修改
	private Boolean isDoudiXiugai;
	// 修改时间
	private Long  modifyTime;
	// 招标代理权限
	private String  zbdlQuanxian;
	// 招标代理机构地址
	private String  zbdlAddress;
	// 招标代理机构邮编
	private String  zbdlPostcode;

	/** 设置  主键id 值 */
	public void setGcZbdlGuid(String gcZbdlGuid){
		this.gcZbdlGuid = gcZbdlGuid;
	}
	/** 获取 主键id 值 */
	public String getGcZbdlGuid(){
		return this.gcZbdlGuid;
	}
	/** 设置  工程id 值 */
	public void setGcGuid(String gcGuid){
		this.gcGuid = gcGuid;
	}
	/** 获取 工程id 值 */
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
	/** 设置  招标代理id 值 */
	public void setZbdlGuid(String zbdlGuid){
		this.zbdlGuid = zbdlGuid;
	}
	/** 获取 招标代理id 值 */
	public String getZbdlGuid(){
		return this.zbdlGuid;
	}
	/** 设置  招标代理编号 值 */
	public void setZbdlBh(String zbdlBh){
		this.zbdlBh = zbdlBh;
	}
	/** 获取 招标代理编号 值 */
	public String getZbdlBh(){
		return this.zbdlBh;
	}
	/** 设置  招标代理名称 值 */
	public void setZbdlName(String zbdlName){
		this.zbdlName = zbdlName;
	}
	/** 获取 招标代理名称 值 */
	public String getZbdlName(){
		return this.zbdlName;
	}
	/** 设置  资质等级 值 */
	public void setZbdlZizhiDengji(String zbdlZizhiDengji){
		this.zbdlZizhiDengji = zbdlZizhiDengji;
	}
	/** 获取 资质等级 值 */
	public String getZbdlZizhiDengji(){
		return this.zbdlZizhiDengji;
	}
	/** 设置  资质证书号 值 */
	public void setZbdlZizhiZhengshuBh(String zbdlZizhiZhengshuBh){
		this.zbdlZizhiZhengshuBh = zbdlZizhiZhengshuBh;
	}
	/** 获取 资质证书号 值 */
	public String getZbdlZizhiZhengshuBh(){
		return this.zbdlZizhiZhengshuBh;
	}
	/** 设置  负责人 值 */
	public void setZbdlFuzerenName(String zbdlFuzerenName){
		this.zbdlFuzerenName = zbdlFuzerenName;
	}
	/** 获取 负责人 值 */
	public String getZbdlFuzerenName(){
		return this.zbdlFuzerenName;
	}
	/** 设置  负责人职务 值 */
	public void setZbdlFuzerenZhiwu(String zbdlFuzerenZhiwu){
		this.zbdlFuzerenZhiwu = zbdlFuzerenZhiwu;
	}
	/** 获取 负责人职务 值 */
	public String getZbdlFuzerenZhiwu(){
		return this.zbdlFuzerenZhiwu;
	}
	/** 设置  招标负责人 值 */
	public void setZbdlZbFuzerenName(String zbdlZbFuzerenName){
		this.zbdlZbFuzerenName = zbdlZbFuzerenName;
	}
	/** 获取 招标负责人 值 */
	public String getZbdlZbFuzerenName(){
		return this.zbdlZbFuzerenName;
	}
	/** 设置  招标负责人联系电话 值 */
	public void setZbdlZbFuzerenPhone(String zbdlZbFuzerenPhone){
		this.zbdlZbFuzerenPhone = zbdlZbFuzerenPhone;
	}
	/** 获取 招标负责人联系电话 值 */
	public String getZbdlZbFuzerenPhone(){
		return this.zbdlZbFuzerenPhone;
	}
	/** 设置  招标负责人手机 值 */
	public void setZbdlZbFuzerenMobile(String zbdlZbFuzerenMobile){
		this.zbdlZbFuzerenMobile = zbdlZbFuzerenMobile;
	}
	/** 获取 招标负责人手机 值 */
	public String getZbdlZbFuzerenMobile(){
		return this.zbdlZbFuzerenMobile;
	}
	/** 设置  招标负责人邮箱 值 */
	public void setZbdlZbFuzerenEmail(String zbdlZbFuzerenEmail){
		this.zbdlZbFuzerenEmail = zbdlZbFuzerenEmail;
	}
	/** 获取 招标负责人邮箱 值 */
	public String getZbdlZbFuzerenEmail(){
		return this.zbdlZbFuzerenEmail;
	}
	/** 设置  经办人 值 */
	public void setZbdlJinbanrenName(String zbdlJinbanrenName){
		this.zbdlJinbanrenName = zbdlJinbanrenName;
	}
	/** 获取 经办人 值 */
	public String getZbdlJinbanrenName(){
		return this.zbdlJinbanrenName;
	}
	/** 设置  经办人手机 值 */
	public void setZbdlJinbanrenMobile(String zbdlJinbanrenMobile){
		this.zbdlJinbanrenMobile = zbdlJinbanrenMobile;
	}
	/** 获取 经办人手机 值 */
	public String getZbdlJinbanrenMobile(){
		return this.zbdlJinbanrenMobile;
	}
	/** 设置  经办人邮箱 值 */
	public void setZbdlJinbanrenEmail(String zbdlJinbanrenEmail){
		this.zbdlJinbanrenEmail = zbdlJinbanrenEmail;
	}
	/** 获取 经办人邮箱 值 */
	public String getZbdlJinbanrenEmail(){
		return this.zbdlJinbanrenEmail;
	}
	/** 设置  经办人联系电话 值 */
	public void setZbdlJinbanrenPhone(String zbdlJinbanrenPhone){
		this.zbdlJinbanrenPhone = zbdlJinbanrenPhone;
	}
	/** 获取 经办人联系电话 值 */
	public String getZbdlJinbanrenPhone(){
		return this.zbdlJinbanrenPhone;
	}
	/** 设置  修改次数 值 */
	public void setXiugaiCishu(Integer xiugaiCishu){
		this.xiugaiCishu = xiugaiCishu;
	}
	/** 获取 修改次数 值 */
	public Integer getXiugaiCishu(){
		return this.xiugaiCishu;
	}
	/** 设置  是否删除 值 */
	public void setIsDeleted(Boolean isDeleted){
		this.isDeleted = isDeleted;
	}
	/** 获取 是否删除 值 */
	public Boolean getIsDeleted(){
		return this.isDeleted;
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
	/** 设置  修改时间 值 */
	public void setModifyTime(Long modifyTime){
		this.modifyTime = modifyTime;
	}
	/** 获取 修改时间 值 */
	public Long getModifyTime(){
		return this.modifyTime;
	}
	/** 设置  招标代理权限 值 */
	public void setZbdlQuanxian(String zbdlQuanxian){
		this.zbdlQuanxian = zbdlQuanxian;
	}
	/** 获取 招标代理权限 值 */
	public String getZbdlQuanxian(){
		return this.zbdlQuanxian;
	}
	/** 设置  招标代理机构地址 值 */
	public void setZbdlAddress(String zbdlAddress){
		this.zbdlAddress = zbdlAddress;
	}
	/** 获取 招标代理机构地址 值 */
	public String getZbdlAddress(){
		return this.zbdlAddress;
	}
	/** 设置  招标代理机构邮编 值 */
	public void setZbdlPostcode(String zbdlPostcode){
		this.zbdlPostcode = zbdlPostcode;
	}
	/** 获取 招标代理机构邮编 值 */
	public String getZbdlPostcode(){
		return this.zbdlPostcode;
	}

}