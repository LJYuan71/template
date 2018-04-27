package tk.ljyuan71.permissions.jsptag;

import java.io.Serializable;

import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * 元素基础事件
 * @author ljyuan 2018年4月17日
 * @Description:  
 */
public class BaseEvents extends BodyTagSupport implements Serializable{
	private static final long serialVersionUID = 1L;
	//值被改变事件
	private String onchange;
	//释放按键事件
	private String onkeyup;
	//鼠标点击事件
	private String onclick;
	//选中事件
	private String onselect;
	//失去焦点事件
	private String onblur;
	/** 获取: 值被改变事件 值  */
	public String getOnchange() {
		return onchange;
	}
	/** 设置: 值被改变事件 值 */
	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}
	/** 获取: 释放按键事件 值  */
	public String getOnkeyup() {
		return onkeyup;
	}
	/** 设置: 释放按键事件 值 */
	public void setOnkeyup(String onkeyup) {
		this.onkeyup = onkeyup;
	}
	/** 获取: 鼠标点击事件 值  */
	public String getOnclick() {
		return onclick;
	}
	/** 设置: 鼠标点击事件 值 */
	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}
	/** 获取: 选中事件 值  */
	public String getOnselect() {
		return onselect;
	}
	/** 设置: 选中事件 值 */
	public void setOnselect(String onselect) {
		this.onselect = onselect;
	}
	/** 获取: 失去焦点事件 值  */
	public String getOnblur() {
		return onblur;
	}
	/** 设置: 失去焦点事件 值 */
	public void setOnblur(String onblur) {
		this.onblur = onblur;
	}
	
}
