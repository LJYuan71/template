package tk.ljyuan71.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	/**
	 * 根据指定日期格式格式化日期
	 * 
	 * @param date
	 * @param formater
	 * @return
	 */
	public static String format(Date date, String formater){
		if(date==null)
			return null;
		
		SimpleDateFormat sdf = new SimpleDateFormat( formater );
		return sdf.format(date);
	}
	
	/**
	 * 格式化日期
	 * 
	 * @param date
	 * @param formater
	 * @return
	 */
	public static Date parse(String date, String formater) {
		if(date==null||"".equals(date))
			return null;
		SimpleDateFormat sdf = new SimpleDateFormat(formater);
		Date result = null;
		try {
			result = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	

	 /**
     * 获取下个月。 
     * @param time
     * @return  time+1
     */
    public static String getXLTime(String time){
    	Date date = parse(time,"yyyy-MM");
    	Calendar cr = Calendar.getInstance();
    	cr.setTime(date);
    	cr.add(Calendar.MONTH,+1);
    	return format(cr.getTime(), "yyyy-MM");
    }
    /**
     * 判断是否是当前的年月
     * @param time
     * @return
     */
    public static boolean isCurrentYearMonth(String time){
    //	System.out.println(format(new Date(),"yyyy-MM").equals(time));
    	return format(new Date(),"yyyy-MM").equals(time);
    	
    }
    /**
     * 判断是否超过了当前的年月
     * @param time
     * @return
     */
    public static boolean isAftertime(String time){
    	 Date date = parse(time,"yyyy-MM");
    	 return new Date().after(date);
    }
    public static void main(String[] args) {
		System.out.println(getXLTime("2017-01"));
	}
}
