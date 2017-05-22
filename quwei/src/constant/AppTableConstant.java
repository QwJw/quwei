package constant;

/**
 *数据库：数据表名、主键名、特殊类型值
 */
public final class AppTableConstant {
	
	//管理员
	public static final String ADMIN = "admin";
	public static final String ADMIN_KEY = "adid";
	
	//答题历史
	public static final String HISTORY = "history";
	public static final String HISTORY_KEY = "id"; 

	//选择题
	public static final String CHOICE_QUESTION = "choice_question";
	public static final String CHOICE_KEY = "c_id";
	
	//填空题
	public static final String FILL_QUESTION = "fill_question";
	public static final String FILL_KEY = "f_id";
	
	//面试官
	public static final String INTERVIEW = "interview";
	public static final String INTERVIEW_KEY = "tid"; 
	
	//学生
	public static final String STUDENT = "student";
	public static final String STUDENT_KEY = "sid"; 
	
	
	
	public static final Integer QUESTION_JUDGE = 1;//判断题
	public static final Integer QUESTION_SINGLE = 2;//单选题
	public static final Integer QUESTION_MUTIL = 3;//多选题
	
	public static final Integer QUESTION_UNLIMIT = 0;//随机
	public static final Integer QUESTION_LIMIT = 1;//优先
	
}
