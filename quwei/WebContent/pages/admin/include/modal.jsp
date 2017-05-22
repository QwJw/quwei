<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <li><h5>卡号 </h5></li>
                    <li><input type="text" onchange="check_exsit()" id="sid"/></li>
                </ul>
                <ul class="inline">
                    <li><h5>姓名</h5></li>
                    <li><input type="text" id="sname"/></li>
                </ul>
                <ul class="inline">
                    <li><h5>密码</h5></li>
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

