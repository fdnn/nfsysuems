/*import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;

import net.sf.json.JSONObject;


public class Testjs {
	public static void main(String[] args) throws Exception {

		//第一步先读入js中所有的内容放到String中
		BufferedReader reader=new BufferedReader(new FileReader("C:\\Users\\小海\\Desktop\\load_hycode.js"));
		StringBuilder sb=new StringBuilder();
		String line=null;
		while((line=reader.readLine())!=null){
		//把换行符去掉
		  sb.append(line);
		}
		reader.close();
		//第二步把这个sb里面的真正的json内容拿到也就是从第一个"{"到最后一个"}"包括这两个{};
		//这个是我们要的
		String jsonString=sb.substring(sb.indexOf("["),sb.lastIndexOf("]")+1);
		//接下来给他转换成json-lib里的JSONObject对象
		JSONObject jo=JSONObject.fromObject(jsonString);
		//接下来你要获得那个属性就用jo.get(String key);
		jo.get("AutoId");
		//修改属性使用jo.accumulate(String key,Object value);
	}
}*/
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Testjs2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String JsonContext = new Util().ReadFile("C:\\Users\\小海\\Desktop\\load_hycode1.js");
		String jsonString=JsonContext.substring(JsonContext.indexOf("["),JsonContext.lastIndexOf("]")+1);
		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		JSONArray jsonArray2;
		JSONArray jsonArray3;
		int size = jsonArray.size();
		int sum=0;
		System.out.println("Size: " + size);
		for (int i = 0; i < size; i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			//System.out.println("(null,'" + jsonObject.get("CodeName") + "'),");
			jsonArray2 = JSONArray.fromObject(jsonObject.get("maxhycode"));
			for (int j = 0; j < jsonArray2.size(); j++) {
				JSONObject jsonObject2 = jsonArray2.getJSONObject(j);
				//System.out.println("(null,'" + jsonObject2.get("CodeName") + "',"+jsonObject.get("CodeValue")+"),");
				jsonArray3 = JSONArray.fromObject(jsonObject2.get("znhycdoe"));
				for (int k = 0; k < jsonArray3.size(); k++) {
					JSONObject jsonObject3 = jsonArray3.getJSONObject(k);//sum++;
					System.out.println("(null,'" + jsonObject3.get("CodeName") + "',"+jsonObject2.get("CodeValue")+"),");
				}
			}
		}//System.out.println(sum);
	}

}
