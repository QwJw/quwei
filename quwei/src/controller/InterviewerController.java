package controller;

public interface InterviewerController {
	/**
	 * 登陆校验
	 */
	public void doLogin();
	/**
	 * 首页视图
	 */
	public void indexView();
	/**
	 * 考生成绩视图
	 */
	public void historyView();
	/**
	 * 单项选择题管理视图
	 */
	public void choiceQuestionView();
	/**
	 * 填空题管理视图
	 */
	public void fillQuestionView();
	
	/**
	 * 添加或更新单选题
	 */
	public void addOrUpdateChoice();
	/**
	 * 删除问题
	 */
	public void deleteChoice();
	
	/**
	 * 添加或更新填空题
	 */
	public void addOrUpdateFill();
	/**
	 * 删除填空问题
	 */
	public void deleteFill();
	
	/**
	 * 注销
	 */
	public void loginOut();
}
