package tk.ljyuan71.utils;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.ModelAndView;


/**
 * 扩展HttpServletRequest的功能，所有请求参数获取都通过该类方法来获取。
 * @author LJY 2017-10-17
 */
public class RequestUtil {
	// 防止sql注入设置的字典
	/*@SuppressWarnings("unused")
	private static String[] bugs = new String[] { "insert", "update", "create",
			"union", "from", "order", "by", "where", "and", "or", "limit",
			"group", "*", "；", "=", "'", "\"" };*/
	private static ThreadLocal<HttpServletRequest> reqLocal = new ThreadLocal<HttpServletRequest>();

	private static ThreadLocal<HttpServletResponse> responseLocal = new ThreadLocal<HttpServletResponse>();

	public static void setHttpServletRequest(HttpServletRequest request) {
		reqLocal.set(request);
	}

	/**
	 * 清除request和response线程变量。
	 */
	public static void clearHttpReqResponse() {
		reqLocal.remove();
		responseLocal.remove();
	}

	/**
	 * 设置HttpServletResponse response。
	 * 
	 * @param response
	 */
	public static void setHttpServletResponse(HttpServletResponse response) {
		responseLocal.set(response);
	}

	/**
	 * 获取当前请求的Request，需要保证AopFilter在web.xml里配置才能取到
	 * 
	 * @return
	 */
	public static HttpServletRequest getHttpServletRequest() {
		return reqLocal.get();
	}

	/**
	 * 返回response。
	 * 
	 * @return
	 */
	public static HttpServletResponse getHttpServletResponse() {
		return responseLocal.get();
	}

	private RequestUtil() {
	}

	/**
	 * 取字符串类型的参数。 如果取得的值为null，则返回默认字符串。
	 * 
	 * @param request
	 * @param key
	 *            字段名成
	 * @param defaultValue
	 * @return
	 */
	public static String getString(HttpServletRequest request, String key,
			String defaultValue) {
		String value = request.getParameter(key);
		if (StringUtils.isBlank(value)) {
			return defaultValue;
		}
		return value.replace("'", "''").trim();
	}

	/**
	 * 取字符串类型的参数。 如果取得的值为null，则返回空字符串。
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getString(HttpServletRequest request, String key) {
		return getString(request, key, "");
	}

	/**
	 * 取得安全字符串。
	 * 
	 * @param request
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static String getSecureString(HttpServletRequest request,
			String key, String defaultValue) {
		String value = request.getParameter(key);
		if (StringUtils.isBlank(value)) {
			return defaultValue;
		}
		return filterInject(value);
	}

	/**
	 * 取得安全字符串，防止程序sql注入，脚本攻击。
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getSecureString(HttpServletRequest request, String key) {
		return getSecureString(request, key, "");
	}

	/**
	 * 过滤script|iframe|\\||;|exec|insert|select|delete|update|count|chr|truncate
	 * |char字符串 防止SQL注入
	 * 
	 * @param str
	 * @return
	 */
	public static String filterInject(String str) {
		String injectstr = "\\||;|exec|insert|select|delete|update|count|chr|truncate|char";
		Pattern regex = Pattern.compile(injectstr, Pattern.CANON_EQ
				| Pattern.DOTALL | Pattern.CASE_INSENSITIVE
				| Pattern.UNICODE_CASE);
		Matcher matcher = regex.matcher(str);
		str = matcher.replaceAll("");
		str = str.replace("'", "''");
		str = str.replace("-", "—");
		str = str.replace("(", "（");
		str = str.replace(")", "）");
		str = str.replace("%", "％");

		return str;
	}

	/**
	 * 从Request中取得指定的小写值
	 * 
	 * @param request
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static String getLowercaseString(HttpServletRequest request,
			String key) {
		return getString(request, key).toLowerCase();
	}

	/**
	 * 从request中取得int值,无值是返回null
	 * 
	 * @param request
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static Integer getInt(HttpServletRequest request, String key) {
		return getInt(request, key, null);
	}

	/**
	 * 从request中取得int值,如果无值则返回缺省值
	 * 
	 * @param request
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static Integer getInt(HttpServletRequest request, String key,
			Integer defaultValue) {
		String str = request.getParameter(key);
		if (StringUtils.isBlank(str)) {
			return defaultValue;
		}
		return Integer.parseInt(str);

	}

	/**
	 * 从Request中取得long值,如无值则返回null
	 * 
	 * @param request
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static long getLong(HttpServletRequest request, String key) {
		return getLong(request, key, null);
	}

	/**
	 * 取得长整形数组
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static Long[] getLongAry(HttpServletRequest request, String key) {
		String[] aryKey = request.getParameterValues(key);
		if(aryKey==null){
			return  null;
		}
		Long[] aryLong = new Long[aryKey.length];
		for (int i = 0; i < aryKey.length; i++) {
			if (null == aryKey[i] || "".equals(aryKey[i])) {
				aryKey[i] = "0";
			}
			aryLong[i] = Long.parseLong(aryKey[i]);
		}
		return aryLong;
	}

	/**
	 * 根据一串逗号分隔的长整型字符串取得长整形数组
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static Long[] getLongAryByStr(HttpServletRequest request, String key) {
		String sysUserId = request.getParameter(key);
		if(sysUserId==null){
			return  null;
		}
		if(sysUserId!=null&&sysUserId.equals("")){
			return new Long[0];
		}
		String[] aryId = sysUserId.split(",");
		Long[] lAryId = new Long[aryId.length];
		for (int i = 0; i < aryId.length; i++) {
			lAryId[i] = Long.parseLong(aryId[i]);
		}
		return lAryId;
	}

	/**
	 * 根据一串逗号分隔的长整型字符串取得长整形数组
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static String[] getStringAryByStr(HttpServletRequest request,
			String key) {
		String sysUserId = request.getParameter(key);
		String[] aryId = sysUserId.split(",");
		String[] lAryId = new String[aryId.length];
		for (int i = 0; i < aryId.length; i++) {
			lAryId[i] = (aryId[i]);
		}
		return lAryId;
	}

	/**
	 * 根据键值取得整形数组
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static Integer[] getIntAry(HttpServletRequest request, String key) {
		String[] aryKey = request.getParameterValues(key);
		Integer[] aryInt = new Integer[aryKey.length];
		for (int i = 0; i < aryKey.length; i++) {
			aryInt[i] = Integer.parseInt(aryKey[i]);
		}
		return aryInt;
	}

	public static Float[] getFloatAry(HttpServletRequest request, String key) {
		String[] aryKey = request.getParameterValues(key);
		Float[] fAryId = new Float[aryKey.length];
		for (int i = 0; i < aryKey.length; i++) {
			if (null == aryKey[i] || "".equals(aryKey[i])) {
				aryKey[i] = "0";
			}
			fAryId[i] = Float.parseFloat(aryKey[i]);
		}
		return fAryId;
	}

	public static Double[] getDoubleAry(HttpServletRequest request, String key) {
		String[] aryKey = request.getParameterValues(key);
		Double[] fAryId = new Double[aryKey.length];
		for (int i = 0; i < aryKey.length; i++) {
			if (null == aryKey[i] || "".equals(aryKey[i])) {
				aryKey[i] = "0";
			}
			fAryId[i] = Double.parseDouble(aryKey[i]);
		}
		return fAryId;
	}

	/**
	 * 从Request中取得long值,如果无值则返回null
	 * 
	 * @param request
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static Long getLong(HttpServletRequest request, String key,
			Long defaultValue) {
		String str = request.getParameter(key);
		if (StringUtils.isBlank(str)||"null".equals(str)) {
			return defaultValue;
		}
		return Long.parseLong(str);
	}

	/**
	 * 从Request中取得Float值,如无值则返回null
	 * 
	 * @param request
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static Float getFloat(HttpServletRequest request, String key) {
		return getFloat(request, key, null);
	}

	/**
	 * 从Request中取得float值,如无值则返回缺省值
	 * 
	 * @param request
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static Float getFloat(HttpServletRequest request, String key,
			Float defaultValue) {
		String str = request.getParameter(key);
		if (StringUtils.isBlank(str)) {
			return defaultValue;
		}
		return Float.parseFloat(request.getParameter(key));
	}

	/**
	 * 从Request中取得boolean值,如无值则返回缺省值 false, 如值为数字1，则返回true
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static boolean getBoolean(HttpServletRequest request, String key) {
		return getBoolean(request, key, false);
	}

	/**
	 * 从Request中取得boolean值 对字符串,如无值则返回缺省值, 如值为数字1，则返回true
	 * 
	 * @param request
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static boolean getBoolean(HttpServletRequest request, String key,
			boolean defaultValue) {
		String str = request.getParameter(key);
		if (StringUtils.isBlank(str)) {
			return defaultValue;
		}
		if (StringUtils.isNumeric(str)) {
			return (Integer.parseInt(str) == 1 ? true : false);
		}
		return Boolean.parseBoolean(str);
	}

	/**
	 * 从Request中取得Short值,如无值则返回null
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static Short getShort(HttpServletRequest request, String key) {
		return getShort(request, key, null);
	}

	/**
	 * 从Request中取得Short值 对字符串,如无值则返回缺省值
	 * 
	 * @param request
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static Short getShort(HttpServletRequest request, String key,
			Short defaultValue) {
		String str = request.getParameter(key);
		if (StringUtils.isBlank(str)) {
			return defaultValue;
		}
		return Short.parseShort(str);
	}

	/**
	 * 从Request中取得Date值,如无值则返回缺省值,如有值则返回 yyyy-MM-dd HH:mm:ss 格式的日期,或者自定义格式的日期
	 * 
	 * @param request
	 * @param key
	 * @param style
	 * @return
	 * @throws ParseException
	 */
	public static Date getDate(HttpServletRequest request, String key,
			String style) throws ParseException {
		String str = request.getParameter(key);
		if (StringUtils.isBlank(str)) {
			return null;
		}
		if (StringUtils.isBlank(style)) {
			style = "yyyy-MM-dd HH:mm:ss";
		}
		return (Date) DateUtil.parse(str, style);
	}

	/**
	 * 从Request中取得Date值,如无值则返回缺省值null, 如果有值则返回 yyyy-MM-dd 格式的日期
	 * 
	 * @param request
	 * @param key
	 * @return
	 * @throws ParseException
	 */
	public static Date getDate(HttpServletRequest request, String key)
			throws ParseException {
		String str = request.getParameter(key);
		if (StringUtils.isBlank(str)) {
			return null;
		}
		return (Date) DateUtil.parse(str, "yyyy-MM-dd");

	}

	/**
	 * 从Request中取得Date值,如无值则返回缺省值 如有值则返回 yyyy-MM-dd HH:mm:ss 格式的日期
	 * 
	 * @param request
	 * @param key
	 * @return
	 * @throws ParseException
	 */
	public static Date getTimestamp(HttpServletRequest request, String key)
			throws ParseException {
		String str = request.getParameter(key);
		if (StringUtils.isBlank(str)) {
			return null;
		}
		return (Date) DateUtil.parse(str,"yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 
	 * @param aryTmp
	 * @param isSecure
	 * @return
	 */
	@SuppressWarnings("unused")
	private static String getByAry(String[] aryTmp, boolean isSecure) {
		String rtn = "";
		for (int i = 0; i < aryTmp.length; i++) {
			String str = aryTmp[i].trim();
			if (StringUtils.isNotBlank(str)) {
				if (isSecure) {
					str = filterInject(str);
					if (StringUtils.isNotBlank(str)) {
						rtn += str + ",";
					}
				} else {
					rtn += str + ",";
				}
			}
		}
		if (rtn.length() > 0) {
			rtn = rtn.substring(0, rtn.length() - 1);
		}
		return rtn;
	}

	/**
	 * 根据参数名称获取参数值。
	 * 
	 * <pre>
	 * 1.根据参数名称取得参数值的数组。
	 * 2.将数组使用逗号分隔字符串。
	 * </pre>
	 * 
	 * @param request
	 * @param paramName
	 * @return
	 */
	public static String getStringValues(HttpServletRequest request,
			String paramName) {
		String[] values = request.getParameterValues(paramName);
		String tmp = "";
		for (int i = 0; i < values.length; i++) {
			if (i == 0) {
				tmp += values[i];
			} else {
				tmp += "," + values[i];
			}
		}
		return tmp;
	}

	/**
	 * 取得local。
	 * 
	 * @param request
	 * @return
	 */
	public static Locale getLocal(HttpServletRequest request) {
		Locale local = request.getLocale();
		if (local == null) {
			local = Locale.CHINA;
		}
		return local;
	}
	/**
	 * 将request参数放到map<String,Object>中。<br>
	 * 
	 * </pre>
	 * 
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws ParseException 
	 */
	@SuppressWarnings("rawtypes")
	public static Map<String,Object> getQueryMap(HttpServletRequest request) throws UnsupportedEncodingException, ParseException {
		// TYPE
		// 参数名:Q_PARANAME_TYPE
		// sortField,orderSeq
		Map<String,Object> map = new HashMap<String,Object>(16);
		Enumeration params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String key = params.nextElement().toString();
			String[] values = request.getParameterValues(key);
			/**
			 * 把这个做成一个数组，用户提交的数据别直接 拼接到sql语句带入数据库查询，先过滤一下
				insert create update union from ； -- - = * order by where 
				and or limit group
			 */
			/**
			 * Servlet中已经做了处理，这里不需要再处理了
			//查询过滤，防止sql注入
			boolean flag=false;
			for (String bug : bugs) {
				if(StringUtils.isNotBlank(values[0].trim())&&values[0].trim().equals(bug)){
					flag=true;
				}
			}
			//说明搜索条件存在非法字符串
			if(flag){
				continue;
			}
			*/
			if (values.length > 0 && StringUtils.isNotBlank(values[0])) {
				if (values.length == 1) {//name = Object
					String val = values[0].trim();
					if (StringUtils.isNotBlank(val)) {
						String param = URLDecoder.decode(values[0].trim(), "UTF-8");
						/*if(key.endsWith("_s")||key.endsWith("_e")){//时间匹配
							key = key.replace("_s","").replace("_e", "");
							map.put(key,TimeUtil.convertString(param,"yyyy-MM-dd"));
							
						}else {
							map.put(key,param);
						}*/
						if ("sort".equals(key)) {//搜索和排序
							String patternString = "[A-Z]";
							Pattern pattern = Pattern.compile(patternString);
							Matcher matcher = pattern.matcher(param);
							while (matcher.find()) {
								param = param.replaceFirst(matcher.group(), "_"+matcher.group().toLowerCase());
							}
							map.put(key, param);
						} else {
							map.put(key,param);
						}
					}
				} else {//name = [Object,Object,Object]
					map.put(key, values);
				}
			}
		}
		return map;
	}
	
	/**
	 * 通过Request的URL对应转成对应的JSP文件展示
	 */
	public static ModelAndView getAutoView(HttpServletRequest request)
			throws Exception {
		// HttpServletRequest request = RequestUtil.getHttpServletRequest();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();

		requestURI = requestURI.replace(".do", "");
		int cxtIndex = requestURI.indexOf(contextPath);
		if (cxtIndex != -1) {
			requestURI = requestURI.substring(cxtIndex + contextPath.length());
		}
		String[] paths = requestURI.split("[/]");
		if (paths != null && paths.length == 4) {
			String jspPath = "/" + paths[1] + "/" + paths[2]
					+ "/" + paths[2] + makeFirstLetterUpperCase(paths[3]);
			return new ModelAndView(jspPath);
		} else {
			return null;
		}
	}

	/**
	 * 返回出错或成功的信息。
	 * 
	 * @param writer
	 * @param resultMsg
	 * @param successFail
	 */
	public static void writeResultMessage(PrintWriter writer, String resultMsg,
			int successFail) {
		ResultMessage resultObj = new ResultMessage(successFail, resultMsg);
		writer.print(resultObj);
	}

	/**
	 * 返回出错或成功的信息。
	 * 
	 * @param writer
	 * @param resultMessage
	 */
	public static void writeResultMessage(PrintWriter writer,
			ResultMessage resultMessage) {
		writer.print(resultMessage);
	}

	/**
	 * 把字符串的第一个字母转为大写
	 * 
	 * @param newStr
	 * @return
	 */
	public static String makeFirstLetterUpperCase(String newStr) {
		if (newStr.length() == 0)
			return newStr;

		char[] oneChar = new char[1];
		oneChar[0] = newStr.charAt(0);
		String firstChar = new String(oneChar);
		return (firstChar.toUpperCase() + newStr.substring(1));
	}
}
