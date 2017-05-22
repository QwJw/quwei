package controller;

public interface IndexController {
	/**
	 * 路由
	 */
	
	public void index();
	
	/**
	 * 考生登陆
	 */
	public void login_student();
	
	/**
	 * 管理员登陆
	 */
	public void login_admin();
	/**
	 * 面试官登陆
	 */
	public void login_interviewer();
}
