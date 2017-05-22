package model;

import java.io.Serializable;

/**
 * 默认返回数据model
 * @author wwd
 * @date   2015-6-1
 */
public class ResponseModel implements Serializable {
	private static final long serialVersionUID = -5109787761925139443L;
	
	private Boolean success;				//调用是否成功
	private String code;					//调用返回错误代码
	private String msg;						//调用返回错误信息
	private String type;					//调用返回类型（编辑或添加）
	private Object data;					//调用返回结果
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	public Boolean getSuccess() {
		return success;
	}
	public void setSuccess(Boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	public ResponseModel(){
		success = false;
	}
	
	public void msgFailed(String msg){
		this.success = false;
		this.msg = msg;
	}
	
	public void msgSuccess(String msg){
		this.success = true;
		this.msg = msg;
	}
	
	public void msgSuccess(){
		this.success = true;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
