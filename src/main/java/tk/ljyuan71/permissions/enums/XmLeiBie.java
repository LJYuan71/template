package tk.ljyuan71.permissions.enums;

import tk.ljyuan71.utils.BaseEnum;

/**
 * 项目类别枚举
 * @author ljyuan 2018年4月17日
 * @Description: 项目类别枚举类
 */
public enum XmLeiBie implements BaseEnum<Short>{
	SHIGONG((short)1, "施工"),
	JIANLI((short)2, "监理"),
	SHEJI((short)3, "设计"),
	EPC((short)4, "EPC");
	
	private short code;
	private String description;
	
	private XmLeiBie(short _code, String description) {
		this.code = _code;
		this.description = description;
	}
	
	//通过key获取对象
	public static XmLeiBie getXmLeiBieEnum(short code) {
		for(XmLeiBie xmLeiBie : XmLeiBie.values()) {
			if(code == xmLeiBie.getCode()) {
				return xmLeiBie;
			}
		}
		return null;
	}
	//通过key获取value
	public static String getName(short code) {
		for(XmLeiBie xmLeiBie : XmLeiBie.values()) {
			if(code == xmLeiBie.getCode()) {
				return xmLeiBie.name();
			}
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see tk.ljyuan71.utils.BaseEnum#getCode()
	 */
	@Override
	public Short getCode() {
		return this.code;
	}

	/* (non-Javadoc)
	 * @see tk.ljyuan71.utils.BaseEnum#getDescription()
	 */
	@Override
	public String getDescription() {
		return this.description;
	}
	
}
