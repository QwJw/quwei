package controller.impl;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;

import config.BaseController;
import constant.AppConstant;
import controller.AdminController;
import model.ResponseModel;
import model.Student;

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
		Integer search_type = getParaToInt("search_type", 1);
		String condit = getPara("condit");
		Integer pageNumber = getParaToInt("pageNumber", 1);
		Page<Student> page = Student.dao.paginate(pageNumber, AppConstant.PAGE_SIZE, search_type, condit);
		setAttr("page", page);
		setAttr("search_type", search_type);
		setAttr("condit", condit);
		render("studentManage.jsp");
	}

	@Override
	public void interviewerManageView() {
		// TODO Auto-generated method stub
		render("interviewerManage.jsp");
	}

	@Override
	public void checkExsitStudent() {
		// TODO Auto-generated method stub
		String sid = getPara("sid");//账号
		Student student = Student.dao.findById(sid);
		if(student != null){
			renderJson(true);
		}else{
			renderJson(false);
		}
	}

	@Override
	public void addOrUpdateStudent() {
		// TODO Auto-generated method stub
		ResponseModel rm = new ResponseModel();
		String old_sid = getPara("old_sid");
		Student student = getModel(Student.class, "student");
		//old_sid为空时添加学生
		if(StrKit.isBlank(old_sid)){
			// 密码默认是身份证后6位
			String cardnumer = student.getCardnumber();
			student.setPwd(cardnumer.substring(cardnumer.length() - 6));
			if(student.save()){
				rm.setSuccess(true);
				rm.setType("add");
				rm.msgSuccess("添加成功,刷新即可看到新增信息");
			}else{
				rm.setSuccess(false);
				rm.setType("add");
				rm.msgFailed("添加失败");
			}
		}else{
			if (Student.dao.updateStudent(student, old_sid)) {
				rm.setSuccess(true);
				rm.setType("edit");
				rm.msgSuccess("修改成功");
			} else {
				rm.setSuccess(false);
				rm.setType("edit");
				rm.msgSuccess("修改失败");
			}
		}
		renderJson(rm);
	}

	@Override
	public void deleteStudent() {
		// TODO Auto-generated method stub
		ResponseModel rm = new ResponseModel();
		String sid = getPara("id");
		String delType = getPara("delType");
		
		if (delType.trim().equals("s")){
			
			if(StrKit.notBlank(sid)){
				if(Student.dao.deleteById(sid)){
					rm.setSuccess(true);
					rm.msgSuccess("删除成功");
				}else{
					rm.setSuccess(false);
					rm.msgFailed("删除失败");
				}
			}else{
				rm.setSuccess(false);
				rm.msgFailed("删除失败");
			}
		}else if (delType.trim().equals("m")){
			int re = Student.dao.deleteStudents(sid);
			if( 1 == re ){
				rm.setSuccess(true);
				rm.msgFailed("删除成功");
			}else if( 0 == re ){
				rm.setSuccess(false);
				rm.msgFailed("删除失败");
			}else if( 2 == re ){
				rm.setSuccess(false);
				rm.msgFailed("删除失败，只删除选中部分数据，请刷新后重试");
			}else{
				rm.setSuccess(false);
				rm.msgFailed("删除失败");
			}
		}else{
			rm.setSuccess(false);
			rm.msgFailed("删除失败");
		}
		renderJson(rm);
	}

	@Override
	public void loginOut() {
		// TODO Auto-generated method stub
		getSession().invalidate();
		redirect("/login_admin");
	}

}
