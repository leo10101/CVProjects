package toolBoxGUI;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;

import org.json.JSONException;
import org.json.JSONObject;

public class sqliteInterface {

	private static Connection connect(String url) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public static void createNewDatabase(String url) {

		try (Connection conn = DriverManager.getConnection(url)) {
			if (conn != null) {
				DatabaseMetaData meta = conn.getMetaData();
				System.out.println("The driver name is " + meta.getDriverName());
				System.out.println("A new database has been created.");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static void createNewTable(String url) {

		// SQL statement for creating a new table
		String sql = "CREATE TABLE IF NOT EXISTS liftData (lift_stationary text,"
				+ "alarm_bell text,under_maintenance text,acpower text,"
				+ "position text,door_moving text,error text,timestamp text)";

		try (Connection conn = DriverManager.getConnection(url); Statement stmt = conn.createStatement()) {
			// create a new table
			stmt.execute(sql);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static void jsonToSqlite(String url, String JSONFILENAME) throws SQLException, IOException {

		String[] keys = { "lift_stationary", "alarm_bell", "under_maintenance", "acpower", "position", "door_moving",
				"error", "timestamp" };
		Connection conn = DriverManager.getConnection(url);
		conn.setAutoCommit(false);

		String sql = "INSERT INTO liftData(lift_stationary,alarm_bell,under_maintenance,"
				+ "acpower,position,door_moving,error,timestamp) VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		BufferedReader br = new BufferedReader(new FileReader(JSONFILENAME));
		String sCurrentLine;
		while ((sCurrentLine = br.readLine()) != null) {
			try {
				JSONObject obj = new JSONObject(sCurrentLine);
				int num = 1;
				for (String key : keys) {
					pstmt.setString(num, obj.getString(key));
					num++;
				}
				pstmt.executeUpdate();
			} catch (JSONException e) {
			}
		}
		conn.commit();
		br.close();
	}

	public static void oneYearData(String url,int lines) throws SQLException, ParseException {
		// TODO Auto-generated method stub

		Connection conn = DriverManager.getConnection(url);
		conn.setAutoCommit(false);

		String sql = "INSERT INTO liftData(lift_stationary,alarm_bell,under_maintenance,"
				+ "acpower,position,door_moving,error,timestamp) VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		LocalDateTime t = LocalDateTime.of(2015, Month.JANUARY, 01, 01, 00);

		for (int i = 1; i < lines; i++) {

			pstmt.setInt(1, (int) Math.round(Math.random()));
			pstmt.setInt(2, (int) Math.round(Math.random()));
			pstmt.setInt(3, (int) Math.round(Math.random()));
			pstmt.setInt(4, (int) Math.round(Math.random()));
			pstmt.setString(5, "1,2,3,4");
			pstmt.setInt(6, (int) Math.round(Math.random()));
			pstmt.setString(7, "error");
			DateTimeFormatter f = DateTimeFormatter.ofPattern("yyyy MM dd  HH:mm:ss");
			String out = t.format(f);
			out = out.replace(" ", "");
			out = out.replace(":", "");
			// System.out.println(out);
			double result = Double.parseDouble(out);
			pstmt.setDouble(8, result);
			t = t.plusSeconds(1);
			pstmt.executeUpdate();
			// System.out.println(i);
		}
		conn.commit();
	}
	public static void oneYearDataWithId(String url,int lines) throws SQLException {
		
		Connection conn = DriverManager.getConnection(url);
		conn.setAutoCommit(false);

		String sql = "INSERT INTO liftData(id,lift_stationary,alarm_bell,under_maintenance,"
				+ "acpower,position,door_moving,error,timestamp) VALUES(?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		LocalDateTime t = LocalDateTime.of(2015, Month.JANUARY, 01, 01, 00);

		for (int i = 1; i <lines; i++) {
			
			pstmt.setInt(1, i);
			pstmt.setInt(2, (int) Math.round(Math.random()));
			pstmt.setInt(3, (int) Math.round(Math.random()));
			pstmt.setInt(4, (int) Math.round(Math.random()));
			pstmt.setInt(5, (int) Math.round(Math.random()));
			pstmt.setString(6, "1,2,3,4");
			pstmt.setInt(7, (int) Math.round(Math.random()));
			pstmt.setString(8, "error");
			DateTimeFormatter f = DateTimeFormatter.ofPattern("yyyy MM dd  HH:mm:ss");
			String out = t.format(f);
			out=out.replace(" ", "");
			out=out.replace(":", "");
			//System.out.println(out);
			double result=Double.parseDouble(out);
			pstmt.setDouble(9, result);
			t = t.plusSeconds(1);
			pstmt.executeUpdate();
			System.out.println(i);
		}
		conn.commit();
	}


	public static void selectIndividually(String url,String sql,String result) {
		
		try (Connection conn = sqliteInterface.connect(url);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			
			Writer bufferedWriter = null;
			Writer fileWriter = new FileWriter(result);
			bufferedWriter = new BufferedWriter(fileWriter);
			bufferedWriter.write("id"+"\t"+"lift_stationary"+ "\t"+"alarm_bell"+ "\t"+ "under_maintenance"+ "\t"+ "acpower"+ "\t"+ "position"+ "\t"+
					"door_moving"+ "\t"+ "error"+ "\t"+ "timestamp"+"\n");

			while (rs.next()) {
				String sCurrentLine = "";
				sCurrentLine += (rs.getInt("id") + "\t");
				sCurrentLine += (rs.getInt("lift_stationary") + "\t");
				sCurrentLine += (rs.getInt("alarm_bell") + "\t");
				sCurrentLine += (rs.getInt("under_maintenance") + "\t");
				sCurrentLine += (rs.getInt("acpower") + "\t");
				sCurrentLine += (rs.getString("position") + "\t");
				sCurrentLine += (rs.getInt("door_moving") + "\t");
				sCurrentLine += (rs.getString("error") + "\t");
				sCurrentLine += (rs.getInt("timestamp") + "\t");
				sCurrentLine += "\n";
				bufferedWriter.write(sCurrentLine);
			}
			if (bufferedWriter != null) {
				try {
					bufferedWriter.close();
				} catch (IOException e) {
					System.out.println("Problem occurs when closing file !");
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	public static void selectInLoop(String url,String sql,String result) {
		
		try (Connection conn = sqliteInterface.connect(url);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			// loop through the result set
			String[] keys = { "lift_stationary", "alarm_bell", "under_maintenance", "acpower", "position",
					"door_moving", "error", "timestamp" };
			
			Writer bufferedWriter = null;
			Writer fileWriter = new FileWriter(result);
			bufferedWriter = new BufferedWriter(fileWriter);
			bufferedWriter.write("lift_stationary"+ "\t"+"alarm_bell"+ "\t"+ "under_maintenance"+ "\t"+ "acpower"+ "\t"+ "position"+ "\t"+
					"door_moving"+ "\t"+ "error"+ "\t"+ "timestamp"+"\n");
			while (rs.next()) {
				String sCurrentLine = "";
				for (String key : keys) {
					sCurrentLine = sCurrentLine + rs.getString(key) + "\t";
				}
				sCurrentLine+="\n";
				bufferedWriter.write(sCurrentLine);
			}
			if (bufferedWriter != null) {
				try {
					bufferedWriter.close();
				} catch (IOException e) {
					System.out.println("Problem occurs when closing file !");
					e.printStackTrace();
				}
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
}
