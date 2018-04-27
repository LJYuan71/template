package tk.ljyuan71.permissions.templateentity.model;

import java.io.Serializable;

/**
 * 
 * 表TEMPLATE_ENTITY实体
 */
public class TemplateEntity implements Serializable {
private static final long serialVersionUID = 1L;
	// 变量实体id
	private String  guid;
	// 变量实体完整路径
	private String  entityFullPath;
	// 变量实体注释
	private String  entityComment;
	// 是否删除
	private Boolean isDeleted;

	/** 设置  变量实体id 值 */
	public void setGuid(String guid){
		this.guid = guid;
	}
	/** 获取 变量实体id 值 */
	public String getGuid(){
		return this.guid;
	}
	/** 设置  变量实体完整路径 值 */
	public void setEntityFullPath(String entityFullPath){
		this.entityFullPath = entityFullPath;
	}
	/** 获取 变量实体完整路径 值 */
	public String getEntityFullPath(){
		return this.entityFullPath;
	}
	/** 设置  变量实体注释 值 */
	public void setEntityComment(String entityComment){
		this.entityComment = entityComment;
	}
	/** 获取 变量实体注释 值 */
	public String getEntityComment(){
		return this.entityComment;
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