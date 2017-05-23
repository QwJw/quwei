<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input id="url" class="hidden" value="${ctx }"/>
<input id="param" class="hidden" value="<%=request.getQueryString()%>"/>
<div class="jumbotron text-center" style="padding-top: 5px;">
    <img class="top" src="${ctx }/resources/admin/image/index.jpg" class="img-rounded">
</div>

<div class="navbar" style="padding-top: 4px;">
    <div class="navbar navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="indexView"><span class="icon-home" style="margin-top: 5px;"></span><strong> 首 页 </strong></a>

            <div class="nav-collapse collapse text-center">
                <ul class="nav" >
                    <li id="studentManageView"><a href="studentManageView"><span class="icon-user"></span> 学  生  管  理</a></li>
                    <li id="interviewerManageView"><a href="interviewerManageView"><span class="icon-list-alt"></span> 面 试 官 管 理</a></li>
                    <li><a href="#" onclick="loginout()"><span class="icon-off"></span> 退出系统</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>