package controller.impl;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;

import config.BaseController;
import constant.AppConstant;
import controller.InterviewerController;
import jdk.nashorn.internal.ir.Flags;
import model.Admin;
import model.ChoiceQuestion;
import model.FillQuestion;
import model.ResponseModel;
import util.SessionUtil;

public class InterviewerControllerImpl extends BaseController implements InterviewerController{

	@Override
	public void doLogin() {
		// TODO Auto-generated method stub
		ResponseModel rm = new ResponseModel();
		String aid = getPara("id");//获取账号
		String apassword = getPara("password");
		//检查用户是否存在
		if(Admin.dao.checkIdExist(aid)){
			boolean success = Admin.dao.checkLogin(aid, apassword);
			if(success){
				SessionUtil.setAdminUserInfo(getSession(), aid);
				rm.msgSuccess("登录成功!");
			}else{
				rm.msgFailed("密码错误!");
			}
		}else{
			rm.msgFailed("用户不存在!");
		}
		renderJson(rm);
	}

	@Override
	public void indexView() {
		// TODO Auto-generated method stub
		render("index.jsp");
	}

	@Override
	public void historyView() {
		// TODO Auto-generated method stub
		render("historyManage.jsp");
	}

	@Override
	public void fillQuestionView() {
		// TODO Auto-generated method stub
		String condit = getPara("condit");
		Integer pageNumber = getParaToInt("pageNumber", 1);
		
		Page<FillQuestion> page = FillQuestion.dao.paginate(pageNumber, AppConstant.PAGE_SIZE, condit);
		
		setAttr("condit", condit);
		setAttr("page", page);
		render("fillQuestionManage.jsp");
	}

	@Override
	public void choiceQuestionView() {
		// TODO Auto-generated method stub
		
		String condit = getPara("condit");
		Integer pageNumber = getParaToInt("pageNumber", 1);
		
		Page<ChoiceQuestion> page = ChoiceQuestion.dao.paginate(pageNumber, AppConstant.PAGE_SIZE, condit);
		
		setAttr("condit", condit);
		setAttr("page", page);
		render("choiceQuestionManage.jsp");
	}

	@Override
	public void addOrUpdateChoice() {
		// TODO Auto-generated method stub
		ChoiceQuestion choice = getModel(ChoiceQuestion.class, "choice");
		ResponseModel rm = new ResponseModel();
		boolean flag = false;
		//若是id为空则是新增
		if (choice.get("c_id") == null) {
			flag = choice.save();
			rm.setType("add");
			rm.msgSuccess("新增成功");
		}
		//若id不为空则是更新
		else{
			flag = choice.update();
			rm.setType("update");
			rm.msgSuccess("更新成功");
		}
		renderJson(rm);
	}

	@Override
	public void deleteChoice() {
		// TODO Auto-generated method stub
		ResponseModel rm = new ResponseModel();
		String qid = getPara("id");
		String delType = getPara("delType");
		if (delType.trim().equals("s")){
			if(StrKit.notBlank(qid)){
				if(ChoiceQuestion.dao.deleteById(qid)){
					rm.msgSuccess("删除成功");
				}else{
					rm.msgFailed("删除失败");
				}
			}else{
				rm.msgFailed("删除失败");
			}
		}else if (delType.trim().equals("m")){
			int re = ChoiceQuestion.dao.deleteQuestions(qid);
			if( 1 == re ){
				rm.msgSuccess("删除成功");
			}else if( 0 == re ){
				rm.msgFailed("删除失败");
			}else if( 2 == re ){
				rm.msgFailed("删除失败，只删除选中部分数据，请刷新后重试");
			}else{
				rm.msgFailed("删除失败");
			}
		}else{
			rm.msgFailed("删除失败");
		}
		renderJson(rm);
	}
	
	@Override
	public void addOrUpdateFill() {
		
		FillQuestion fill = getModel(FillQuestion.class, "fill");
		ResponseModel rm = new ResponseModel();
		boolean flag = false;
		//若是id为空则是新增
		if (fill.get("f_id") == null) {
			flag = fill.save();
			rm.setType("add");
			rm.msgSuccess("新增成功");
		}
		//若id不为空则是更新
		else{
			flag = fill.update();
			rm.setType("update");
			rm.msgSuccess("更新成功");
		}
		renderJson(rm);
		
	}

	@Override
	public void deleteFill() {
		ResponseModel rm = new ResponseModel();
		String qid = getPara("id");
		String delType = getPara("delType");
		if (delType.trim().equals("s")){
			if(StrKit.notBlank(qid)){
				if(FillQuestion.dao.deleteById(qid)){
					rm.msgSuccess("删除成功");
				}else{
					rm.msgFailed("删除失败");
				}
			}else{
				rm.msgFailed("删除失败");
			}
		}else if (delType.trim().equals("m")){
			int re = FillQuestion.dao.deleteQuestions(qid);
			if( 1 == re ){
				rm.msgSuccess("删除成功");
			}else if( 0 == re ){
				rm.msgFailed("删除失败");
			}else if( 2 == re ){
				rm.msgFailed("删除失败，只删除选中部分数据，请刷新后重试");
			}else{
				rm.msgFailed("删除失败");
			}
		}else{
			rm.msgFailed("删除失败");
		}
		renderJson(rm);
		
	}
	
	@Override
	public void loginOut() {
		// TODO Auto-generated method stub
		getSession().invalidate();
		redirect("/login_interviewer");
	}

}
