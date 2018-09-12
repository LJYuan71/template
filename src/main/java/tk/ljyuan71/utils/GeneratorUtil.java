package tk.ljyuan71.utils;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import tk.ljyuan71.gencode.db.exception.CodegenException;
import tk.ljyuan71.gencode.db.helper.IDbHelper;
import tk.ljyuan71.gencode.db.model.Database;
import tk.ljyuan71.gencode.db.model.TableModel;


/**
 * @author ljyuan 2018年9月11日
 * @Description:  
 */
public class GeneratorUtil {
	/**
	 * 代码生成数据库连接dbHelperClass
	 */
	private static String dbHelperClass = "";
	/**
	 * 代码生成数据库连接url
	 */
	private static String url = "";
	/**
	 * 代码生成数据库连接username
	 * 
	 */
	private static String username = "";
	/**
	 * 代码生成数据库连接password
	 */
	private static String password = "";
	/**
	 * 项目路径 F\:\\workspacesJdk7\\casec_base\\
	 */
	private static String baseDir = "";
	/**
	 * java文件基础路径，这个不改 src\\com\\
	 */
	private static String javaFilesPath = "";
	/**
	 * 系统名称 platform代表基础平台项目 每个系统设置一个system platform\\
	 */
	private static String system = "";
	/**
	 * 模块名称 permissions代表系统权限管理模块 permissions\\
	 */
	private static String modular = "";
	/**
	 * jsp文件基础路径，这个不改 web\\WEB-INF\\view\\
	 */
	private static String jspFilesPath = "";
	
	/**
	 * 系统域名后缀(com/net/tk/cn)
	 */
	private static String domainsuf = "";
	/**
	 * 代码生成
	 * @author ljyuan 2018年9月11日
	 * @param tablename 表名,如：jy_user表
	 * @param modelname 模块名,如：JyUser(默认)
	 * @param packagename 包名 ,如：jyuser(默认)
	 * @param createType 创建类型："hibernate"或"mybatis"
	 * @param path 自定义文件生成路径
	 * @param isCustomTemplate 是否使用自定义模板
	 * @return 生成的文件路径
	 */
	public static String generator(String tablename,String modelname,String packagename,String createType,String path,Boolean isCustomTemplate) throws Exception{
		if (StringUtils.isBlank(dbHelperClass)) {
			init();
		}
		// 获取需要生成所有文件的路径
		String javaPath = null;
		String webPath = null;
		if(StringUtils.isBlank(path) || "undefined".equals(path)){
			path = null;
			javaPath = baseDir + javaFilesPath + system + "\\"
					+ modular + "\\" + packagename ;
			webPath = baseDir + jspFilesPath + "\\" + modular
					+ "\\" + packagename + "\\";
		}
		
		String controllerPath = null;
		String daoPath = null;
		String modelPath = null;
		String xmlPath = null;
		String servicePath = null;
		String daoImplPath = null;
		String serviceImplPath = null;
		String webSuf = ".html";
		String webEditPath = null;
		String webGetPath = null;
		String webListPath = null;
		if(StringUtils.isBlank(modelname)) modelname = UnderlineToHump(tablename);
		//packagename设置默认值
		if(StringUtils.isBlank(packagename)) packagename = tablename.toLowerCase().replaceAll("_", "");
		if (StringUtils.isBlank(javaPath)) {
			controllerPath = path + "\\" + modelname + "Controller.java";
			daoPath = path + "\\" + modelname + "Dao.java";
			modelPath = path + "\\" + modelname + ".java";
			daoImplPath = path + "\\" + modelname + "DaoImpl.java";
			servicePath = path + "\\" + modelname + "Service.java";
			serviceImplPath = path + "\\" + modelname + "ServiceImpl.java";
			xmlPath = path + "\\" + modelname + "Mapper.xml";
			webEditPath = path + "\\" + packagename + "Edit";
			webListPath = path + "\\" + packagename + "List";
			webGetPath = path + "\\" + packagename + "View";
		} else {
			controllerPath = javaPath + "\\controller\\" + modelname + "Controller.java";
			daoPath = javaPath + "\\dao\\" + modelname + "Dao.java";
			daoImplPath = javaPath + "\\dao\\impl\\" + modelname + "DaoImpl.java";
			serviceImplPath = javaPath + "\\service\\impl\\" + modelname + "ServiceImpl.java";
			modelPath = javaPath + "\\model\\" + modelname + ".java";
			xmlPath = javaPath + "\\model\\" + modelname + "Mapper.xml";
			servicePath = javaPath + "\\service\\" + modelname + "Service.java";
			webEditPath = webPath + packagename + "Edit";
			webListPath = webPath + packagename + "List";
			webGetPath = webPath + packagename + "View";
		}
		
		// 获取DbHelper
		IDbHelper iDbHelper = getDbHelper(new Database(dbHelperClass, url,
				username, password));
		TableModel tableModel = iDbHelper.getByTable(tablename);
		Map<String, Object> data = new HashMap<String, Object>(); // 创建数据模型
		data.put("model", tableModel);
		data.put("system", system);// 系统名称
		data.put("modular", modular);// 模块名称
		data.put("packagename", packagename);// 包名称
		data.put("modelname", modelname);// 实体名称
		data.put("tablename", tablename.toUpperCase());// 表名
		data.put("domainsuf", domainsuf);// 域名后缀
		data.put("path", path);
		if ("hibernate".equals(createType)) {
			Freemarker.printFile("daoImpl.ftl", data, daoImplPath, createType,isCustomTemplate);
		} else if ("mybatis".equals(createType)){
			webSuf = ".jsp";
			Freemarker.printFile("xml.ftl", data, xmlPath, createType,isCustomTemplate);
		}
		// 生成相应后台代码
		Freemarker.printFile("controller.ftl", data, controllerPath, createType,isCustomTemplate);
		Freemarker.printFile("dao.ftl", data, daoPath, createType,isCustomTemplate);
		Freemarker.printFile("model.ftl", data, modelPath, createType,isCustomTemplate);
		Freemarker.printFile("service.ftl", data, servicePath, createType,isCustomTemplate);
		Freemarker.printFile("serviceImpl.ftl", data, serviceImplPath, createType,isCustomTemplate);
		// 生成相应前端代码
		Freemarker.printFile("edit.ftl", data, webEditPath+webSuf, createType,isCustomTemplate);
		Freemarker.printFile("list.ftl", data, webListPath+webSuf, createType,isCustomTemplate);
		Freemarker.printFile("view.ftl", data, webGetPath+webSuf, createType,isCustomTemplate);
		return controllerPath;
	}
	/**
	 * 初始化变量
	 */
	private static void init() {
		//获取配置属性
		dbHelperClass = SysConfig.getSystemConfig("dbHelperClass");
		url = SysConfig.getSystemConfig("url");
		username = SysConfig.getSystemConfig("username");
		password = SysConfig.getSystemConfig("password");
		baseDir = SysConfig.getSystemConfig("baseDir");
		javaFilesPath = SysConfig.getSystemConfig("javaFilesPath");
		system = SysConfig.getSystemConfig("system");
		modular = SysConfig.getSystemConfig("modular");
		jspFilesPath = SysConfig.getSystemConfig("jspFilesPath");
		domainsuf = SysConfig.getSystemConfig("domainsuf");
	}
	
	/**
	 * 获取DbHelper。
	 * 
	 * @param configModel
	 * @return
	 * @throws CodegenException
	 */
	private static IDbHelper getDbHelper(Database database) throws CodegenException {
		IDbHelper dbHelper = null;
		String dbHelperClass = database.getDbHelperClass();

		try {
			dbHelper = (IDbHelper) Class.forName(dbHelperClass).newInstance();
		} catch (InstantiationException e) {
			throw new CodegenException("指定的dbHelperClass：" + dbHelperClass
					+ "无法实例化，可能该类是一个抽象类、接口、数组类、基本类型或 void, 或者该类没有默认构造方法!", e);
		} catch (IllegalAccessException e) {
			throw new CodegenException("指定的dbHelperClass： " + dbHelperClass
					+ "没有默认构造方法或不可访问!", e);
		} catch (ClassNotFoundException e) {
			throw new CodegenException("找不到指定的dbHelperClass:" + dbHelperClass
					+ "!", e);
		}
		dbHelper.setUrl(database.getUrl(), database.getUsername(),
				database.getPassword());
		return dbHelper;
	}
	
	/***
	 * 下划线命名转为驼峰命名首字母大写
	 * 例：ZB_GONGCHENG --> ZbGongcheng
	 */
	public static String UnderlineToHump(String para){
	    StringBuilder result=new StringBuilder();
	    String a[]=para.split("_");
	    for(String s:a){
	        result.append(s.substring(0, 1).toUpperCase());
	        result.append(s.substring(1).toLowerCase());
	    }
	    return result.toString();
	}
	
	public static void main(String[] args) throws Exception {
		//添加main方法启动
		String path = GeneratorUtil.generator("zb_gc", null, null, "hibernate", "D:\\test", false);
		System.out.println("代码生成成功，路径："+path);
	}
	
}
