package tk.ljyuan71.permissions.zbgcuser.model;

import java.io.Serializable;

/**
 * 
 * 表ZB_GC_USER实体
 */
public class ZBGcUser implements Serializable {
private static final long serialVersionUID = 1L;
	// 工程-用户关系id
	private String  gcUserGuid;
	// 工程id
	private String  gcGuid;
	// 用户id
	private String  userGuid;
	// 创建时间
	private String  createTime;
	// 创建人
	private String  creatorGuid;
	// 是否删除
	private Boolean isDeleted;

	/** 设置  工程-用户关系id 值 */
	public void setGcUserGuid(String gcUserGuid){
		this.gcUserGuid = gcUserGuid;
	}
	/** 获取 工程-用户关系id 值 */
	public String getGcUserGuid(){
		return this.gcUserGuid;
	}
	/** 设置  工程id 值 */
	public void setGcGuid(String gcGuid){
		this.gcGuid = gcGuid;
	}
	/** 获取 工程id 值 */
	public String getGcGuid(){
		return this.gcGuid;
	}
	/** 设置  用户id 值 */
	public void setUserGuid(String userGuid){
		this.userGuid = userGuid;
	}
	/** 获取 用户id 值 */
	public String getUserGuid(){
		return this.userGuid;
	}
	/** 设置  创建时间 值 */
	public void setCreateTime(String createTime){
		this.createTime = createTime;
	}
	/** 获取 创建时间 值 */
	public String getCreateTime(){
		return this.createTime;
	}
	/** 设置  创建人 值 */
	public void setCreatorGuid(String creatorGuid){
		this.creatorGuid = creatorGuid;
	}
	/** 获取 创建人 值 */
	public String getCreatorGuid(){
		return this.creatorGuid;
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