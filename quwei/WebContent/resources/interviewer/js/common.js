url = window.location.href;
viewList = ["fillQuestionView", "choiceQuestionView", "historyView"];

for(var i = 0; i < viewList.length; i++){
	item = viewList[i];
	if(url.indexOf(item) > 0){
		$("#"+item).addClass("active");
	}
}

//**************************显示选择信息**************************
function showChoose(msg){
	$("#chooseContent").text(msg);
	$("#chooseModal").modal('show');
}

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


/*//************************** 清 除 编 辑 模 态 框 内 容 **************************
function clean(){
	$("#table_id").val("");
	$("#old_sid").val("");
	$("#sid").val("");
    $("#sname").val("");
    $("#scollege").val("");
    $("#check_tip").html("");
    $("#update_button").removeAttr("disabled");
}*/

/**
 * 注销
 * @returns
 */
function loginout(){
	$("#chooseOk").unbind("click");
	showChoose("确 定 要 注 销  账  号  吗 ？");
	$("#chooseOk").bind("click", function(){
		window.location.href=$("#url").val()+"/interviewer/loginOut";
	});
}