package tk.ljyuan71.permissions.sysdict.model;


import java.io.Serializable;

/**
 * 
 * 表sys_dict实体
 */
public class SysDict implements Serializable {
private static final long serialVersionUID = 1L;
	// 数据字典主键
	private String  dictGuid;
	// 字典类型
	private String  typename;
	// 字典键
	private String  dictKey;
	// 字典值
	private String  dictValue;
	// 值排序
	private Short sequence;
	// 状态
	private Short status;
	// 父字典主键
	private String  parentGuid;
	// 备注
	private String  remarks;

	/** 设置  数据字典主键 值 */
	public void setDictGuid(String dictGuid){
		this.dictGuid = dictGuid;
	}
	/** 获取 数据字典主键 值 */
	public String getDictGuid(){
		return this.dictGuid;
	}
	/** 设置  字典类型 值 */
	public void setTypename(String typename){
		this.typename = typename;
	}
	/** 获取 字典类型 值 */
	public String getTypename(){
		return this.typename;
	}
	/** 设置  字典键 值 */
	public void setDictKey(String dictKey){
		this.dictKey = dictKey;
	}
	/** 获取 字典键 值 */
	public String getDictKey(){
		return this.dictKey;
	}
	/** 设置  字典值 值 */
	public void setDictValue(String dictValue){
		this.dictValue = dictValue;
	}
	/** 获取 字典值 值 */
	public String getDictValue(){
		return this.dictValue;
	}
	/** 设置  值排序 值 */
	public void setSequence(Short sequence){
		this.sequence = sequence;
	}
	/** 获取 值排序 值 */
	public Short getSequence(){
		return this.sequence;
	}
	/** 设置  状态 值 */
	public void setStatus(Short status){
		this.status = status;
	}
	/** 获取 状态 值 */
	public Short getStatus(){
		return this.status;
	}
	/** 设置  父字典主键 值 */
	public void setParentGuid(String parentGuid){
		this.parentGuid = parentGuid;
	}
	/** 获取 父字典主键 值 */
	public String getParentGuid(){
		return this.parentGuid;
	}
	/** 设置  备注 值 */
	public void setRemarks(String remarks){
		this.remarks = remarks;
	}
	/** 获取 备注 值 */
	public String getRemarks(){
		return this.remarks;
	}

}