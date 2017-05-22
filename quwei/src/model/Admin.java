package model;

import com.jfinal.kit.StrKit;

import model.base.BaseAdmin;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Admin extends BaseAdmin<Admin> {
	public static final Admin dao = new Admin().dao();
	
	/**
	 * 判断该账号是否存在
	 * @param aid
	 * @return
	 */
	public boolean checkIdExist(String aid){
		return findById(aid) != null;
	}
	
	/**
	 * 登录验证账号密码
	 * @param aid
	 * @param apassword
	 * @return
	 */
	public boolean checkLogin(String aid, String apassword){
		if(StrKit.notBlank(aid) && StrKit.notBlank(apassword)){
			Admin admin = findById(aid);
			if(admin != null){
				if(admin.getStr("apassword").equals(apassword)){
					return true;
				}
			}
		}
		return false;
	}
}
