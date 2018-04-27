package tk.ljyuan71.gencode.controller;

import java.io.File;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.ljyuan71.gencode.db.exception.CodegenException;
import tk.ljyuan71.gencode.db.helper.IDbHelper;
import tk.ljyuan71.gencode.db.model.Database;
import tk.ljyuan71.gencode.db.model.TableModel;
import tk.ljyuan71.utils.AppUtil;
import tk.ljyuan71.utils.Freemarker;
import tk.ljyuan71.utils.SysConfig;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * 代码自动生成Controller
 * @version
 */
@Controller
@RequestMapping(value = "/core/gencode")
public class GencodeController {

	private static JdbcTemplate jdbcTemplate;
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
	
	private static String testTable = "";
	/**
	 * 系统域名后缀(com/net/tk/cn)
	 */
	private static String domainsuf = "";

	private static void init() {
		jdbcTemplate = (JdbcTemplate) AppUtil.getBean("jdbcTemplate");
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
		testTable = SysConfig.getSystemConfig("testTable");
	}

	/**
	 * 获取模板文件
	 */
	@RequestMapping("/getcustomtemplate")
	@ResponseBody
	public Map<String, Object> getcustomtemplate(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (jdbcTemplate == null) {
			init();
		}
		Map<String, Object> retMap = new HashMap<String, Object>();
		String codetype = request.getParameter("codetype");//代码类型
		String templatetype = request.getParameter("templatetype");//模板类型
		String ftlpath = "";
		if ("1".equals(codetype)) {
			ftlpath = request.getSession().getServletContext().getRealPath("/template/custom/hibernate/"+templatetype+".ftl");
		} else {
			ftlpath = request.getSession().getServletContext().getRealPath("/template/custom/mybatis/"+templatetype+".ftl");
		}
		File file = new File(ftlpath);
		if (!file.exists() || !file.isFile()) {
			retMap.put("code", 500);
			return retMap;
		}
		String ftlStr = FileUtils.readFileToString(file,"UTF-8");
		retMap.put("ftlStr", ftlStr);
		retMap.put("code", 200);
		return retMap;
	}
	
	/**
	 * 重置模板
	 */
	@RequestMapping("/resettemplate")
	@ResponseBody
	public Map<String, Object> resettemplate(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (jdbcTemplate == null) {
			init();
		}
		Map<String, Object> retMap = new HashMap<String, Object>();
		String codetype = request.getParameter("codetype");//代码类型
		String templatetype = request.getParameter("templatetype");//模板类型
		String ftlpath = "";
		String toPath = "";
		if ("1".equals(codetype)) {
			ftlpath = request.getSession().getServletContext().getRealPath("/template/hibernate/"+templatetype+".ftl");
			toPath = request.getSession().getServletContext().getRealPath("/template/custom/hibernate/");
		} else {
			ftlpath = request.getSession().getServletContext().getRealPath("/template/mybatis/"+templatetype+".ftl");
			toPath = request.getSession().getServletContext().getRealPath("/template/custom/mybatis/");
		}
		File file = new File(ftlpath);
		if (!file.exists() || !file.isFile()) {
			retMap.put("code", 500);
			return retMap;
		}
		FileUtils.copyFileToDirectory(new File(ftlpath), new File(toPath));
		String ftlStr = FileUtils.readFileToString(file,"UTF-8");
		retMap.put("ftlStr", ftlStr);
		retMap.put("code", 200);
		return retMap;
	}
	/**
	 * 获取所有数据库
	 */
	@RequestMapping("/getAllTable")
	@ResponseBody
	public Map<String, Object> getAllTable(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (jdbcTemplate == null) {
			init();
		}
		Map<String, Object> retMap = new HashMap<String, Object>();
		IDbHelper iDbHelper = getDbHelper(new Database(dbHelperClass, url,
				username, password));
		List<TableModel> list = iDbHelper.getAllTable();
		retMap.put("tables", list);
		retMap.put("code", 200);
		return retMap;
	}
	
	/**
	 * 保存模板文件
	 */
	@RequestMapping("/savecustomtemplate")
	@ResponseBody
	public Map<String, Object> savecustomtemplate(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (jdbcTemplate == null) {
			init();
		}
		Map<String, Object> retMap = new HashMap<String, Object>();
		String codetype = request.getParameter("codetype");//代码类型
		String templatetype = request.getParameter("templatetype");//模板类型
		String ftlStr = request.getParameter("ftlStr");//模板
		String ftlpath = "";
		if ("1".equals(codetype)) {
			ftlpath = request.getSession().getServletContext().getRealPath("/template/custom/hibernate/"+templatetype+".ftl");
		} else {
			ftlpath = request.getSession().getServletContext().getRealPath("/template/custom/mybatis/"+templatetype+".ftl");
		}
		File file = new File(ftlpath);
		if (!file.exists() || !file.isFile()) {
			retMap.put("code", 500);
			return retMap;
		}
		FileUtils.writeStringToFile(file, ftlStr, false);
		retMap.put("code", 200);
		return retMap;
	}
	
	/**
	 * 测试模板文件
	 */
	@RequestMapping("/testcustomtemplate")
	@ResponseBody
	public Map<String, Object> testcustomtemplate(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (jdbcTemplate == null) {
			init();
		}
		Map<String, Object> retMap = new HashMap<String, Object>();
		String ftlStr = request.getParameter("ftlStr");//模板
		String tablename = request.getParameter("tablename");//表名
		if (StringUtils.isBlank(tablename)) {
			tablename = testTable;
		}
		Template t;
		String retStr = "";
		try {
			String tempftl = request.getSession().getServletContext().getRealPath("/template/custom/temp/");
			File file = new File(tempftl,"temp.ftl");
			FileUtils.writeStringToFile(file, ftlStr, false);
			Configuration cfg = new Configuration();
			cfg.setEncoding(Locale.CHINA, "utf-8");
			//设定空值处理
			cfg.setClassicCompatible(true);
			StringWriter result = new StringWriter(); 
			cfg.setDirectoryForTemplateLoading(new File(tempftl));
			t = cfg.getTemplate("temp.ftl");
			//t = Freemarker.getTemplate("temp.ftl",tempftl,true);
			// 获取DbHelper
			IDbHelper iDbHelper = getDbHelper(new Database(dbHelperClass, url,
					username, password));
			TableModel tableModel = iDbHelper.getByTable(tablename);
			Map<String, Object> data = new HashMap<String, Object>(); // 创建数据模型
			String modelname = "";
			tablename = tablename.toLowerCase();
			for (String str : tablename.split("_")) {
				modelname += str.substring(0, 1).toUpperCase() + str.substring(1);
			}
			data.put("model", tableModel);
			data.put("modelname", modelname);// 实体名称
			data.put("system", system);// 系统名称
			data.put("modular", modular);// 模块名称
			data.put("tablename", tablename);// 表名
			data.put("domainsuf", domainsuf);// 域名后缀
			data.put("path", " ");
			t.process(data, result);
			retStr = result.toString();
			retMap.put("code", 200);
		}catch (TemplateException e){
			e.printStackTrace();
			retMap.put("code", 500);
			retStr = e.getMessage();
		}catch (Exception e) {
			e.printStackTrace();
			retStr = e.getMessage();
			retMap.put("code", 500);
		}
		retMap.put("retStr", retStr);
		return retMap;
	}

	/**
	 * 生成代码
	 */
	@RequestMapping(value = "/gencode")
	@ResponseBody
	public Map<String, Object> gencode(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (jdbcTemplate == null) {
			init();
		}
		String tablename = request.getParameter("tablename");//表名
		String modelname = request.getParameter("modelname");//模块名
		String packagename = request.getParameter("packagename");//包名
		String createType = request.getParameter("createType");//创建类型
		String path = request.getParameter("path");//自定义文件生成路径
		Boolean isCustomTemplate = new Boolean(request.getParameter("template")) ;//是否使用模板
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
			
		System.out.println("路径:"+controllerPath);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 200);
		return map;
	}

	/**
	 * 获取DbHelper。
	 * 
	 * @param configModel
	 * @return
	 * @throws CodegenException
	 */
	private IDbHelper getDbHelper(Database database) throws CodegenException {
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
	
	public static void main(String[] args) {
		
	}
	
}
