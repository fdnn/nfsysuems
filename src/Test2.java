import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.commons.httpclient.util.HttpURLConnection;


public class Test2 {

	public static void main(String[] args) throws Exception {
		download("http://jwxt.nfsysu.cn/readimagexs.aspx?xh=132011084&timestamp=1174459330&secret=ffbd8eea4519bc1bdb47b3da8070faf2", "xx.jpg", "D:\\jjj");
	}
	
	public static void download(String urlString, String filename,String savePath) throws Exception {
	     InputStream inputStream = null;
	     HttpURLConnection httpURLConnection = null;

	     try {
	       URL url = new URL(urlString);
	       System.out.println(urlString);
	       httpURLConnection = (HttpURLConnection) url.openConnection();
	       httpURLConnection.setConnectTimeout(10000);
	       httpURLConnection.setDoInput(true);   
	       httpURLConnection.setRequestMethod("GET");
	       int responseCode = httpURLConnection.getResponseCode();
	       System.out.println(responseCode);
	       if (responseCode == 200) {
	         // 从服务器返回一个输入流
	         inputStream = httpURLConnection.getInputStream();
	         byte[] bs = new byte[1024];
	         // 读取到的数据长度
	         int len;
	         // 输出的文件流
	        File sf=new File(savePath);
	        if(!sf.exists()){
	         sf.mkdirs();
	        }
	        OutputStream os = new FileOutputStream(sf.getPath()+"\\"+filename);
	         // 开始读取
	         while ((len = inputStream.read(bs)) != -1) {
	           os.write(bs, 0, len);
	         }
	         System.out.println("wancheng");
	         // 完毕，关闭所有链接
	         os.close();
	         inputStream.close();
	       }

	     } catch (MalformedURLException e) {
	       // TODO Auto-generated catch block
	       e.printStackTrace();
	     } catch (IOException e) {
	       // TODO Auto-generated catch block
	       e.printStackTrace();
	     }

	 }
}
