<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="frame/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<style>
	body{
	  padding-top: 15px;
	  padding-bottom: 20px;
	  background-color: #f5f5f5;
	}
	a:hover{ cursor:pointer; }
	@media (min-width: 950px) {
	  img{
	    width: 725px;
	    height:455px;
	  }
	}
	</style>
</head>
<body>
	<input id="url" class="hidden" value="<%=request.getContextPath()%>"/>
	
  <div class="container">

	    <div class="container text-center">
	      <img src="resources/images/index.jpg" class="">
	    </div>
	    <div class="container ">
	
	      <legend class="text-center"><h3>趣味问答</h3></legend>
		 
	      <div class="text-center">
	        学 号 <input type="text" id="stu_id" class="input-medium search-query" placeholder="学号是最美美的昵称哦">
	      </div>
	      <div class="text-center" style="padding-top: 15px;">
	        <button class="btn btn-success" onclick="jump()">开始答题</button>
	      </div>
	     
	    </div>
	
	  <div class="text-right" style="padding-top: 35px;">
	    <a href="login_interviewer"><span class="icon-user"></span>面试官登录</a>
	    <p>
	      <small class="text-left">@肇庆学院-福慧图书馆-技术部</small>
	    </p>
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
  	<script src="frame/jquery/js/jquery.js" type="text/javascript"></script>
	<script src="frame/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script>
		function jump(){
			var sid = $("#stu_id").val();
			$.ajax({  
		        type: "post",  
		        url: $("#url").val()+"/checkExsitStudent",  
		        data: "sid=" + sid,  
		       /*  dataType: 'html',  
		        contentType: "application/x-www-form-urlencoded; charset=utf-8",   */
		        success: function(response) {  
		        	
		            //location.reload();  
		           /*  $("#editModal").modal('hide');
		            $("#message").text("修改成功");
		            $("#tipModal").modal(); */
		            //console.log(result);
		        	//console.log(response);
		            if(response.success){
		            	window.location.href = $("#url").val()+"/contest";
		            }else{
		            	showWrongTip(response.msg);
		            }
		        }
		    }); 
			
		}
		
		//******************显示错误提示信息**************************
		function showWrongTip(msg){
			$("#tipContent").text(msg);
			$("#tipContent").addClass("text-error");
			$("#tipContent").removeClass("text-success");
			$("#tipModal").modal('show');
		}
	</script>
  </body>
</html>