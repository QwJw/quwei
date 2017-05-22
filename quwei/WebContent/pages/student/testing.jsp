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
    
    <title>趣味问答-测试</title>

</head>
<body style="background-color: #f5f5f5">
	<input id="url" class="hidden" value="<%=request.getContextPath()%>"/>
	<input id="answer_time" type="number" class="hidden"  value="${answer_time }"/>
    <div class="container">
        <!--顶端图片-->
        <div class="text-center" style="padding-top: 5px;">
            <h1>图书馆小常识测试</h1>
        </div>
        <div>
            <h5 class="text-success">测试人：${student.sname }</h5>
            <h5 class="text-info">说明：${startword }</h5>
            <h5 id="test_time" class="text-error">剩余答题时间：</h5>
        </div>
        <!--内容-->
        <form id="form" action="result" method="post">
        <input hidden="true" name="judge_total_num" value="${judge_total_num }">
        <input hidden="true" name="single_total_num" value="${single_total_num }">
        <input hidden="true" name="multi_total_num" value="${multi_total_num }">
        <div class="container">
       		<%int q_id = 1; %>
            <!-- 判断题 -->
            <div class="container">
                <h4 style="margin: 0px;padding: 0px;">一、判断题：</h4>
                <c:forEach items="${judge_list }" var="s">
                	<!-- 第一题 -->
	                <div class="row">
	                	<input hidden="true" name="jid<%=q_id %>" value="${s.qid }">
	                    <div class="span9 text-left">
	                        <p><h5><%=q_id %>.${s.qcontent }</h5></p>
	                    </div>
	                    <div class="span"></div>
	                    <div class="span text-left">
	                        <h6><input type="radio" name="j<%=q_id %>" value="1" style="margin-bottom: 4px;"/>&nbsp;&nbsp;<span class="icon-ok"></span></h6>
	                    </div>
	                    <div class="span text-left">
	                        <h6><input type="radio" name="j<%=q_id %>" value="0" style="margin-bottom: 4px;"/>&nbsp;&nbsp;<span class="icon-remove"></span></h6>
	                    </div>
	                    <div class="span7 text-left"></div>
	                   
	                
	                </div>
	                <%q_id++; %>
                	<!-- 第一题结束 -->
                </c:forEach>
                

            </div>
			<%q_id = 1; %>
            <!-- 单选题 -->
            <div class="container">
                <h4 style="margin-bottom: 0px;padding-bottom: 0px;">二、单项选择题：</h4>
				<c:forEach items="${single_list }" var="s">
	                <!-- 第一题 -->
	                <input hidden="true" name="sid<%=q_id %>" value="${s.qid }">
	                <div class="row text-left" style="margin-top: 0px;margin-bottom:0px;padpadding-top: 0px;">
	                    <div class="span">
	                        <h5><%=q_id %>.${s.qcontent }</h5>
	                    </div>
	                </div>
	                <div class="row" style="margin-top: 0px;padding-top: 0px;">
	                    <div class="span3 text-left">
	                        <h6><input type="radio" name="s<%=q_id %>" value="A" style="margin-bottom: 6px;"/> A. ${s.qa}</h6>
	                    </div>
	                    <div class="span3 text-left">
	                        <h6><input type="radio" name="s<%=q_id %>" value="B" style="margin-bottom: 6px;"/> B. ${s.qb}</h6>
	                    </div>
	                    <div class="span3 text-left">
	                        <h6><input type="radio" name="s<%=q_id %>" value="C" style="margin-bottom: 6px;"/> C. ${s.qc}</h6>
	                    </div>
	                    <div class="span3 text-left">
	                        <h6><input type="radio" name="s<%=q_id %>" value="D" style="margin-bottom: 6px;"/> D. ${s.qd}</h6>
	                    </div>
	                </div>
	                <%q_id++; %>
					<!-- 第一题结束 -->
				</c:forEach>
            </div>
			<%q_id = 1; %>
            <!-- 多选题 -->
            <div class="container">
                <h4 style="margin-bottom: 0px;padding-bottom: 0px;">三、多项选择题：</h4>
				<c:forEach items="${multi_list }" var="s">
	                <!-- 第一题 -->
	                <input hidden="true" name="mid<%=q_id %>" value="${s.qid }">
	                <div class="row text-left">
	                    <div class="span">
	                        <h5><%=q_id %>.${s.qcontent }</h5>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="span3 text-left">
	                        <h6><input type="checkbox" name="m<%=q_id %>" value="A" style="margin-bottom: 6px;"/> A. ${s.qa}</h6>
	                    </div>
	                    <div class="span3 text-left">
	                        <h6><input type="checkbox" name="m<%=q_id %>" value="B" style="margin-bottom: 6px;"/> B. ${s.qb}</h6>
	                    </div>
	                    <div class="span3 text-left">
	                        <h6><input type="checkbox" name="m<%=q_id %>" value="C" style="margin-bottom: 6px;"/> C. ${s.qc}</h6>
	                    </div>
	                    <div class="span3 text-left">
	                        <h6><input type="checkbox" name="m<%=q_id %>" value="D" style="margin-bottom: 6px;"/> D. ${s.qd}</h6>
	                    </div>
	                </div>
	                <%q_id++; %>
	                <!-- 第一题结束 -->
	            </c:forEach>
	
            </div>
			
            <div class="container text-center" style="padding-top:20px;padding-bottom:20px;">
                <h6 class="text-warning">*要检查一下自己有没有漏答题目哦*</h6>
                <button type="submit" class="btn btn-success ">提交</button>
            </div>
			</form>
            <div class="text-right" style="padding-top: 10px;">
                <p>
                    <small class="text-left">@肇庆学院-福慧图书馆-技术部</small>
                </p>
            </div>
        </div>
    </div>

    <!--公用提示模态框-->
    <div class="modal hide fade" id="tipModal" tabindex="0" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
        <div class="modal-dialog" role="document" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提 示</h4>
                </div>
                <div class="modal-body">
                    <h6 id="tipContent">提示内容</h6>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"  aria-hidden="true">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!--公用选择模态框-->
    <div class="modal hide fade" id="chooseModal" tabindex="0" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
        <div class="modal-dialog" role="document" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提 示</h4>
                </div>
                <div class="modal-body">
                    <h6 id="chooseContent">提示内容</h6>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"  aria-hidden="true">取消</button>
                </div>
            </div>
        </div>
    </div>


    <script src="<%=request.getContextPath()%>/frame/jquery/js/jquery.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/frame/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script>
        $("#uploadModal").on('hidden', function () {
            /*拟态框隐藏事件，用于初始化输入框，因为拟态框隐藏不会再次初始化，会保留之前输入的数据*/
            $("#chooseFile").val("");
            $("#showUrl").val("");
        })
        
        var i = $("#answer_time").val() * 60;
        var timer = window.setInterval ("showTime()", 1000);

		function showTime(){
			if(i <= 0){
				//小于0时将定时器清除
				window.clearInterval(timer)
				//提交表单
				$('#form').submit();
			}
			$("#test_time").html("剩余答题时间："+fix(Math.floor(i/60),2)+":"+fix(i % 60,2));
			i = i - 1;
		}
		
		//将整数num转成长度为length的字符串
		function fix(num, length) {
			  return ('' + num).length < length ? ((new Array(length + 1)).join('0') + num).slice(-length) : '' + num;
		}
        /*  $('form').submit(function(){ 
			alert($(this).serialize()); 
			return false; 
		});   */
    </script>
</body>
</html>