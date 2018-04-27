package tk.ljyuan71.utils;

/**
 * 枚举顶层接口
 * @author ljyuan 2018年4月17日
 * @Description:  枚举顶层接口
 * @param <T>
 */
public interface BaseEnum<T> {
	/**
	 * 获取枚举key
	 * @author ljyuan 2018年4月17日
	 * @return
	 */
	public T getCode();
	
	public String name();
	/**
	 * 获取枚举value
	 * @author ljyuan 2018年4月17日
	 */
	public String getDescription() ;
}
