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

//************************** 清 除 编 辑 模 态 框 内 容 **************************
function clean(){
	$("#table_id").val("");
	$("#old_sid").val("");
	$("#sid").val("");
    $("#sname").val("");
    $("#scollege").val("");
    $("#check_tip").html("");
    $("#update_button").removeAttr("disabled");
}

//************************** 编 辑 单 选 题 **************************
function editStudent(obj){
	var id = $(obj).attr("id"); 
    //获取表格中的一行数据 
	var table_row = document.getElementById("table").rows[id];
    var sid = table_row.cells[1].innerText;  
    var sname = table_row.cells[2].innerText;
    var scollege = table_row.cells[3].innerText;
    //向模态框中传值
    $("#table_id").val(id);
    $("#old_sid").val(sid);
	$("#sid").val(sid);
    $("#sname").val(sname);
    $("#scollege").val(scollege);
    $("#singleModal").modal('show');
}

//************************** 添 加 单 条 判 断 题 目 **************************
function addStudent(){
	var table_id = $("#table_id").val();
	var old_sid = $("#old_sid").val();
	var sid = $("#sid").val().trim();
	var sname = $("#sname").val().trim();
	var scollege = $("#scollege").val().trim();
	if (sid == "" || sname == "" || scollege == ""){
		showWrongTip("学生信息不能为空");
		return;
	}
	$.ajax({
        type: "post",  
        url: $("#url").val()+"/admin/updateStudent",
        data: "old_sid=" + old_sid + "&student.sid=" + sid + "&student.sname=" + sname + "&student.scollege=" + scollege,
        success: function(resp) {
        	if (resp.type == "add"){//添加类型
        		if (resp.success){
            		showRightTip(resp.msg);
            		judgeClean();
            	}else{
            		showWrongTip(resp.msg);
            	}
        	}else{//编辑类型
        		if (resp.success){
            		showRightTip(resp.msg);
            		var table_row = document.getElementById("table").rows[table_id];
            		//学号
            		var input_str = "<input type='checkbox' name='stu_list' value='"+sid+"'/>";
            	    table_row.cells[0].innerHTML = input_str;  
            		table_row.cells[1].innerText = sid;  
            	    table_row.cells[2].innerText = sname;
            	    table_row.cells[3].innerText = scollege;
            		console.log(table_row);
            	}else{
            		showWrongTip(resp.msg);
            	}
        	}
        },
		error: function(resp){
			showWrongTip(resp.msg);
		}
    });
}

//************************** 删 除 学 生  **************************
function deleteStudent(obj){
	var id = $(obj).attr("id"); 
    //获取表格中的一行数据  
    var sid = document.getElementById("table").rows[id].cells[1].innerText;
	$("#chooseOk").unbind("click");
	showChoose("确 定 删 除 该 题 目 信 息 吗 ？");
	$("#chooseOk").bind("click", function(){
		$.ajax({
			type: "post",
			url: $("#url").val()+"/admin/deleteStudent",
			data: "delType=s&id=" + sid,
			success: function(resp){
				if (resp.success){
					$("#chooseModal").modal('hide');
					location.href = "stuManageView?" + $("#param").val();
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
function deleteStudents(ob){
	var delId = "";
	//根据点击相应所属页面“删除所选”按钮获取相应题目的选中编号
	$("input[name='stu_list'][type=checkbox]").each(function() {
		if (this.checked){
			delId = delId + $(this).val() + "|";
		}
	});
	//判断是否选中题目
	if (delId == ""){
		showWrongTip("请选择要删除的学生");
		return;
	}
	$("#chooseOk").unbind("click");
	showChoose("确 定 删 除 所 选 学 生 信 息 吗 ？");
	$("#chooseOk").bind("click", function(){
		$.ajax({
			type: "post",
			url: $("#url").val()+"/admin/deleteStudent",
			data: "delType=m&id=" + delId,
			success: function(resp){
				$("#chooseModal").modal('hide');
				location.href = "stuManageView?" + $("#param").val();
			},
			error: function(resp){
				$("#chooseModal").modal('hide');
				showWrongTip("删除出错");
			}
		});
	});
}

//************************** 检测学生是否存在   **************************
function check_exsit(){
	var old_sid = $('#old_sid').val();
	var sid = $('#sid').val().trim();
	if(old_sid != sid && sid != ''){
		$.ajax({  
	        type: "post",  
	        url: $("#url").val()+"/admin/checkExsitStudent",  
	        data: "sid=" + sid,  
	        success: function(result) {     	
	            if(result){
	            	$("#check_tip").html("<span style='color:red'>学号已存在</span>");
	            	$("#update_button").attr("disabled","disabled");
	            }else{
	            	$("#update_button").removeAttr("disabled");
	            }
	        },
			error: function(result){
				alert("bbbb");
            	$("#check_tip").html("<span style='color:red'>请求出错</span>");
            	$("#update_button").attr("disabled","disabled");
			}
	    }); 
	}
}


/**
 * 下载上传模板
 * @returns
 */
function doDownloadTemplate(){
	window.location.href = "downloadStudentTemplate";
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