<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="./include/head.jsp" %>
<title>Insert title here</title>
</head>
<body>
   <div class="container">
		<%@include file="./include/nav.jsp" %>
		<!-- 修改这个div即可 -->
		<div class="container text-center" style="padding-top: 30px;">
	        	面试官管理
	    </div>
	</div>
	<!--公用选择模态框-->
	<div class="modal hide fade" id="chooseModal" tabindex="0" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
	    <div class="modal-dialog" role="document" >
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                <h4 class="modal-title text-center text-info" id="chooseContent">提 示</h4>
	            </div>
	            <div style="display:none;" id="confirm_password" class="modal-body text-center">
	            	
	                <ul class="inline">
	                    <li><h5>请输入密码</h5></li>
	                    <li><input type="password" id="admin_password"/></li>
	                </ul>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-primary" id="chooseOk">确定</button>&nbsp;&nbsp;
	                <button type="button" class="btn btn-default" data-dismiss="modal"  aria-hidden="true">取消</button>
	            </div>
	        </div>
	    </div>
	</div>
	<%@include file="./include/foot.jsp" %>
	
</body>
</html>