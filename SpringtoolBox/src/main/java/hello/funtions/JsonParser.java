package hello.funtions;


import java.io.BufferedReader;
import java.io.ByteArrayInputStream;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;

public class JsonParser {

	static int lineCounter;

	public static int getLineCounter() {
		return lineCounter;
	}

	public static void setLineCounter(int LineCounter) {
		lineCounter = LineCounter;
	}

	public static InputStream JsonToCSV(InputStream inputStream) throws IOException {
		System.out.print("start   ");
		lineCounter = 0;
		String output="";
		String separator =",";
		String[] keys = { "lift_stationary", "alarm_bell", "under_maintenance", "acpower", "position", "door_moving",
				"error", "timestamp" };
		String title = "";
		for (String key : keys) {
			title = title + key + separator;
		}
		title += "\n";
		output+=title;
		System.out.print("before read file   ");
		BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
		System.out.print("after read file   ");
		String sCurrentLine;
		System.out.print("before loop   ");
		while ((sCurrentLine = br.readLine()) != null) {
			System.out.print(sCurrentLine);
			try {
				lineCounter++;
				JSONObject obj = new JSONObject(sCurrentLine);
				System.out.println(obj.toString());
				System.out.println(obj.getString("lift_stationary"));
				String outLine = "";
				for (String key : keys) {
					if (key == "position" && separator == ",") {
						outLine = outLine + "\"" + obj.getString(key) + "\"" + separator;
					} else {
						outLine = outLine + obj.getString(key) + separator;
					}

				}
				outLine += "\n";
				System.out.println(outLine);
				output+=outLine;
			} catch (JSONException e) {
				System.out.print("JSONexception");

			}
		}
		System.out.print("after loop   ");
		br.close();
		System.out.print(output);
		InputStream stream = new ByteArrayInputStream(output.getBytes(StandardCharsets.UTF_8));
		return stream;

	}
}
