package controller;

public interface AdminController {
	/**
	 * 登陆校验
	 */
	public void doLogin();
	/**
	 * 首页视图
	 */
	public void indexView();
	/**
	 * 考生管理视图
	 */
	public void studentManageView();
	/**
	 * 面试官管理视图
	 */
	public void interviewerManageView();
	/**
	 * 查看学生ID是否存在
	 */
	public void checkExsitStudent();
	/**
	 * 添加或修改学生
	 */
	public void addOrUpdateStudent();
	/**
	 * 删除学生
	 */
	public void deleteStudent();
	/**
	 * 注销
	 */
	public void loginOut();
}
