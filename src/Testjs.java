import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Testjs {

	@SuppressWarnings("null")
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		String JsonContext = new Util().ReadFile("C:\\Users\\小海\\Desktop\\load_hycode.js");
		String jsonString=JsonContext.substring(JsonContext.indexOf("["),JsonContext.lastIndexOf("]")+1);
		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		JSONArray jsonArray2;
		JSONArray jsonArray3;
		
		int size = jsonArray.size();
		JSONObject jsonObjectS = new JSONObject();
		JSONArray jsonArrayS = new JSONArray();

		JSONObject jsonObjectS2 = new JSONObject();
		JSONArray jsonArrayS2 = new JSONArray();

		JSONObject jsonObjectS3 = new JSONObject();
		JSONArray jsonArrayS3 = new JSONArray();
		System.out.println("Size: " + size);
		int ss1=1;
		int ss2=1;
		int ss3=1;
		for (int i = 0; i < size; i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			//System.out.println("[" + i + "]CodeValue=" + jsonObject.get("maxhycode"));
			jsonArray2 = JSONArray.fromObject(jsonObject.get("maxhycode"));
			jsonArrayS2.clear();
			for (int j = 0; j < jsonArray2.size(); j++) {
				JSONObject jsonObject2 = jsonArray2.getJSONObject(j);
				//System.out.println(jsonObject2.get("CodeValue")+":"+jsonObject2.get("CodeName"));
				jsonArray3 = JSONArray.fromObject(jsonObject2.get("znhycdoe"));
				jsonArrayS3.clear();
				for (int k = 0; k < jsonArray3.size(); k++) {
					JSONObject jsonObject3 = jsonArray3.getJSONObject(k);
					//System.out.println(jsonObject3.get("CodeValue")+":"+jsonObject3.get("CodeName"));
					jsonObjectS3.put("CodeValue", ss3+k);
					jsonObjectS3.put("CodeName", jsonObject3.get("CodeName"));
					jsonArrayS3.add(jsonObjectS3);
				}
				ss3+=jsonArray3.size();
				jsonObjectS2.put("CodeValue", ss2+j);
				jsonObjectS2.put("CodeName", jsonObject2.get("CodeName"));
				jsonObjectS2.put("znhycdoe", jsonArrayS3);
				jsonArrayS2.add(jsonObjectS2);
			}
			ss2+=jsonArray2.size();
			jsonObjectS.put("CodeValue", ss1++);
			jsonObjectS.put("CodeName", jsonObject.get("CodeName"));
			jsonObjectS.put("maxhycode", jsonArrayS2);
			jsonArrayS.add(jsonObjectS);
		}
		/*FileWriter writer=new FileWriter("C:\\Users\\小海\\Desktop\\load_hycode1.js");*/
		OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream("C:\\Users\\小海\\Desktop\\load_hycode1.js"),"UTF-8");
		out.write("var znhycode = "+jsonArrayS.toString());
		System.out.println("OK");
		out.flush();
		out.close();
	}

}
