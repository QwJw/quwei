package controller.impl;

import config.BaseController;
import controller.IndexController;

public class IndexControllerImpl extends BaseController implements IndexController{

	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("index.jsp");
	}
	
	@Override
	public void login_student() {
		// TODO Auto-generated method stub
		render("student/login.jsp");
	}

	@Override
	public void login_admin() {
		// TODO Auto-generated method stub
		render("admin/login.jsp");
	}

	@Override
	public void login_interviewer() {
		// TODO Auto-generated method stub
		render("interviewer/login.jsp");
	}

	

}
