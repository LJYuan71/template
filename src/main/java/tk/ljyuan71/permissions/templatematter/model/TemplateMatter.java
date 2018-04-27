package tk.ljyuan71.permissions.templatematter.model;

import java.io.Serializable;

/**
 * 模板事项表
 * 表TEMPLATE_MATTER实体
 */
public class TemplateMatter implements Serializable {
private static final long serialVersionUID = 1L;
	// 事项主键
	private String  guid;
	// 事项名称
	private String  matterName;
	// 事项备注
	private String  remark;
	// 是否删除
	private Boolean isDeleted;

	/** 设置  事项主键 值 */
	public void setGuid(String guid){
		this.guid = guid;
	}
	/** 获取 事项主键 值 */
	public String getGuid(){
		return this.guid;
	}
	/** 设置  事项名称 值 */
	public void setMatterName(String matterName){
		this.matterName = matterName;
	}
	/** 获取 事项名称 值 */
	public String getMatterName(){
		return this.matterName;
	}
	/** 设置  事项备注 值 */
	public void setRemark(String remark){
		this.remark = remark;
	}
	/** 获取 事项备注 值 */
	public String getRemark(){
		return this.remark;
	}
	/** 设置  是否删除 值 */
	public void setIsDeleted(Boolean isDeleted){
		this.isDeleted = isDeleted;
	}
	/** 获取 是否删除 值 */
	public Boolean getIsDeleted(){
		return this.isDeleted;
	}

}