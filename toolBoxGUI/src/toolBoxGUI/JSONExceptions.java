package toolBoxGUI;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public class JSONExceptions {
	
	static String  errorPath="";
		
	public static void writeErrorfiles(String sCurrentLine) throws IOException {
		int lineNumber=JsonParser.getLineCounter();
		lineNumber++;
		JsonParser.setLineCounter(lineNumber);
		Writer bufferedWriterError = null;
		Writer fileWriterError = new FileWriter(errorPath,true);
		bufferedWriterError = new BufferedWriter(fileWriterError);
		bufferedWriterError.write(sCurrentLine + "\r\n" + "Above corrupted line is at line " + lineNumber
				+ "\r\n");
		if (bufferedWriterError != null) {
			try {
				bufferedWriterError.close();
			} catch (IOException e) {
				System.out.println("Problem occurs when closing file !");
				e.printStackTrace();
			}
		}

	}
}
