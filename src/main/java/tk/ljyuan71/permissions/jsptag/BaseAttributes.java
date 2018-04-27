package tk.ljyuan71.permissions.jsptag;

import java.io.Serializable;

/**
 * 元素基础属性
 * @author ljyuan 2018年4月17日
 * @Description:  
 */
public class BaseAttributes extends BaseEvents implements Serializable{
	private static final long serialVersionUID = 1L;
	//id属性
	private String id;
	//style属性
	private String style;
	//title属性
	private String title;
	//class属性
	private String tagClass;
	/** 获取: id属性 值  */
	public String getId() {
		return id;
	}
	/** 设置: id属性 值 */
	public void setId(String id) {
		this.id = id;
	}
	/** 获取: style属性 值  */
	public String getStyle() {
		return style;
	}
	/** 设置: style属性 值 */
	public void setStyle(String style) {
		this.style = style;
	}
	/** 获取: title属性 值  */
	public String getTitle() {
		return title;
	}
	/** 设置: title属性 值 */
	public void setTitle(String title) {
		this.title = title;
	}
	/** 获取: class属性 值  */
	public String getTagClass() {
		return tagClass;
	}
	/** 设置: class属性 值 */
	public void setTagClass(String tagClass) {
		this.tagClass = tagClass;
	}
	
}
