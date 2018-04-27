package tk.ljyuan71.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.ljyuan71.permissions.enums.XmLeiBie;

/**
 * 枚举仓库
 * @author ljyuan 2018年4月17日
 * @Description: 通过init装载的枚举必须实现BaseEnum接口
 */
public class EnumRepository {
	//饿汉式--时间换空间（一开始就创建-时间快，创建static完毕就会一直存在-空间占用）
	private static EnumRepository enumRepository = new EnumRepository();
	
	private EnumRepository(){
		init();
	}
	public static EnumRepository getInstance(){
		return enumRepository;
	}
	//装载枚举类型
	private void init(){
		store(XmLeiBie.class);
	}
	
	private Map<String, Map<String, String>> repository = new HashMap<String, Map<String,String>>();
	
	private List<Class<?>> classes = new ArrayList<Class<?>>();
	private void store(Class<?> clazz){
		try {
			classes.add(clazz);
			BaseEnum<?>[] enums = ((BaseEnum<?>[]) clazz.getMethod("values").invoke(null, null));
			String fqn = clazz.getSimpleName();
			Map<String, String> map = repository.get(fqn);
			if (map == null) {
				map = new HashMap<String, String>();
			}
			for(BaseEnum<?> baseEnum : enums){
				map.put(baseEnum.name(), baseEnum.getCode().toString());
				map.put(baseEnum.getCode().toString(), baseEnum.getDescription());
			}
			repository.put(fqn, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static Map<String, Map<String, String>> getRepository(){
		return EnumRepository.getInstance().repository;
	}
	
	public static void put(String fqn, String key, String value){
		Map<String, String> map = getRepository().get(fqn);
		if (map == null) {
			map = new HashMap<String, String>();
			getRepository().put(fqn, map);
		}
		map.put(key, value);
	}
	
	public static String get(String fqn, String key){
		if(fqn == null || key == null){
			return null;
		}
		Map<String, String> map = getRepository().get(fqn);
		if (map == null) {
			return null;
		}
		return map.get(key);
	}
	
	public static Map<String, String> get(String fqn){
		if(fqn == null){
			return null;
		}
		Map<String, String> map = getRepository().get(fqn);
		return map;
	}
	
	public static Class<?> getClassByFqn(String fqn){
		for(Class<?> clazz : EnumRepository.getInstance().classes){
			if(clazz.getSimpleName().equals(fqn)){
				return clazz;
			}
		}
		return null;
	}
}
