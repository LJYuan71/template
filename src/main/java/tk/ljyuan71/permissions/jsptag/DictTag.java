package tk.ljyuan71.permissions.jsptag;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;

import org.apache.commons.lang3.StringUtils;

import tk.ljyuan71.permissions.sysdict.model.SysDict;
import tk.ljyuan71.permissions.sysdict.service.SysDictService;
import tk.ljyuan71.utils.AppUtil;
import tk.ljyuan71.utils.BaseEnum;
import tk.ljyuan71.utils.EnumRepository;

/**
 * 自定义select标签
 * @author ljyuan 2018年4月17日
 * @Description:  
 * TagSupport与BodyTagSupport的区别: 
 * 主要看标签处理类是否要读取标签体的内容和改变标签体返回的内容，如果不需要就用TagSupport，否则就用BodyTagSupport 
 * 用TagSupport实现的标签，都可以用BodyTagSupport来实现，因为BodyTagSupport继承了TagSupport 
 */  
public class DictTag extends BaseAttributes{

	private static final long serialVersionUID = 1467797128014436396L;
	
	private static SysDictService sysDictService;
	 /** 
		doStartTag()方法是遇到标签开始时会呼叫的方法，其合法的返回值是EVAL_BODY_INCLUDE与SKIP_BODY,前者表示将显示标签间的文字，后者表示不显示标签间的文字 
		doEndTag()方法是在遇到标签结束时呼叫的方法，其合法的返回值是EVAL_PAGE与SKIP_PAGE，前者表示处理完标签后继续执行以下的JSP网页，后者是表示不处理接下来的JSP网页 
		doAfterBody(),这个方法是在显示完标签间文字之后呼叫的，其返回值有EVAL_BODY_AGAIN与SKIP_BODY，前者会再显示一次标签间的文字，后者则继续执行标签处理的下一步 
		EVAL_BODY_INCLUDE：把Body读入存在的输出流中，doStartTag()函数可用 
		EVAL_PAGE：继续处理页面，doEndTag()函数可用 
		SKIP_BODY：忽略对Body的处理，doStartTag()和doAfterBody()函数可用 
		SKIP_PAGE：忽略对余下页面的处理，doEndTag()函数可用 
		EVAL_BODY_BUFFERED：申请缓冲区，由setBodyContent()函数得到的BodyContent对象来处理tag的body，如果类实现了BodyTag，那么doStartTag()可用，否则非法 
		EVAL_BODY_AGAIN：请求继续处理body，返回自doAfterBody()，这个返回值在你制作循环tag的时候是很有用的   
		预定的处理顺序是：doStartTag()返回SKIP_BODY,doAfterBodyTag()返回SKIP_BODY,doEndTag()返回EVAL_PAGE 
		如果继承了TagSupport之后，如果没有改写任何的方法，标签处理的执行顺序是：doStartTag() ->不显示文字 ->doEndTag()->执行接下来的网页  
		如果您改写了doStartTag(),则必须指定返回值, 
		如果指定了EVAL_BODY_INCLUDE,则执行顺序是：doStartTag()->显示文字->doAfterBodyTag()->doEndTag()->执行下面的网页 
	  */ 
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.BodyTagSupport#doEndTag()
	 */
	@Override
	public int doEndTag() throws JspException {
		try {  
			Long start = System.currentTimeMillis();
			DictType dictType = DictType.getDictTypeByName(this.dictType);
			StringBuffer results = new StringBuffer(); 
			getDictData();
			switch(dictType){
				case select:{
					results.append("<select");
					createSelect(results);
					results.append("</select>");
				} break;
				case radio:{
					createCheckboxOrRadio(results,"radio");
				} break;
				case checkbox:{
					createCheckboxOrRadio(results,"checkbox");
				} break;
				case span:{
					results.append("<span ");
					createSpan(results);
					results.append("</span>");
				} break;
			}
            
            //System.out.println("花费时间："+(System.currentTimeMillis()-start));
            //System.out.println(results.toString());
            pageContext.getOut().write(results.toString());  
        } catch (IOException ex) {  
            throw new JspTagException("自定义标签错误");  
        }  
        return EVAL_BODY_INCLUDE;  
	}
	
	/**
	 * Select
	 */
	private void createSelect(StringBuffer results){
		//属性设置
        setAttributes(results);
		if(StringUtils.isNotBlank(this.getName())){ 
        	results.append(" name=\"" + this.getName() + "\"");
        }  
        if(StringUtils.isNotBlank(getId())){  
        	results.append(" id=\"" + getId() + "\"");
        } 
        if(StringUtils.isNotBlank(this.getDisabled())){  
        	results.append(" disabled ");
        }
        if(StringUtils.isNotBlank(getMultiple())){  
        	results.append(" multiple=\"" + getMultiple() + "\"");
        }
        if(StringUtils.isNotBlank(getRequired())){  
        	results.append(" required=\"" + getRequired() + "\"");
        }
        if(StringUtils.isNotBlank(getSize())){  
        	results.append(" size=\"" + getSize() + "\"");
        }
        //事件设置
        setEvents(results);
        results.append(">");
        //option选项控制
        if(!"false".equals(this.getHeader())){
        	if(StringUtils.isNotBlank(this.getHeader())){
        		results.append("<option value=\"\">--"+this.getHeader()+"--</option>");
        	} else {
        		results.append("<option value=\"\">--请选择--</option>");
        	}
        }
        
        for (SysDict sysDict : sysDicts) {
        	if (sysDict.getDictValue().equals(this.getSelected()) || sysDict.getDictKey().equals(this.getSelected())){
        		results.append("<option value=\""+sysDict.getDictKey()+"\" selected>");
            }else {
            	results.append("<option value=\""+sysDict.getDictKey()+"\">");
            }
        	results.append(sysDict.getDictValue()+"</option>");
		}
	}
	
	/**
	 * CheckboxOrRadio
	 */
	private void createCheckboxOrRadio(StringBuffer results,String inputType) {
        for (SysDict sysDict : sysDicts) {
        	results.append("<label class=\""+inputType+"-inline\"> <input type=\""+inputType+"\" value=\""+sysDict.getDictKey()+"\"");
        	if (this.getChecked() != null && (this.getChecked().indexOf(sysDict.getDictValue()) != -1 
        			|| this.getChecked().indexOf(sysDict.getDictKey()) != -1)){
        		results.append(" checked ");
            }
        	setAttributes(results);
        	if(StringUtils.isNotBlank(this.getName())){ 
            	results.append(" name=\"" + this.getName() + "\"");
            }  
            if(StringUtils.isNotBlank(getId())){  
            	results.append(" id=\"" + getId() + "_" + sysDict.getDictKey() + "\"");
            }
            if(StringUtils.isNotBlank(this.getDisabled())){  
            	results.append(" disabled ");
            }
        	setEvents(results);
        	results.append("/>");
        	results.append(sysDict.getDictValue()+"</label>");
        }
	}
	/**
	 * Span
	 */
	private void createSpan(StringBuffer results) {
		setAttributes(results);
		results.append(" >");
		String[] values = new String[sysDicts.size()];
		for (int i = 0; i < sysDicts.size(); i++) {
			values[i] = sysDicts.get(i).getDictValue();
		}
		results.append(StringUtils.join(values, ",").toString());
	}
	//name属性
	private String name;
	//选择框类型名称(已经控制不能为空)
	private String typename;
	//选择头 默认--请选择--
	private String header;
	//默认选中项
	private String selected;
	//禁用下拉
	private String disabled;
	//可选择多个
	private String multiple;
	//是否必填
	private String required;
	//可见选项数目
	private String size;
	//数据展示类型(默认select)
	private String dictType;
	//默认选中项
	private String checked;
	//字典
	List<SysDict> sysDicts = new ArrayList<SysDict>();
	
	protected enum DictType{
		/**下拉框 */
		select, 
		/** 单选框 */
		radio, 
		/** 复选框 */
		checkbox,
		/** 文本显示 */
		span;
		public static DictType getDictTypeByName(String name){
			if(StringUtils.isBlank(name)){
				return select;
			}
			for(DictType dictType : values()){
				if(dictType.name().equals(name)){
					return dictType;
				}
			}
			return select;
		}
	}
	/**
	 * 获取字典数据
	 */
	public void getDictData(){
		sysDicts.clear();
		if(EnumRepository.get(typename) != null){//先从枚举类中获取
			Class<?> clazz = EnumRepository.getClassByFqn(typename);
			try {
				BaseEnum<?>[] enums = ((BaseEnum<?>[]) clazz.getMethod("values").invoke(null, null));
				for(BaseEnum baseEnum : enums){
					SysDict sysDict = new SysDict();
					sysDict.setDictKey(baseEnum.getCode().toString());
					sysDict.setDictValue(baseEnum.getDescription());
					sysDicts.add(sysDict);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		} else {//枚举类中没有时，通过数据库查询
			Map<String, Object> filter = new HashMap<String, Object>();
			filter.put("typenameEquals", this.typename);
			if("span".equals(this.dictType)){
				filter.put("checked", this.checked);
			}
			if(sysDictService == null){
				initService();
			}
			sysDicts = sysDictService.queryAllSimple(filter);
		}
	}
	/**
	 * 初始化服务
	 */
	private static void initService() {
		sysDictService = (SysDictService) AppUtil.getBean("sysDictService");
	}

	/**
	 * 设置常用事件
	 */
	public void setEvents(StringBuffer results){
        if (StringUtils.isNotBlank(getOnchange())){
        	results.append(" onchange=\"" + getOnchange() + "\"");
        }
        if(StringUtils.isNotBlank(getOnblur())){
        	results.append(" onblur=\"" + getOnblur() + "\"");
        }
        if(StringUtils.isNotBlank(getOnkeyup())){
        	results.append(" onkeyup=\"" + getOnkeyup() + "\"");
        }
        if(StringUtils.isNotBlank(getOnclick())){
        	results.append(" onclick=\"" + getOnclick() + "\"");
        }
        if(StringUtils.isNotBlank(getOnselect())){
        	results.append(" onselect=\"" + getOnselect() + "\"");
        }
	}
	/**
	 * 设置通用样式
	 */
	public void setAttributes(StringBuffer results){
        if(StringUtils.isNotBlank(getStyle())){  
        	results.append(" style=\"" + getStyle() + "\"");
        }
        if(StringUtils.isNotBlank(getTitle())){  
        	results.append(" title=\"" + getTitle() + "\"");
        }
        if(StringUtils.isNotBlank(getTagClass())){  
        	results.append(" class=\"" + getTagClass() + "\"");
        }
	}
	
	static{
		initService();
	}
	/** 获取: name属性 值  */
	public String getName() {
		return name;
	}
	/** 获取: name属性 值  */
	public void setName(String name) {
		this.name = name;
	}

	/** 获取: 选择框类型名称 值  */
	public String getTypename() {
		return typename;
	}

	/** 设置: 选择框类型名称 值 */
	public void setTypename(String typename) {
		this.typename = typename;
	}

	/** 获取: 选择头 默认--请选择-- 值  */
	public String getHeader() {
		return header;
	}

	/** 设置: 选择头 默认--请选择-- 值 */
	public void setHeader(String header) {
		this.header = header;
	}

	/** 获取: 默认选中项 值  */
	public String getSelected() {
		return selected;
	}

	/** 设置: 默认选中项 值 */
	public void setSelected(String selected) {
		this.selected = selected;
	}

	/** 获取: 禁用下拉 值  */
	public String getDisabled() {
		return disabled;
	}

	/** 设置: 禁用下拉 值 */
	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

	/** 获取: 可选择多个 值  */
	public String getMultiple() {
		return multiple;
	}

	/** 设置: 可选择多个 值 */
	public void setMultiple(String multiple) {
		this.multiple = multiple;
	}

	/** 获取: 是否必填 值  */
	public String getRequired() {
		return required;
	}

	/** 设置: 是否必填 值 */
	public void setRequired(String required) {
		this.required = required;
	}

	/** 获取: 可见选项数目 值  */
	public String getSize() {
		return size;
	}

	/** 设置: 可见选项数目 值 */
	public void setSize(String size) {
		this.size = size;
	}
	/** 获取: 数据展示类型(默认select) 值  */
	public String getDictType() {
		return dictType;
	}
	/** 设置: 数据展示类型(默认select) 值 */
	public void setDictType(String dictType) {
		this.dictType = dictType;
	}

	/** 获取: 默认选中项 值  */
	public String getChecked() {
		return checked;
	}

	/** 设置: 默认选中项 值 */
	public void setChecked(String checked) {
		this.checked = checked;
	}
	
}
