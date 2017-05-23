package config;


import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;

import controller.impl.AdminControllerImpl;
import controller.impl.IndexControllerImpl;
import controller.impl.InterviewerControllerImpl;
import controller.impl.StudentControllerImpl;
import model._MappingKit;


/**
 * JFinal框架总配置类（继承JFinalConfig类）
 * 方法作用：
 * 		1、configConstant(Constants me)
 * 		       配置视图文件格式、开发模式、上传下载文件的路径等；
 *  	2、configRoute(Routes me) 代替web.xml的功能，同时实现一个servlet接受处理多个请求
 * 		       配置请求的映射关系和转发重定向的路径等；
 * 		3、configPlugin(Plugins me) 
 * 		       配置添加插件，Plugins类作为插件管理类
 * 		4、configInterceptor(Interceptors me) 
 * 		       配置过滤器
 * 		5、configHandler(Handlers me) 
 */
public class BaseConfig extends JFinalConfig{

	@Override
	public void configConstant(Constants me) {
		/**
		 * JFinal框架的开发配置步骤
		 * 1、配置视图类型：jsp模式
		 */

		/**
		 * 配置c3p0数据源
		 */
		//读取数据库配置文件
		PropKit.use("jdbc.properties");
		
		me.setViewType(ViewType.JSP);//配置框架所用视图
		me.setDevMode(PropKit.getBoolean("devMode", true));//开发模式
	}

	@Override
	public void configRoute(Routes me) {
		/**
		 * 配置请求映射关系
		 * add(para1, para2, para3)
		 * para1:请求servlet路径
		 * para2:所映射的类
		 * para3:视图响应路径
		 */
		me.add("/", IndexControllerImpl.class, "/pages");
		me.add("/student", StudentControllerImpl.class, "/pages/student");
		me.add("/admin", AdminControllerImpl.class, "/pages/admin");
		me.add("/interviewer", InterviewerControllerImpl.class, "/pages/interviewer");
		
	}
	
	public static DruidPlugin createDruidPlugin() {
		return new DruidPlugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
	}
	
	@Override
	public void configPlugin(Plugins me) {
		DruidPlugin druidPlugin = createDruidPlugin();
		me.add(druidPlugin);
		
		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
		// 所有映射在 MappingKit 中自动化搞定
		_MappingKit.mapping(arp);
		me.add(arp);
		
		//设置显示sql语句
		arp.setShowSql(true);
	}

	/**
	 * 配置拦截器
	 */
	@Override
	public void configInterceptor(Interceptors me) {
		
	}

	@Override
	public void configHandler(Handlers me) {
		me.add(new ContextPathHandler("ctx"));
	}
	
	public static void main(String[] args) {
		JFinal.start("WebContent", 9080, "/", 5);
	}

	@Override
	public void configEngine(Engine me) {
		// TODO Auto-generated method stub
		
	}
}
