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
}
