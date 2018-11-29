package hello.funtions;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Writer;
import java.nio.charset.StandardCharsets;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;

public class scanner {

	static int lineCounter;

	public static InputStream wrongTimeScanner(MultipartFile  file) throws IOException, JSONException {
		lineCounter = 0;
		String[] keys = { "lift_stationary", "alarm_bell", "under_maintenance", "acpower","door_moving", "position", "timestamp" };
		
		String output="";
		BufferedReader br = new BufferedReader(new InputStreamReader(file.getInputStream()));
		JSONObject obj = new JSONObject(br.readLine());
		output="Scanner result for date "+obj.getString("timestamp").substring(0,11)+"\n";
// csv format:
//		bufferedWriter.write("Abnormal timestamps with line number appear in following locations:"+"\n");
//		bufferedWriter.write("LS"+ ","+"AB"+ ","+ "UM"+ ","+ "AC"+ ","+ "position"+","+"DM"+","+
//				"ER"+ ","+ "timestamp"+","+"LineNum"+"\n");
//		String sPreviousData= "",sCurrentData,sCurrentLine,outLine, preTime = "", nowTime;
//		while ((sCurrentLine = br.readLine()) != null) {
//			try {
//				sCurrentData="";
//				lineCounter++;
//				JSONObject obj = new JSONObject(sCurrentLine);
//				for (String key : keys) {
//					if(key=="position")
//					{
//						sCurrentData = sCurrentData + "\""+obj.getString(key) +"\""+ ",";
//					}
//					else {
//						sCurrentData = sCurrentData + obj.getString(key) + ",";
//					}
//					
//				}
//				nowTime = obj.getString("timestamp");
//				if(scanner.compare(preTime, nowTime)) 
//				{
//					int j=lineCounter-1;					
//					outLine = sPreviousData+j+"\n"+sCurrentData+lineCounter+"\n";
//					bufferedWriter.write(outLine);	
//				}
//				preTime = nowTime;
//				sPreviousData=sCurrentData;
//			} catch (JSONException e) {
//			}
//		}		
				
		BufferedReader br2 = new BufferedReader(new InputStreamReader(file.getInputStream()));
		output+="Abnormal timestamps with line number appear in following locations:"+"\n";
		output+="LS"+ " "+"AB"+ " "+ "UM"+ " "+ "AC"+ " "+ "DM"+" "+"position          "+
				 " "+ "timestamp     "+"LineNum  "+"ERR"+"\n";
		String sPreviousData= "",sCurrentData,sCurrentLine,outLine, preTime = "", nowTime,nowErr,preErr="";
		while ((sCurrentLine = br2.readLine()) != null) {
			
			try {
				sCurrentData="";
				lineCounter++;
				JSONObject obj2 = new JSONObject(sCurrentLine);
				nowErr=obj2.getString("error");
				for (String key : keys) {
										
					if(key=="timestamp")
					{
						sCurrentData = sCurrentData + obj2.getString(key).substring(11,23) + "  ";
					}
					else
					{
						sCurrentData = sCurrentData + obj2.getString(key) + "  ";
					}
					
				}
				nowTime = obj2.getString("timestamp");
				if(scanner.compare(preTime, nowTime)) 
				{
					int j=lineCounter-1;					
					outLine = sPreviousData+j+"       "+preErr+"\n"+sCurrentData+lineCounter+"       "+nowErr+"\n";
					output+=outLine;	
				}
				preTime = nowTime;
				sPreviousData=sCurrentData;
				preErr=nowErr;
			} catch (JSONException e) {
			}
		}
		br.close();
		br2.close();
		InputStream stream = new ByteArrayInputStream(output.getBytes(StandardCharsets.UTF_8));
		return stream;


	}
	public static boolean compare(String p1, String p2) {
		int result = p1.compareTo(p2);
		if (result > 0)
			return true;
		else
			return false;
	}
}
