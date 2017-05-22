package controller.impl;

import config.BaseController;
import controller.AdminController;

public class AdminControllerImpl extends BaseController implements AdminController{

	@Override
	public void doLogin() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void indexView() {
		// TODO Auto-generated method stub
		render("index.jsp");
	}

	@Override
	public void studentManageView() {
		// TODO Auto-generated method stub
		render("studentManage.jsp");
	}

	@Override
	public void interviewerManageView() {
		// TODO Auto-generated method stub
		render("interviewerManage.jsp");
	}

}
