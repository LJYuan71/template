package tk.ljyuan71.utils;


/**
 * 消息处理
 * 
 * @author hotent
 * 
 */
public class ResultMessage {
	/**
	 * 成功
	 */
	public static final int Success = 1;

	/**
	 * 失败
	 */
	public static final int Fail = 0;

	private int result = 1;
	private String message = "";

	public ResultMessage() {
	}

	public ResultMessage(int result, String message) {
		this.result = result;
		this.message = message;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ResultMessage [result=" + result + ", message=" + message + "]";
	}
}
