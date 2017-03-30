import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Util {

	public String ReadFile(String Path) {
		BufferedReader reader = null;
		String laststr = "";
		try {
			FileInputStream fileInputStream = new FileInputStream(Path);
			InputStreamReader inputStreamReader = new InputStreamReader(
					fileInputStream, "UTF-8");
			reader = new BufferedReader(inputStreamReader);
			String tempString = null;
			while ((tempString = reader.readLine()) != null) {
				laststr += tempString;
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return laststr;
	}
	public static void main(String[] args) {
        String string = "<span class=\"123class\">1991-12-02</span></div><span class=\"123class\">12312341243</span></div>";
        Pattern pattern = Pattern.compile("s\">([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))<");//Æ¥Åähtml×Ö·û
        Matcher matcher = pattern.matcher(string);
        if (matcher.find()) {
            matcher.reset();
            while (matcher.find()) {//ÕÒµ½Æ¥ÅäµÄ×Ö·û´®
                System.out.println("hit: " + matcher.group(1));
            }
        } else {
            System.out.println("[ERROR] NOT FOUND!");
        }
        
	}
}