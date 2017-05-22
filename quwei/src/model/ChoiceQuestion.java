package model;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;

import model.base.BaseChoiceQuestion;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class ChoiceQuestion extends BaseChoiceQuestion<ChoiceQuestion> {
	public static final ChoiceQuestion dao = new ChoiceQuestion().dao();
	
	
	/**
	 * 所有 sql 与业务逻辑写在 Service 中，在此放在 Model 中仅为示例，
	 * 不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
	 */
	public Page<ChoiceQuestion> paginate(int pageNumber, int pageSize, String condit) {
//		StringBuilder selectSql = new StringBuilder();
//		selectSql.append(" select *,if(qall_times = 0,0,(qtrue_times/qall_times)) as true_rate");
		StringBuilder fromSql = new StringBuilder();
		fromSql.append("from choice_question");
		StringBuilder whereSql = new StringBuilder();
		whereSql.append(" where 1 = 1 ");
		if (StrKit.notBlank(condit)) {
			whereSql.append(" and c_question like ").append("'%").append(condit).append("%'");
		}
		StringBuilder orderSql = new StringBuilder();
		orderSql.append(" order by c_id asc");
		return paginate(pageNumber, pageSize, "select *", fromSql.append(whereSql).append(orderSql).toString());
	}
	
	/**
	 * 返回3个状态：“0”删除失败，一个都没删除成功；“1”删除成功；“2”只删除部分
	 * @param ids
	 * @return
	 */
	public int deleteQuestions(String ids){
		/*
		 * split分隔符总结
			1.字符"|","*","+"都得加上转义字符，前面加上"\\"。
			2.而如果是"\"，那么就得写成"\\\\"。
			3.如果一个字符串中有多个分隔符，可以用"|"作为连字符。
		 */
		String[] id = ids.split("\\|");
		Integer idAllNum = id.length;
		int idDelNum = 0;
	
		for (int i = 0; i < idAllNum; ++i){
			if(deleteById(id[i]))
				idDelNum++;
		}
		if (idAllNum.equals(idDelNum)){
			return 1;
		}else if(idAllNum.equals("0")){
			return 0;
		}else
			return 2;
	}
}
