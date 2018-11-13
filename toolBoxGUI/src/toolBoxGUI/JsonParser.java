package toolBoxGUI;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import org.json.JSONException;
import org.json.JSONObject;

public class JsonParser {

	static int lineCounter;

	public static int getLineCounter() {
		return lineCounter;
	}

	public static void setLineCounter(int LineCounter) {
		lineCounter = LineCounter;
	}

	public static void JsonToCSV(String filePathIn, String filePathOut, String Separator) throws IOException {
		lineCounter = 0;
		String separator = Separator;
		String[] keys = { "lift_stationary", "alarm_bell", "under_maintenance", "acpower", "position", "door_moving",
				"error", "timestamp" };

		Writer bufferedWriter = null;
		Writer fileWriter = new FileWriter(filePathOut);
		bufferedWriter = new BufferedWriter(fileWriter);
		String title = "";
		for (String key : keys) {
			title = title + key + separator;
		}
		title += "\n";
		bufferedWriter.write(title);
		BufferedReader br = new BufferedReader(new FileReader(filePathIn));
		String sCurrentLine;

		while ((sCurrentLine = br.readLine()) != null) {
			try {
				lineCounter++;
				JSONObject obj = new JSONObject(sCurrentLine);
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
				bufferedWriter.write(outLine);
			} catch (JSONException e) {
				String filePathError = filePathOut.replace("R.csv", "E.txt");
				// the error file name will be the original file name plus E
				JSONExceptions.errorPath = filePathError;
				JSONExceptions.writeErrorfiles(sCurrentLine);
			}
		}
		br.close();
		// Closing the files
		if (bufferedWriter != null) {
			try {
				bufferedWriter.close();
			} catch (IOException e) {
				System.out.println("Problem occurs when closing file !");
				e.printStackTrace();
			}
		}

	}
}
