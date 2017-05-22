<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <link href="<%=request.getContextPath()%>/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="<%=request.getContextPath()%>/frame/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    
    <title>趣味问答-结果</title>

</head>
<body style="background-color: #f5f5f5">
	<div class="container">
	    <div class="text-center" style="padding-top: 5px;">
	        <h1>图书馆小常识测试</h1>
	    </div>
	    <div>
	        <ul class="inline">
	            <li>
	                <h5 class="text-success">恭喜您，${student.sname }，你的分数为:</h5>
	            </li>
	            <li><h3 class="text-error">${total_score }分</h3></li>
	        </ul>
	
	        <h5 class="text-info">${endword }</h5>
	    </div>
	    <!--内容-->
	    <div class="container">
	    	<%int q_id = 1; %>
	        <!-- 判断题 -->
	        <div class="container">
	            <h4 style="margin: 0px;padding: 0px;">一、判断题：</h4>
	            <c:forEach items="${judgeList }" var="s">
	            <!-- 第一题 -->
	            <div class="row">
	                <div class="span12 text-left">
	                    <p><h5><%=q_id %>.${s.qcontent }</h5></p>
	                </div>
	
	            </div>
	
	            <!-- 结果注释 -->
	            <div class="row">
	                <div class="span4">
	                    <ul class="inline">
	                        <li><h6>结果：</h6></li>
	                        <li>
	                        	<c:if test="${s.u_answer eq s.qanswer}">
	                        		<h6 class="text-success">正确</h6>
	                        	</c:if>
	                        	<c:if test="${s.u_answer ne s.qanswer}">
	                        		<h6 class="text-error">错误</h6>
	                        	</c:if>
	                        	
	                        </li>
	                    </ul>
	                </div>
	                <div class="span4">
	                    <h6 class="text-success">正确答案：${s.qanswer eq '1' ? '√' : '×' }</h6>
	                </div>
	                <div class="span4 ">
	                	<c:choose>
	                		<c:when test="${s.u_answer ne ''}">
	                			<c:choose>
	                				<c:when test="${s.u_answer eq s.qanswer}">
			                       		<h6 class="text-success">你的答案：${s.u_answer eq '1' ? '√' : '×' }</h6>
			                       	</c:when>
			                       	<c:when test="${s.u_answer ne s.qanswer}">
			                       		<h6 class="text-error">你的答案： ${s.u_qanswer eq '1' ? '√' : '×' }</h6>
			                       	</c:when>
	                			</c:choose>
	                		</c:when>
	                		
	                		<c:otherwise>
	                			<h6 class="text-error">你的答案：</h6>
	                		</c:otherwise>
	                	</c:choose>
                       	
	                    
	                </div>
	            </div>
              	<c:if test="${not empty s.qexplain}">
              		<h6 class="text-info">注释: ${s.qexplain }</h6>
              	</c:if>
	            
				<!-- 第一题结束 -->
				<%q_id++; %>
				</c:forEach>
	        </div>
			<% q_id = 1; %>
	        <!-- 单选题 -->
	        <div class="container">
	            <h4 style="margin-bottom: 0px;padding-bottom: 0px;">二、单项选择题：</h4>
				<c:forEach items="${singleList }" var="s">
					<!-- 第一题 -->
		            <div class="row text-left" style="margin-top: 0px;margin-bottom:0px;padpadding-top: 0px;">
		                <div class="span">
		                    <h5><%=q_id %>. ${s.qcontent }</h5>
		                </div>
		            </div>
		            <div class="row" style="margin-top: 0px;padding-top: 0px;">
		                <div class="span3 text-left">
		                    <h6> A. ${s.qa }</h6>
		                </div>
		                <div class="span3 text-left">
		                    <h6>B. ${s.qb }</h6>
		                </div>
		                <div class="span3 text-left">
		                    <h6>C. ${s.qc }</h6>
		                </div>
		                <div class="span3 text-left">
		                    <h6>D. ${s.qd }</h6>
		                </div>
		            </div>
		            <!-- 结果注释 -->
		            <div class="row">
		                <div class="span4">
		                    <ul class="inline">
		                        <li><h5>结果：</h5></li>
		                        <li>
		                        	<c:if test="${s.u_answer eq s.qanswer}">
		                        		<h6 class="text-success">正确</h6>
		                        	</c:if>
		                        	<c:if test="${s.u_answer ne s.qanswer}">
		                        		<h6 class="text-error">错误</h6>
		                        	</c:if>
		                        </li>
		                    </ul>
		                </div>
		                <div class="span4">
		                    <h6 class="text-success">正确答案： ${s.qanswer }</h6>
		                </div>
		                <div class="span4 ">
		                	<c:if test="${s.u_answer eq s.qanswer}">
	                       		<h6 class="text-success">你的答案：${s.u_answer}</h6>
	                       	</c:if>
	                       	<c:if test="${s.u_answer ne s.qanswer}">
	                       		<h6 class="text-error">你的答案： ${s.u_answer}</h6>
	                       	</c:if>
		                </div>
		            </div>
		            <c:if test="${not empty s.qexplain}">
	              		<h6 class="text-info">注释: ${s.qexplain }</h6>
	              	</c:if>
					<!-- 第一题结束 -->
					<%q_id++; %>
				</c:forEach>
	            
	        </div>
			<% q_id = 1; %>
	        <!-- 多选题 -->
	        <div class="container">
	            <h4 style="margin-bottom: 0px;padding-bottom: 0px;">三、多项选择题：</h4>
				<c:forEach items="${multiList }" var="s">
					<!-- 第一题 -->
		            <div class="row text-left">
		                <div class="span">
		                    <h5><%=q_id %>. ${s.qcontent }</h5>
		                </div>
		            </div>
		            <div class="row">
		                <div class="span3 text-left">
		                    <h6> A. ${s.qa }</h6>
		                </div>
		                <div class="span3 text-left">
		                    <h6> B. ${s.qb }</h6>
		                </div>
		                <div class="span3 text-left">
		                    <h6> C. ${s.qc }</h6>
		                </div>
		                <div class="span3 text-left">
		                    <h6> D. ${s.qd }</h6>
		                </div>
		            </div>
		
		            <!-- 结果注释 -->
		            <div class="row">
		                <div class="span4">
		                    <ul class="inline">
		                        <li><h6>结果：</h6></li>
		                        <li>
		                        	<c:if test="${s.u_answer eq s.qanswer}">
		                        		<h6 class="text-success">正确</h6>
		                        	</c:if>
		                        	<c:if test="${s.u_answer ne s.qanswer}">
		                        		<h6 class="text-error">错误</h6>
		                        	</c:if>
		                        </li>
		                    </ul>
		                </div>
		                <div class="span4">
		                    <h6 class="text-success">正确答案： ${s.qanswer}</h6>
		                </div>
		                <div class="span4 ">
		                    <c:if test="${s.u_answer eq s.qanswer}">
	                       		<h6 class="text-success">你的答案：${s.u_answer}</h6>
	                       	</c:if>
	                       	<c:if test="${s.u_answer ne s.qanswer}">
	                       		<h6 class="text-error">你的答案： ${s.u_answer}</h6>
	                       	</c:if>
		                </div>
		            </div>
		            <c:if test="${not empty s.qexplain}">
	              		<h6 class="text-info">注释: ${s.qexplain }</h6>
	              	</c:if>
	            	<!-- 第一题结束 -->
	            	<% q_id++; %>
				</c:forEach>
	            
	        </div>
	
			<div class="container text-center" style="padding-top:20px;padding-bottom:20px;">
                <button class="btn btn-success" onclick="location.href='loginout'">退出并返回登录页面</button>
            </div>
	
	        <div class="text-center" style="padding-top: 15px; padding-bottom: 15px;">
	            <p>
	                <small class="text-center">@肇庆学院-福慧图书馆-技术部</small>
	            </p>
	        </div>
	    </div>
	</div>
	
	<script src="<%=request.getContextPath()%>/frame/jquery/js/jquery.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/frame/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
    