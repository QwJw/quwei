package config;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Record;
/**
 * 控制器基类
 * @author wrj
 *
 */
public abstract class BaseController extends Controller {
	public Integer getParaToInt(String name,int maxValue, int defaultValue) {
		Integer value = this.getParaToInt(name, defaultValue);
		if(value != null && value.intValue() > maxValue){
			return maxValue;
		}
		return value;
	}
	
	public String getParaTrim(String name,String defaultValue){
		String value = this.getPara(name);
		if(StrKit.notBlank(value)){
			return value.trim();
		}else{
			return defaultValue;
		}
	}
	
	/**
	 * 
	 * @author:zbn
	 * @todo:对象添加数据（返回数据用）
	 * @param:
	 * @return:
	 * @time:2015年12月31日下午3:18:43
	 */
	public void addDate(Record record,Map<String,Object> datas){
		Set<Entry<String,Object>> entrySet = datas.entrySet();
		Iterator<Entry<String, Object>> iterator = entrySet.iterator();
		while(iterator.hasNext()){
			Entry<String, Object> entry = iterator.next();
			record.set(entry.getKey(), entry.getValue());
		}
	}
	
	
}
