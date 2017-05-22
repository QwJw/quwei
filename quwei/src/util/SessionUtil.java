package util;

import javax.servlet.http.HttpSession;

import com.jfinal.kit.StrKit;

import constant.AppConstant;

public final class SessionUtil {

	/**
	 * 设置登录用户ID
	 * @author	wwd
	 * @date	2015-7-1
	 * @param httpSession
	 * @param userId
	 * @return
	 */
	public static void setAdminUserId(HttpSession httpSession,String userId){
		if(httpSession != null && userId != null){
			httpSession.setAttribute(AppConstant.adminUserId, userId);
		}
	}
	
	/**
	 * 获取登陆用户ID
	 * @return
	 */
	public static String getAdminUserId(HttpSession httpSession){
		Object obj = httpSession.getAttribute(AppConstant.adminUserId);
		if(null != obj){
			return (String) obj;
		}
		return null;
	}
	
	/**
	 * 将用户名保存进session
	 * @param httpSession
	 * @param username
	 */
	public static void setAdminUsername(HttpSession httpSession,String username){
		if(httpSession != null && StrKit.notBlank(username)){
			httpSession.setAttribute(AppConstant.adminUserName, username);
		}
	}
	
	/**
	 * 获取用户名
	 * @param httpSession
	 * @return
	 */
	public static String getAdminUsername(HttpSession httpSession){
		Object obj = httpSession.getAttribute(AppConstant.adminUserName);
		if(null != obj){
			return obj.toString();
		}
		return null;
	}
	
	/**
	 * 设置sessionId
	 * @param httpSession
	 * @param sessionId
	 */
	public static void setSessionId(HttpSession httpSession,String sessionId){
		if(httpSession != null && StrKit.notBlank(sessionId)){
			httpSession.setAttribute(AppConstant.sessionId, sessionId);
		}
	}
	
	/**
	 * 获取sessionId
	 * @param httpSession
	 * @return
	 */
	public static String getSessionId(HttpSession httpSession){
		Object obj = httpSession.getAttribute(AppConstant.sessionId);
		if(null != obj){
			return obj.toString();
		}
		return null;
	}
	
	/**
	 * 设置用户信息
	 * @param httpSession
	 * @param userId
	 */
	public static void setAdminUserInfo(HttpSession httpSession,String userId){
		setAdminUserId(httpSession, userId);
	}
	
	
	public static void setFrontedLoginUserId(HttpSession httpSession,String userId){
		if(httpSession != null && userId != null){
			httpSession.setAttribute(AppConstant.frontedUserId, userId);
		}
	}
	
	
	/**
	 * 获取前台用户id
	 * @param httpSession
	 * @return
	 */
	public static String getFrontedLoginedUserId(HttpSession httpSession){
		Object obj = httpSession.getAttribute(AppConstant.frontedUserId);
		if(null != obj){
			return obj.toString();
		}
		return null;
	}
}
