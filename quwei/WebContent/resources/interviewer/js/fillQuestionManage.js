//************************** 清 除 单 选 模 态 框 内 容 **************************
function fillClean(){
	$("#fillId").val("");
	$("#fillContent").val("");
    $("#fillanswer").val("");
  /*$("#fillTip").val("");   */
}


//**************************关键字查询题目信息**************************
function querys(ob){
	var scondiValue = $("#scondi").val();
	if (scondiValue.trim() == ""){
		showWrongTip("请输入题目关键字");
		return;
	}
	location.href = "fillQuestionView?condit="+scondiValue;
}

//************************** 添 加 单 条 单 项 选 择 题 目 **************************
function addfill(){
	var id = $("#fillId").val();
	var content = $("#fillContent").val().trim();
	if (content == ""){
		showWrongTip("题目内容不能为空");
		return;
	}
	
	var answer = $("#fillAnswer").val().trim();
	/*var b = $("#singleB").val().trim();
	var c = $("#singleC").val().trim();
	var d = $("#singleD").val().trim();*/
	if ( answer == ""){
		showWrongTip("答案内容不能为空");
		return;
	}/*
	var answer = $("input[name='singleOptionsRadios']:CHECKED").val();
	if (answer == undefined){
		showWrongTip("题目答案不能为空");
		return;
	}*/
	/*var explain = $("#fillTip").val(). trim();*/
	$.ajax({
        type: "post",  
        url: $("#url").val()+"/interviewer/addOrUpdateFill",
        data: {
        	"fill.f_id"      :  id,
        	"fill.f_question" : content,         	
        	"fill.f_answer"  : answer
        },
        success: function(resp) {
        	if (resp.type == "add"){//添加类型
        		if (resp.success){
            		showRightTip(resp.msg);
            		fillClean();
            	}else{
            		showWrongtTip(resp.msg);
            	}
        	}else{//编辑类型
        		if (resp.success){
            		showRightTip(resp.msg);
            		$("#"+id+"Content").text(content);
            		$("#"+id+"Answer").text(answer);
            		/*$("#"+id+"Explain").text(explain);*/
            	}else{
            		showWrongtTip(resp.msg);
            	}
        	}
        },
		error: function(resp){
			showWrongtTip(resp.msg);
		}
    });
}

//************************** 编 辑 填 空 题 **************************
function editfill(ob){
	
	var id = ob.id;
	
	var content = $("#"+id+"Content").text();
	var answer = $("#"+id+"Answer").text();
	
	$("#fillId").val(id);
	$("#fillContent").val(content);
	$("#fillAnswer").val(answer);
	
    $("#fillModal").modal('show');
    
}


//************************** 删 除 题 目  **************************
function deletefillQuestion(ob){
	var delId = ob.id.substring(0, ob.id.length - 3);
	$("#fillsOk").unbind("click");
	showChoose("确 定 删 除 该 题 目 信 息 吗 ？");
	$("#fillsOk").bind("click", function(){
		$.ajax({
			type: "post",
			url: $("#url").val()+"/interviewer/deleteFill",
			data: {"delType": "s","id": delId},
			success: function(resp){
				if (resp.success){
					$("#chooseModal").modal('hide');
					location.href = "fillQuestionView";
				}else{
					showWrongTip(resp.msg);
				}
			},
			error: function(resp){
				showWrongTip(resp.msg);
			}
		});
	});
}

//************************** 删 除 选 择 题 目  **************************
function deletefillQuestions(ob){
	//var id = ob.id.substring(0, ob.id.length - 4);
	//alert(id);
	var delId = "";
	//根据点击相应所属页面“删除所选”按钮获取相应题目的选中编号
	$("input[name='singleCB'][type=checkbox]").each(function() {
		if (this.checked){
			delId = delId + $(this).val() + "|";
		}
	});
	//alert(delId);
	//判断是否选中题目
	if (delId == ""){
		showWrongTip("请选择要删除的题目");
		return;
	}
	$("#fillsOk").unbind("click");
	showChoose("确 定 删 除 所 选 题 目 信 息 吗 ？");
	$("#fillsOk").bind("click", function(){
		$.ajax({
			type: "post",
			url: $("#url").val()+"/interviewer/deleteFill",
			data: {"delType": "m","id": delId},
			success: function(resp){
				if (resp.success){
					$("#chooseModal").modal('hide');
					location.href = "fillQuestionView";
				}else{
					showWrongTip(resp.msg);
				}
			},
			error: function(resp){
				showWrongTip(resp.msg);
			}
		});
	});
}

/**
 * 模板类型
 */
var templateType = "";
//****************** 修 改 flag**************************
function changeUpLoadflag(ob){
	templateType = ob.id;
	$("#uploadType").val(ob.id);
}

/**
 * 下载上传模板
 * @returns
 */
function doDownloadTemplate(){
	if (templateType != "")
		window.location.href = "downloadTemplate?templateType=" + templateType;
}

/**
 * 执行上传文件
 * @returns
 */
function doUpload(){
	if ($("#showUrl").val() == ""){
		showWrongTip("请选择批量导入文件(Excel)");
	}else{
		$("#uploadForm").submit();
	}
}
/**
 * 注销
 * @returns
 */
function loginout(){
	$("#chooseOk").unbind("click");
	showChoose("确 定 要 注 销 管  理  员  账  号  吗 ？");
	$("#chooseOk").bind("click", function(){
		window.location.href=$("#url").val()+"/admin/loginout";
	});
}
