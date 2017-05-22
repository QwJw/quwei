package constant;

public final class AppConstant {
	
	/**
	 * 分页大小
	 */
	public static final Integer PAGE_SIZE = 20;//默认页大小
	
	public static final String adminUserId = "adminUserId";
	public static final String adminUserName = "adminUserName";
	
	/**
	 * 前台用户session变量名称
	 */
	public static final String frontedUserId = "frontedUserId";
	
	public static final String sessionId = "sessionId";
	
	public static final String EXPORT_EXCEL_DIR = "export_excel_dir";
	
	public static final String IMPORT_EXCEL_DIR = "import_excel_dir";
	
	
	/**
	 * 上传、下载Excel表格列表头
	 */
	//题库
	public static final String QCONTENT = "*内容";
	public static final String QA = "*A选项";
	public static final String QB = "*B选项";
	public static final String QC = "*C选项";
	public static final String QD = "*D选项";
	public static final String QANSWER = "*答案";
	public static final String QEXPLAIN = "注解";
	//学生
	public static final String SID = "*学号";
	public static final String SNAME = "*姓名";
	public static final String SCOLLEGE = "*学院";
	//答题记录记录
	public static final String HSTU_NUM = "学号";
	public static final String HNAME = "姓名";
	public static final String HCOLLEGE = "学院";
	public static final String HSCORE = "分数";
	public static final String HTIME = "答题时间";
}
