package tk.ljyuan71.permissions.templatentityvar.model;

import java.io.Serializable;

import tk.ljyuan71.permissions.templateentity.model.TemplateEntity;
import tk.ljyuan71.permissions.templatematter.model.TemplateMatter;

/**
 * 
 * 表TEMPLAT_ENTITY_VAR实体
 */
public class TemplatEntityVar implements Serializable,Cloneable {
private static final long serialVersionUID = 1L;
	// 主键id
	private String  guid;
	// 事项id
	private String  matterId;
	// 变量实体id
	private String  entityId;
	// 实体的属性名称
	private String  attrName;
	// 实体的属性备注
	private String  attrComment;
	// 属性默认值
	private String  defaultVar;
	// 属性类型
	private String  type;
	// 属性类型样式
	private String  typeStyle;
	// 是否删除
	private Boolean isDeleted;
	//对应的模板实体表
	private TemplateEntity templateEntity;
	//对应的模板事项表
	private TemplateMatter matter;
	/** 设置  主键id 值 */
	public void setGuid(String guid){
		this.guid = guid;
	}
	/** 获取 主键id 值 */
	public String getGuid(){
		return this.guid;
	}
	/** 设置  事项id 值 */
	public void setMatterId(String matterId){
		this.matterId = matterId;
	}
	/** 获取 事项id 值 */
	public String getMatterId(){
		return this.matterId;
	}
	/** 设置  变量实体id 值 */
	public void setEntityId(String entityId){
		this.entityId = entityId;
	}
	/** 获取 变量实体id 值 */
	public String getEntityId(){
		return this.entityId;
	}
	/** 设置  实体的属性名称 值 */
	public void setAttrName(String attrName){
		this.attrName = attrName;
	}
	/** 获取 实体的属性名称 值 */
	public String getAttrName(){
		return this.attrName;
	}
	/** 设置  实体的属性备注 值 */
	public void setAttrComment(String attrComment){
		this.attrComment = attrComment;
	}
	/** 获取 实体的属性备注 值 */
	public String getAttrComment(){
		return this.attrComment;
	}
	/** 设置  属性默认值 值 */
	public void setDefaultVar(String defaultVar){
		this.defaultVar = defaultVar;
	}
	/** 获取 属性默认值 值 */
	public String getDefaultVar(){
		return this.defaultVar;
	}
	/** 设置  属性类型 值 */
	public void setType(String type){
		this.type = type;
	}
	/** 获取 属性类型 值 */
	public String getType(){
		return this.type;
	}
	/** 设置  属性类型样式 值 */
	public void setTypeStyle(String typeStyle){
		this.typeStyle = typeStyle;
	}
	/** 获取 属性类型样式 值 */
	public String getTypeStyle(){
		return this.typeStyle;
	}
	/** 设置  是否删除 值 */
	public void setIsDeleted(Boolean isDeleted){
		this.isDeleted = isDeleted;
	}
	/** 获取 是否删除 值 */
	public Boolean getIsDeleted(){
		return this.isDeleted;
	}
	/** 获取: 对应的模板实体表 值  */
	public TemplateEntity getTemplateEntity() {
		return templateEntity;
	}
	/** 设置: 对应的模板实体表 值 */
	public void setTemplateEntity(TemplateEntity templateEntity) {
		this.templateEntity = templateEntity;
	}
	/** 获取: 对应的模板事项表 值  */
	public TemplateMatter getMatter() {
		return matter;
	}
	/** 设置: 对应的模板事项表 值 */
	public void setMatter(TemplateMatter matter) {
		this.matter = matter;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#clone()
	 */
	@Override
	public TemplatEntityVar clone() {
		TemplatEntityVar var = null;
		try {
			var = (TemplatEntityVar) super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return var;
	}

}