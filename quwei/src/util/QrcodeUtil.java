package util;

import java.util.Hashtable;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;

public final class QrcodeUtil {
	
	
	/**
	 * 通过URL生成返回BitMatrix
	 * @param url
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static BitMatrix getQrcode(String url){
		int width = 400;   
        int height = 400;   
        Hashtable hints= new Hashtable();   
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");  
        BitMatrix bitMatrix = null;
		try {
			bitMatrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, width, height,hints);
		} catch (WriterException e) {
			e.printStackTrace();
		}
		return bitMatrix;
	}
}
