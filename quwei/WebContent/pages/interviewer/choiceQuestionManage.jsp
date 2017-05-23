<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.jfinal.plugin.activerecord.Record"%>
<%@page import="com.jfinal.plugin.activerecord.Page"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=11">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <link href="<%=request.getContextPath()%>/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="<%=request.getContextPath()%>/frame/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	
    <title>趣味问答系统-题库管理</title>
	
    <style>
        body{
            background-color: #f5f5f5;
        }
        img{
            width:100%;
            max-height:200px;
        }
        @media (min-width: 950px) {
            img{
                height:200px;
            }
        }

        table td {
            vertical-align: middle !important;
        }


        .tb-responsive {
            width: 100%;
            max-height: 600px;
            overflow-y:auto;
            -ms-overflow-style: -ms-autohiding-scrollbar;
        }

        textarea{
            width: 90%;
            height: 90%;
        }

        select{
            width: 100%;
        }

        .content{
            max-width: 200px;
            word-break:break-all;
        }

        .itemContent{
            max-width: 150px;
            min-width:100px;
            word-break:break-all;
        }

        .tip{
            min-width: 100px;
            max-width: 150px;
            word-break:break-all;
        }

    </style>
</head>
<body>
    <!-- 主要内容 -->
    <div class="container">
        <%@include file="./include/nav.jsp" %>

        <!--内容-->
        <div class="container text-center">

                <!--单项选择题-->
                <div class="container text-center">
                    <!--操作按钮-->
                    <ul class="inline"><!--操作-->
                        <li>
                            <div class="input-append" style="padding-top: 10px;">
                                <c:if test="${condit eq '' }">
                                	<input class="span2" type="text" placeholder="题目关键字" id="condit">
                                </c:if>
                                <c:if test="${condit ne '' }">
                                	<input class="span2" type="text" placeholder="题目关键字" id="condit" value="${condit }">
                                </c:if>
                                
                                <button class="btn" type="button" id="s" onclick="query(this);"><span class="icon-search"></span> 查 找 </button>
                            </div>
                        </li>
                        <li><button type="button" class="btn" data-toggle="modal" data-target="#singleModal"><span class="icon-plus"></span> 添 加 </button></li>
                        <li><button type="button" class="btn" id="singleDels" onclick="deleteQuestions(this)"><span class="icon-trash"></span> 删除所选 </button></li>
                        <li><button type="button" class="btn" data-toggle="modal" data-target="#uploadModal" id="single" onclick="changeUpLoadflag(this)"><span class="icon-plus-sign"></span> 批量导入 </button></li>
                    </ul>
                    <!--题库内容（表格显示）-->
                    <div class="container tb-responsive">
                        <table class="table table-striped text-center table-bordered table-condensed table-responsive" style="min-width: 600px;" data-toggle="table">
                            <thead style="white-space:nowrap; position: relative;z-index: 1;/*绝对定位 */background:#cccccc;">
                            <tr>
                                <th style="width: 45px;"> 全 选
                                    <input type="checkbox" id="singleCB"/>
                                </th>
                                <th >题 目 内 容</th>
                                <th colspan="2">选 项</th>
                                <th style="width: 50px;">答案</th>
                               <!--  <th style="width: 100px;">注解</th> -->
                                <th style="width: 15px;">回答次数（次）</th>
                                <th style="width: 15px;">正确率（%）</th>
                                <!-- <th >答题限定</th> -->
                                <th style="min-width:50px;padding-left: 9px;">&nbsp;&nbsp;&nbsp;编 辑</th>
                            </tr>
                            </thead>
                            <tbody>

                            <!-- ******************************************默认显示样式****************************************** -->

							<c:forEach items="${page.list }" var="s">
								<tr>
	                                <td rowspan="4" style="padding-left: 25px;"><input type="checkbox" value="${s.c_id }" name="singleCB"/></td><!--选择-->
	                                <td rowspan="4" class="content" id="${s.c_id }Content">${s.c_question}</td>
	                                <td style="max-width: 7px;"><strong>A</strong></td><!--选项标记-->
	                                <td class="itemContent" id="${s.c_id }A">${s.c_choiceA }</td><!--选项内容-->
	                                <td rowspan="4" style="width: 50px;" id="${s.c_id }Answer">${s.c_answer }</td><!--答案-->
	                                <%-- <td rowspan="4" class="tip" id="${s.qid }Explain">${s.qexplain }</td><!--题目注释--> --%>
	                                <td rowspan="4">${s.all_times }</td><!--回答次数-->
	                                <td rowspan="4"><fmt:formatNumber value="${s.true_rate * 100 }" pattern="0.00"/>%</td><!--正确率-->
	                                <%-- <td rowspan="4">
	                                	<input class="hidden" id="o${s.qid }State" value="${s.qlimit }"/>
	                                	<select id="${s.qid }State" onchange="setState(this)" class="${s.qlimit eq '1' ? 'text-error' : '' }" style="width: 65px;">
										  <option ${s.qlimit eq "0" ? "SELECTED" : ""} value="0">随机</option>
										  <option ${s.qlimit eq "1" ? "SELECTED" : ""} value="1">优先</option>
										</select>
	                                </td><!--答题限定--> --%>
	                                <td rowspan="4" style="width: 150px;"><!--题目操作->编辑->删除-->
	                                    <a class="btn btn-link" id="${s.c_id }" onclick="editSingle(this)">编辑</a>
	                                    <a class="btn btn-link" id="${s.c_id }del" onclick="deleteQuestion(this)">删除</a>
	                                </td>
	                            </tr>
	                            <tr><!--B选项-->
	                                <td style="max-width: 7px;"><strong>B</strong></td>
	                                <td class="itemContent" id="${s.c_id }B">${s.c_choiceB }</td>
	                            </tr>
	                            <tr><!--C选项-->
	                                <td style="max-width: 7px;"><strong>C</strong></td>
	                                <td class="itemContent" id="${s.c_id }C">${s.c_choiceC }</td>
	                            </tr>
	                            <tr><!--D选项-->
	                                <td style="max-width: 7px;"><strong>D</strong></td>
	                                <td class="itemContent" id="${s.c_id }D">${s.c_choiceD }</td>
	                            </tr>
	                            <tr style="max-height: 1px;"><!--间隔-->
	                                <td colspan="10" style="max-height: 1px; background-color:#cccccc;"></td>
	                            </tr>
							</c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <!--分页-->
                    <%@include file="./include/page.jsp" %>

                    <!--modal添加单个题目模态框-->
                    <!--
                        Button trigger modal 添加触发按钮，即“添加按钮”
                                                                        为触发按钮添加属性： data-toggle="modal" data-target="#singleModal"  对应id
                        data-backdrop="false" 点击窗口外不会关闭窗口
                    -->
                    <!-- 单项选择题添加Modal -->
                    <div class="modal hide fade" id="singleModal" tabindex="0" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
                        <div class="modal-dialog" role="document" >
                            <div class="modal-content">
                                <div class="modal-header red">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">新 增 单 项 选 择 题 目</h4>
                                    <input id="singleId" value="" class="hidden"/>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" style="width: 100%;" id="singlePlus">
                                        <table style="width: 90%;">
                                            <tr>
                                                <td colspan="1"><strong  style="white-space: nowrap">题目:</strong></td>
                                                <td colspan="3"><textarea id="singleContent" style="width: 100%;max-width:100%;height: 100px;" placeholder="题目内容"></textarea></td>
                                            </tr>

                                            <tr>
                                                <td colspan="1"><strong>A. </strong></td>
                                                <td colspan="3"><input id="singleA" type="text" style="width: 100%;" name="inputA" placeholder="A选项内容"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="1"><strong>B. </strong></td>
                                                <td colspan="3"><input id="singleB" type="text" style="width: 100%;" name="inputA" placeholder="B选项内容"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="1"><strong>C. </strong></td>
                                                <td colspan="3"><input id="singleC" type="text" style="width: 100%;" name="inputA" placeholder="C选项内容"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="1"><strong>D. </strong></td>
                                                <td colspan="3"><input id="singleD" type="text" style="width: 100%;" name="inputA" placeholder="D选项内容"></td>
                                            </tr>
                                            <tr>
                                                <td><strong>答案:</strong></td>
                                                <td colspan="3" align="left" >
                                                    <label class="radio inline " style="max-width: 50px;">
                                                        <input type="radio" name="singleOptionsRadios" value="A"> A
                                                    </label>
                                                    <label class="radio inline">
                                                        <input type="radio" name="singleOptionsRadios" value="B"> B
                                                    </label>
                                                    <label class="radio inline">
                                                        <input  type="radio" name="singleOptionsRadios" value="C"> C
                                                    </label>
                                                    <label class="radio inline">
                                                        <input  type="radio" name="singleOptionsRadios" value="D"> D
                                                    </label>
                                                </td>
                                            </tr>
                                            <!-- <tr>
                                                <td colspan="1"><strong>注释:</strong></td>
                                                <td colspan="3"><input id="singleTip" type="text" name="tip" placeholder="题目注释" style="width: 100%;" ></td>
                                            </tr> -->
                                        </table>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" onclick="addSingle()">提交</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal"  aria-hidden="true">返回</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
            
        </div>
    </div>
	
    <!-- 部件 -->
    
    <!--公用批量导入模态框-->
    <div class="modal hide fade" id="uploadModal" tabindex="0" role="dialog" aria-hidden="true" data-backdrop="true">
        <div class="modal-dialog" role="document" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">选择批量导入Excel文件</h4>
                </div>
                <div class="modal-body text-center">
                    <form id="uploadForm" action="uploadQuestions" method="post" enctype="multipart/form-data" style="padding-top: 10px;" target="frameFile">
                        <input id="chooseFile" type="file" name="doc" style="display:none" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
                        <input id="uploadType" value="" name="uploadType" class="hidden" />
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

    <!--公用选择模态框-->
    <div class="modal hide fade" id="chooseModal" tabindex="0" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
        <div class="modal-dialog" role="document" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center text-info" id="chooseContent">提 示</h4>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="chooseOk">确定</button>&nbsp;&nbsp;
                    <button type="button" class="btn btn-default" data-dismiss="modal"  aria-hidden="true">取消</button>
                </div>
            </div>
        </div>
    </div>



    <%@include file="./include/foot.jsp" %>
    <script src="<%=request.getContextPath()%>/resources/interviewer/js/choiceQuestionManage.js" type="text/javascript"></script>
    <script>
        $("#singleModal").on('hidden', function () {
            /*拟态框隐藏事件，用于初始化输入框，因为拟态框隐藏不会再次初始化，会保留之前输入的数据           单项*/
        	singleClean();
        	$("#tipModal").modal('hide');
        })


        $("#uploadModal").on('hidden', function () {
            /*拟态框隐藏事件，用于初始化输入框，因为拟态框隐藏不会再次初始化，会保留之前输入的数据*/
            $("#chooseFile").val("");
            $("#showUrl").val("");
        })

        $('input[id=chooseFile]').change(function() {
            $('#showUrl').val($(this).val());
        });
        
        $("#singleCB").click(function(){   
            if(this.checked){   
                $("input[name='singleCB'][type=checkbox]").prop("checked", true);  
            }else{   
        		$("input[name='singleCB'][type=checkbox]").prop("checked", false);
            }   
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
    	
    </script>
    <iframe id='frameFile' name='frameFile' style='display: none;'></iframe>
</body>
</html>