package tk.ljyuan71.permissions.templateinfo.model;

import java.io.Serializable;

import tk.ljyuan71.permissions.templatematter.model.TemplateMatter;

/**
 * 模板信息
 * 表TEMPLATE_INFO实体
 */
public class TemplateInfo implements Serializable {
private static final long serialVersionUID = 1L;
	// 模板信息id
	private String  guid;
	// 模板名称
	private String  templateName;
	// 模板事项
	private String  matterId;
	// 模板内容
	private String  templateContent;
	// 是否删除
	private Boolean isDeleted;
	//模板事项
	private TemplateMatter matter;

	/** 设置  模板信息id 值 */
	public void setGuid(String guid){
		this.guid = guid;
	}
	/** 获取 模板信息id 值 */
	public String getGuid(){
		return this.guid;
	}
	/** 设置  模板名称 值 */
	public void setTemplateName(String templateName){
		this.templateName = templateName;
	}
	/** 获取 模板名称 值 */
	public String getTemplateName(){
		return this.templateName;
	}
	/** 设置  模板事项 值 */
	public void setMatterId(String matterId){
		this.matterId = matterId;
	}
	/** 获取 模板事项 值 */
	public String getMatterId(){
		return this.matterId;
	}
	/** 设置  模板内容 值 */
	public void setTemplateContent(String templateContent){
		this.templateContent = templateContent;
	}
	/** 获取 模板内容 值 */
	public String getTemplateContent(){
		return this.templateContent;
	}
	/** 设置  是否删除 值 */
	public void setIsDeleted(Boolean isDeleted){
		this.isDeleted = isDeleted;
	}
	/** 获取 是否删除 值 */
	public Boolean getIsDeleted(){
		return this.isDeleted;
	}
	/** 获取: 模板事项 值  */
	public TemplateMatter getMatter() {
		return matter;
	}
	/** 设置: 模板事项 值 */
	public void setMatter(TemplateMatter matter) {
		this.matter = matter;
	}

}