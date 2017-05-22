//******************显示错误提示信息**************************
function showWrongTip(msg){
	$("#tipContent").text(msg);
	$("#tipContent").addClass("text-error");
	$("#tipContent").removeClass("text-success");
	$("#tipModal").modal('show');
}

//**************************显示正确正确信息**************************
function showRightTip(msg){
	$("#tipContent").text(msg);
	$("#tipContent").removeClass("text-error");
	$("#tipContent").addClass("text-success");
	$("#tipModal").modal('show');
}

//**************************显示选择信息**************************
function showChoose(msg){
	$("#chooseContent").text(msg);
	$("#chooseModal").modal('show');
}


//************************** 清 除 单 选 模 态 框 内 容 **************************
function singleClean(){
	$("#singleId").val("");
	$("#singleContent").val("");
    $("#singleA").val("");
    $("#singleB").val("");
    $("#singleC").val("");
    $("#singleD").val("");
   /* $("#singleTip").val("");*/
    $("input[name='singleOptionsRadios']").attr("CHECKED", null);
}


//**************************关键字查询题目信息**************************
function query(ob){
	var condiValue = $("#condit").val();
	if (condiValue.trim() == ""){
		showWrongTip("请输入题目关键字");
		return;
	}
	location.href = "choiceQuestionView?condit="+condiValue;
}

//************************** 添 加 单 条 单 项 选 择 题 目 **************************
function addSingle(){
	var id = $("#singleId").val();
	var content = $("#singleContent").val().trim();
	if (content == ""){
		showWrongTip("题目内容不能为空");
		return;
	}
	var a = $("#singleA").val().trim();
	var b = $("#singleB").val().trim();
	var c = $("#singleC").val().trim();
	var d = $("#singleD").val().trim();
	if ( a == "" || b == "" || c == "" || d == "" ){
		showWrongTip("选项内容不能为空");
		return;
	}
	var answer = $("input[name='singleOptionsRadios']:CHECKED").val();
	if (answer == undefined){
		showWrongTip("题目答案不能为空");
		return;
	}
	/*var explain = $("#singleTip").val(). trim();*/
	$.ajax({
        type: "post",  
        url: $("#url").val()+"/interviewer/addOrUpdateChoice",
        data: {
        	"choice.c_id"      :  id,
        	"choice.c_question" : content, 
        	"choice.c_choiceA" : a ,
        	"choice.c_choiceB" : b ,
        	"choice.c_choiceC" : c ,
        	"choice.c_choiceD" : d ,
        	"choice.c_answer"  : answer
        },
        success: function(resp) {
        	if (resp.type == "add"){//添加类型
        		if (resp.success){
            		showRightTip(resp.msg);
            		singleClean();
            	}else{
            		showWrongtTip(resp.msg);
            	}
        	}else{//编辑类型
        		if (resp.success){
            		showRightTip(resp.msg);
            		$("#"+id+"Content").text(content);
            		$("#"+id+"A").text(a);
            		$("#"+id+"B").text(b);
            		$("#"+id+"C").text(c);
            		$("#"+id+"D").text(d);
            		/*$("#"+id+"Explain").text(explain);*/
            		$("#"+id+"Answer").text(answer);
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

//************************** 编 辑 单 选 题 **************************
function editSingle(ob){
	var id = ob.id;
	
	var content = $("#"+id+"Content").text();
	var a = $("#"+id+"A").text();
	var b = $("#"+id+"B").text();
	var c = $("#"+id+"C").text();
	var d = $("#"+id+"D").text();
	var answer = $("#"+id+"Answer").text();
	$("#singleId").val(id);
	$("#singleContent").val(content);
    $("#singleA").val(a);
    $("#singleB").val(b);
    $("#singleC").val(c);
    $("#singleD").val(d);
    /*$("#singleTip").val(explain);*/

    $(":radio[name='singleOptionsRadios'][value='" + answer + "']").prop("checked", "checked");

    $("#singleModal").modal('show');
}


//************************** 删 除 题 目  **************************
function deleteQuestion(ob){
	var delId = ob.id.substring(0, ob.id.length - 3);
	$("#chooseOk").unbind("click");
	showChoose("确 定 删 除 该 题 目 信 息 吗 ？");
	$("#chooseOk").bind("click", function(){
		$.ajax({
			type: "post",
			url: $("#url").val()+"/interviewer/deleteChoice",
			data: {"delType": "s","id": delId},
			success: function(resp){
				if (resp.success){
					$("#chooseModal").modal('hide');
					location.href = "choiceQuestionView";
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
function deleteQuestions(ob){
	var id = ob.id.substring(0, ob.id.length - 4);
	var delId = "";
	//根据点击相应所属页面“删除所选”按钮获取相应题目的选中编号
	if (id == "single"){
		$("input[name='singleCB'][type=checkbox]").each(function() {
			if (this.checked){
				delId = delId + $(this).val() + "|";
			}
		});
	}else if(id == "multi"){
		$("input[name='multiCB'][type=checkbox]").each(function() {
			if (this.checked){
				delId = delId + $(this).val() + "|";
			}
		});
	}else if(id == "judge"){
		$("input[name='judgeCB'][type=checkbox]").each(function() {
			if (this.checked){
				delId = delId + $(this).val() + "|";
			}
		});
	}else{
		showWrongTip("错误");
	}
	//判断是否选中题目
	if (delId == ""){
		showWrongTip("请选择要删除的题目");
		return;
	}
	$("#chooseOk").unbind("click");
	showChoose("确 定 删 除 所 选 题 目 信 息 吗 ？");
	$("#chooseOk").bind("click", function(){
		$.ajax({
			type: "post",
			url: $("#url").val()+"/interviewer/deleteChoice",
			data: {"delType": "m","id": delId},
			success: function(resp){
				if (resp.success){
					$("#chooseModal").modal('hide');
					location.href = "choiceQuestionView";
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
