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
		<!--内容-->
        <div class="container text-center">
			<!--操作按钮-->
			<ul class="inline"><!--操作-->
                <li>
					<div class="input-prepend input-append" style="padding-top: 7px;">
						<div class="btn-group">
							<select id="search_type" style="width:auto">
                    		</select>
						</div>
						<input type="text" id="condit" value="${condit }" placeholder="关键字">
					</div>
				</li>
				<li><button class="btn" type="button" id="s" onclick="query(this);"><span class="icon-search"></span> 查 找 </button></li>
                <li><button type="button" class="btn" onclick="location.href='historyManageView'"><span class="icon-refresh"></span> 刷 新 </button></li>
            </ul>
			<div class="container tb-responsive">
				<table class="table table-condensed">
					<thead  style="white-space:nowrap; position: relative;z-index: 1;background:#ddd;">
						<tr>
							<th >交易单号</th>
							<th >交易卡号</th>
							<th >交易用户</th>
							<th >对方</th>
							<th >交易金额</th>
							<th >交易类型</th>
							<th >交易时间</th>
							<th >余额</th>
						</tr>
					</thead>
				    <tbody>
						<c:forEach items="${page.list }" var="h">
							<td style="padding-left: 33px;min-width: 110px;">${h.id }</td><!--学号-->
							<td >${h.card_id }</td>
							<td>${h.name }</td>
							<td>${h.other }</td><!--姓名-->
							<td>${h.trade_money }</td><!--学院-->
							<td>${h.trade_type }</td><!--分数-->
							<td style="padding-left: 25px;min-width: 110px;">${h.trade_time }</td><!--答题时间-->
							<td>${h.balance }</td><!--分数-->
							<tr style="max-height: 1px;background:#ddd;"><!--间隔--><td colspan="6" style="max-height: 1px;"></td></tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!--分页-->
            <%@include file="./include/page.jsp" %> 
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
	<script>
    	$(document).ready(function() {
    		initSearch("#search_type",${search_type})
    		$("#userInfo").hide();
    	});
    
    	function query(){
    		var search_type = $("#search_type").val();
	    	var condit = $("#condit").val();
	    	if (condit.trim() == ""){
	    		showWrongTip("请输入关键字");
	    		return;
	    	}
	    	location.href = "historyManageView?search_type="+search_type+"&condit"+"="+condit;
    	}
    	
	    function initSearch(id,st){
	    	var search = new Array('','卡号','姓名');
	   		for(var i = 1; i < search.length; i++){
   				if(i != st){//可选
   					$(id).append("<option value='"+i+"'>"+search[i]+"</option>");
   				}else{//设置默认
   					$(id).append("<option value='"+i+"' selected = 'selected' >"+search[i]+"</option>");
   				}
	   			
	   		}
	   	}
	    
		$("#select_all").click(function(){   
            if(this.checked){   
            	$("input[name='stu_list'][type=checkbox]").prop("checked", true);  
            }else{   
            	$("input[name='stu_list'][type=checkbox]").prop("checked", false);
            }   
        });
		 $("#editModal").on('hidden', function () {
            /*拟态框隐藏事件，用于初始化输入框，因为拟态框隐藏不会再次初始化，会保留之前输入的数据           单项*/
        	clean();
        	$("#tipModal").modal('hide');
         })
    </script>
</body>
</html>