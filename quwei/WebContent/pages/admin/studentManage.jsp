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
		 <!-- 用户信息 -->
        <div class="container text-center">
            <ul class="inline"><!--操作-->
                <li>
					<div class="input-prepend input-append" style="padding-top: 7px;">
						<div class="btn-group">
							<select id="search_type" style="width:auto">
                    		</select>
						</div>
						<input class="span2" type="text" id="condit" value="${condit }" placeholder="关键字">
						<button class="btn" type="button" id="s" onclick="query(this);"><span class="icon-search"></span> 查 找 </button>
					</div>
				</li>
				
                <li><button type="button" class="btn" data-toggle="modal" data-target="#editModal"><span class="icon-plus"></span> 添 加 </button></li>
				<li><button type="button" class="btn" data-toggle="modal" data-target="#uploadModal"><span class="icon-plus-sign"></span> 批量导入 </button></li>
				<li><button type="button" class="btn" id="singleDels" onclick="deleteStudents(this)"><span class="icon-trash"></span> 删除所选 </button></li>
			</ul>
            <div class="container tb-responsive">
                <table id="table" class="table table-condensed tb-responsive" style="margin-left:auto;margin-right:auto;">
                    <thead style="white-space:nowrap; position: relative;z-index: 1;/*绝对定位 */background:#cccccc;">
	                    <tr>
	                    	<th style="width: 50px;"> 
                                	全 选<input type="checkbox" id="select_all"/>
                            </th>  
	                        <th style="padding-left: 33px;min-width: 110px;">用户ID</th>
	                        <th style="min-width: 75px;">姓名</th>
	                        <th style="min-width: 75px;">性别</th>
	                        <th style="min-width: 200px;">身份证号码</th>
	                        <th style="min-width: 100px;">电话号码</th>
	                        <th style="min-width:50px;padding-left: 9px;">&nbsp;&nbsp;&nbsp;编辑</th>
	                    </tr>
                    </thead>
                   
                
                    <%-- <tbody>
                    	<%Integer table_id = 1; %>
                    	<c:forEach items="${page.list }" var="s">
                    	
                    		<tr>
                    			
                    			<td style="padding-left: 25px;"><input  type="checkbox" name="stu_list" value="${s.sid }"/></td><!--选择-->
		                        <td style="padding-left: 33px;min-width: 110px;">${s.sid }</td>
		                        <td >${s.sname }</td>
		                        <td>${s.sprofession }</td>
		                        <td >${s.scollege }</td>
		                        <td >
		                            <button class="btn btn-link" id="<%=table_id %>" data-toggle="modal" data-target="#editModal" onclick="editStudent(this)">编辑</button>
		                            <button class="btn btn-link" id="<%=table_id %>" data-toggle="modal" data-target="#judgeModal" onclick="deleteStudent(this)">删除</button>
		                        </td>
		                        <%table_id++; %>
		                    </tr>
                    
	                    </c:forEach>
					</tbody> --%>
				
                    	
		                
               
                </table>
            </div>
			<%-- <%@include file="../common/page.jsp" %> --%>
        </div>
	</div>
	<!--公用批量导入模态框-->
    <div class="modal hide fade" id="uploadModal" tabindex="0" role="dialog" aria-hidden="true" data-backdrop="true">
        <div class="modal-dialog" role="document" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">选择批量导入Excel文件</h4>
                </div>
                <div class="modal-body text-center">
                    <form id="uploadForm" action=uploadStudents method="post" enctype="multipart/form-data" style="padding-top: 10px;" target="frameFile">
                        <input id="chooseFile" type="file" name="doc" style="display:none" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
                        
                        <div class="input-append">
                            <input id="showUrl"  type="text" readonly>
                            <a class="btn btn-primary" onclick="$('input[id=chooseFile]').click();">浏览文件</a>
                        </div>
                    </form>
                    <h6 style="color: #ff150e">提示：点击下方链接下载Excel表格模板，正确填充信息然后上传，否则可能导致上传失败.</h6>
                	<a id="dlTemplate" onclick="doDownloadTemplate()" style="cursor:pointer;">下载模板</a>
                </div>
                <div class="modal-footer text-left">
                    <button type="button" class="btn btn-success" onclick="doUpload()">确定上传</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"  aria-hidden="true">取消</button>
                </div>
            </div>
        </div>
    </div>
    
    <!--编辑用户信息模态框-->
    
    <div class="modal hide fade" id="editModal" tabindex="0" role="dialog" aria-hidden="true" data-backdrop="true">
        <div class="modal-dialog" role="document" >
            <div class="modal-content">
                <div class="modal-header red">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <input hidden="hidden" id="old_sid"/>
                    <input hidden="hidden" id="table_id"/>
                    <h4 class="modal-title">编 辑 用 户 信 息</h4>
                </div>
                <div class="modal-body text-center">
                	
                    <ul class="inline">
                        <li><h5>学号 </h5></li>
                        <li><input type="text" onchange="check_exsit()" id="sid"/></li>
                    </ul>
                    <ul class="inline">
                        <li><h5>姓名</h5></li>
                        <li><input type="text" id="sname"/></li>
                    </ul>
                    <ul class="inline">
                        <li><h5>学院</h5></li>
                        <li>
                        	<input type="text" style="display:none"/><input type="password" style="display:none"/>
                        	<input type="text"  id="scollege"/>
                        </li>
                    </ul>
                </div>
                <div class="modal-footer">
                	<ul class="inline">
                		<li><p id="check_tip"></p></li>
                		<li><button type="button" id="update_button" class="btn btn-primary" onclick="addStudent()">确定</button></li>
                		<li><button type="button" class="btn btn-default" data-dismiss="modal"  aria-hidden="true">取消</button></li>
                	</ul>
                	
                    
                    
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
    
    <!--公用提示模态框-->
    <div class="modal hide fade" id="tipModal" tabindex="0" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
        <div class="modal-dialog" role="document" >
            <div class="modal-content">
                <div class="modal-body text-center">
                	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 id="tipContent"></h4>
                </div>
            </div>
        </div>
    </div>
	<%@include file="./include/foot.jsp" %>
	<script src="<%=request.getContextPath()%>/resources/admin/js/studentManage.js" type="text/javascript"></script>
    
    <script>
    	$(document).ready(function() {
    		initSearch("#search_type",${search_type})
    	});
    
    	
	    function initSearch(id,st){
	    	var search = new Array('','用户ID','姓名');
	   		for(var i = 1; i <= 2; i++){
   				if(i != st){//可选
   					$(id).append("<option value='"+i+"'>"+search[i]+"</option>");
   				}else{//设置默认
   					$(id).append("<option value='"+i+"' selected = 'selected' >"+search[i]+"</option>");
   				}
	   			
	   		}
	   	}
	    
	    $("#chooseModal").on('hidden', function () {
            /*拟态框隐藏事件，用于初始化输入框，因为拟态框隐藏不会再次初始化，会保留之前输入的数据           单项*/
	    	 $("#confirm_password").hide();
        })
	    
	    $("#editModal").on('hidden', function () {
            /*拟态框隐藏事件，用于初始化输入框，因为拟态框隐藏不会再次初始化，会保留之前输入的数据           单项*/
        	clean();
        	$("#tipModal").modal('hide');
        })
		$("#select_all").click(function(){   
            if(this.checked){   
            	$("input[name='stu_list'][type=checkbox]").prop("checked", true);  
            }else{   
            	$("input[name='stu_list'][type=checkbox]").prop("checked", false);
            }   
        });
	    
	    $('input[id=chooseFile]').change(function() {
            $('#showUrl').val($(this).val());
        });
	    
	  //“1”存储成功 “0”存储失败 “2”上传模板出错 “3”数据填充出错，数据丢失 "4"没数据
		function afterUpload(respMsg){
			if (respMsg == "0"){
				$("#uploadModal").modal('hide');
				showWrongTip("上传失败");
			}else if (respMsg == "1"){
				$("#uploadModal").modal('hide');
				showRightTip("上传成功，刷新页面后即可查看上传内容");
			}else if (respMsg == "2"){
				$("#uploadModal").modal('hide');
				showWrongTip("上传失败,上传模板错误");
			}else if (respMsg == "3"){
				$("#uploadModal").modal('hide');
				showWrongTip("上传文件含不完整数据，上传未完成");
			}else if (respMsg == "4"){
				$("#uploadModal").modal('hide');
				showWrongTip("上传失败，上传文件不含有效数据");
			}
		}
	    
	  //**************************关键字查询题目信息**************************
	    function query(ob){
	    	var search_type = $("#search_type").val();
	    	var condiValue = $("#condit").val();
	    	if (condiValue.trim() == ""){
	    		showWrongTip("请输入关键字");
	    		return;
	    	}
	    	location.href = "stuManageView?search_type="+search_type+"&condit"+"="+condiValue;
	    }	
    
    </script>
    <iframe id='frameFile' name='frameFile' style='display: none;'></iframe>
</body>
</html>