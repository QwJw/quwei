package model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BaseHistory<M extends BaseHistory<M>> extends Model<M> implements IBean {

	public M setId(java.lang.Integer id) {
		set("id", id);
		return (M)this;
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public M setStuId(java.lang.Integer stuId) {
		set("stu_id", stuId);
		return (M)this;
	}

	public java.lang.Integer getStuId() {
		return get("stu_id");
	}

	public M setStuName(java.lang.String stuName) {
		set("stu_name", stuName);
		return (M)this;
	}

	public java.lang.String getStuName() {
		return get("stu_name");
	}

	public M setScore(java.lang.Float score) {
		set("score", score);
		return (M)this;
	}

	public java.lang.Float getScore() {
		return get("score");
	}

	public M setDepartment(java.lang.String department) {
		set("department", department);
		return (M)this;
	}

	public java.lang.String getDepartment() {
		return get("department");
	}

	public M setAnswerTime(java.util.Date answerTime) {
		set("answer_time", answerTime);
		return (M)this;
	}

	public java.util.Date getAnswerTime() {
		return get("answer_time");
	}

}
