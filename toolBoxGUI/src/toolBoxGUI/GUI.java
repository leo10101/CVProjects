package toolBoxGUI;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.Toolkit;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDateTime;

import javax.swing.*;
import javax.swing.filechooser.FileSystemView;

import org.json.JSONException;

public class GUI extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static void main(String[] args) {
		setUIFont(new javax.swing.plaf.FontUIResource("Serif", Font.PLAIN, 25));
		new GUI();
	}

	public static void setUIFont(javax.swing.plaf.FontUIResource f) {
		@SuppressWarnings("rawtypes")
		java.util.Enumeration keys = UIManager.getDefaults().keys();
		while (keys.hasMoreElements()) {
			Object key = keys.nextElement();
			Object value = UIManager.get(key);
			if (value instanceof javax.swing.plaf.FontUIResource)
				UIManager.put(key, f);
		}
	}

	public GUI() {

		// Define the size of the frame

		this.setSize(1200, 700);
		JLabel label1 = new JLabel("Welcome! Choose the needed function in menu.", SwingConstants.CENTER);
		this.add(label1);

		// Opens the frame in the middle of the
		// screen---------------------------------------------------

		Toolkit tk = Toolkit.getDefaultToolkit();
		Dimension dim = tk.getScreenSize();
		int xPos = (dim.width / 2) - (this.getWidth() / 2);
		int yPos = (dim.height / 2) - (this.getHeight() / 2);
		this.setLocation(xPos, yPos);

		this.setResizable(false);

		// Define how the frame exits (Click the Close Button)

		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		// Define the title for the frame

		this.setTitle("Lift Data Toolbox");

		JMenuBar menubar = new JMenuBar();
		JMenu menu = new JMenu("Functions");
		JMenuItem JsonToCSV = new JMenuItem("JSON To CSV");
		JMenuItem JsonToSQLite = new JMenuItem("JSON To SQLite (All fields in String)");
		JMenuItem mockData = new JMenuItem("Mock Data (database preconfigured individually)");
		JMenuItem mockDataID = new JMenuItem("Mock Data with additional ID");
		JMenuItem queryAllString = new JMenuItem("Query all fields in String (no ID)");
		JMenuItem queryIndividually = new JMenuItem("Query fields Individually (with ID)");
		JMenuItem wrongTimeScanner = new JMenuItem("Wrong Time Scanner");

		menu.add(JsonToCSV);
		menu.add(JsonToSQLite);
		menu.add(mockData);
		menu.add(mockDataID);
		menu.add(queryAllString);
		menu.add(queryIndividually);
		menu.add(wrongTimeScanner);
		menubar.add(menu);
		this.setJMenuBar(menubar);

		JsonToCSV.addActionListener(ae -> {
			this.getContentPane().removeAll();
			JsonToCSV p1 = new JsonToCSV();
			this.add(p1);
			this.setVisible(true);
		});
		JsonToSQLite.addActionListener(ae -> {
			this.getContentPane().removeAll();
			JsonToSQLite p2 = new JsonToSQLite();
			this.add(p2);
			this.setVisible(true);
		});

		mockData.addActionListener(ae -> {
			this.getContentPane().removeAll();
			mockData p3 = new mockData();
			this.add(p3);
			this.setVisible(true);
		});
		mockDataID.addActionListener(ae -> {
			this.getContentPane().removeAll();
			mockDataID p4 = new mockDataID();
			this.add(p4);
			this.setVisible(true);
		});
		queryAllString.addActionListener(ae -> {
			this.getContentPane().removeAll();
			queryAllString p5 = new queryAllString();
			this.add(p5);
			this.setVisible(true);
		});
		queryIndividually.addActionListener(ae -> {
			this.getContentPane().removeAll();
			queryIndividually p6 = new queryIndividually();
			this.add(p6);
			this.setVisible(true);
		});
		wrongTimeScanner.addActionListener(ae -> {
			this.getContentPane().removeAll();
			wrongTimeScanner p7 = new wrongTimeScanner();
			this.add(p7);
			this.setVisible(true);
		});
		this.setVisible(true);
	}

}

class JsonToCSV extends JPanel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public JsonToCSV() {
		JLabel label1 = new JLabel("Seperator:");
		this.add(label1);
		JLabel label2 = new JLabel("");
		label2.setForeground(Color.red);

		JTextField textField1 = new JTextField(",", 2);
		textField1.setToolTipText("Please type the seperator here");
		this.add(textField1);

		JButton button1 = new JButton("Choose file");
		button1.setToolTipText("Please choose .log file with standard format");
		button1.addActionListener(ae -> {
			JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
			int returnValue = jfc.showOpenDialog(null);
			if (returnValue == JFileChooser.APPROVE_OPTION) {
				label2.setText("Processing");

				Thread t = new Thread(new Runnable() {
					public void run() {
						File selectedFile = jfc.getSelectedFile();
						String filePathIn = selectedFile.getAbsolutePath();
						String filePathOut = filePathIn.replace(".log", "R.csv");
						System.out.println(selectedFile.getAbsolutePath());
						try {
							JsonParser.JsonToCSV(filePathIn, filePathOut, textField1.getText());
						} catch (IOException e) {
							// TODO Auto-generated catch block
							JOptionPane.showMessageDialog(null, "IOException");
						}
						label2.setText("Complete");
					}
				});
				new Thread(t).start();
			}
		});
		this.add(button1);
		JButton button2 = new JButton("Choose folder");
		button2.setToolTipText("Only .log files with standard format are allowed in the folder!");
		button2.addActionListener(ae -> {
			JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
			jfc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
			int returnValue = jfc.showOpenDialog(null);
			// int returnValue = jfc.showSaveDialog(null);

			if (returnValue == JFileChooser.APPROVE_OPTION) {
				label2.setText("Processing");

				Thread t = new Thread(new Runnable() {
					public void run() {
						File folder = jfc.getSelectedFile();
						File[] listOfFiles = folder.listFiles();
						for (int i = 0; i < listOfFiles.length; i++) {
							String filePathIn = listOfFiles[i].toString();
							String filePathOut = filePathIn.replace(".log", "R.csv");
							// the output will be the original file name plus R
							try {
								JsonParser.JsonToCSV(filePathIn, filePathOut, textField1.getText());
								// supply the separator desired to last variable
							} catch (IOException e) {
								// TODO Auto-generated catch block
								JOptionPane.showMessageDialog(null, "IOException");
							}
						}
						label2.setText("Complete");
					}
				});
				new Thread(t).start();
			}
		});
		this.add(button2);

		this.add(label2);
	}
}

class JsonToSQLite extends JPanel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public JsonToSQLite() {
		JLabel label1 = new JLabel("Database saved destination:");
		this.add(label1);

		JLabel label2 = new JLabel("");
		label2.setForeground(Color.red);

		JTextField textField1 = new JTextField("jdbc:sqlite:D:/file.db", 15);
		textField1.setToolTipText("Please type in following format");
		this.add(textField1);

		JButton button1 = new JButton("Choose file");
		button1.setToolTipText("Please choose raw data file with standard format");
		button1.addActionListener(ae -> {
			JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
			int returnValue = jfc.showOpenDialog(null);
			if (returnValue == JFileChooser.APPROVE_OPTION) {
				label2.setText("Processing");

				Thread t = new Thread(new Runnable() {
					public void run() {
						String url = textField1.getText();
						File selectedFile = jfc.getSelectedFile();
						String JSONFILENAME = selectedFile.getAbsolutePath();
						sqliteInterface.createNewDatabase(url);
						sqliteInterface.createNewTable(url);
						try {
							sqliteInterface.jsonToSqlite(url, JSONFILENAME);
						} catch (SQLException e) {
							JOptionPane.showMessageDialog(null, "SqlException");
						} catch (IOException e) {
							JOptionPane.showMessageDialog(null, "IOException");
						}
						label2.setText("Complete");
					}
				});
				new Thread(t).start();
			}
		});
		this.add(button1);

		this.add(label2);
		
	}
}

class mockData extends JPanel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public mockData() {
		Box baseBox, V1, V2;
		baseBox = Box.createVerticalBox();
		V1 = Box.createVerticalBox();
		V2 = Box.createVerticalBox();

		JTextArea a = new JTextArea(
				"Please use Following schema: CREATE TABLE IF NOT EXISTS liftData (lift_stationary INTEGER,alarm_bell INTEGER,under_maintenance INTEGER,acpower INTEGER,position text,door_moving INTEGER,error text,timestamp INTEGER primary key)");
		a.setLineWrap(true);
		a.setWrapStyleWord(true);
		a.setEditable(false);
		this.add(a);
		JLabel label1 = new JLabel("Database location");
		this.add(label1);

		JLabel label2 = new JLabel("");
		label2.setForeground(Color.red);

		JTextField textField1 = new JTextField("jdbc:sqlite:D:/mock.db", 15);
		textField1.setToolTipText("Please type in following format");
		this.add(textField1);
		JLabel label3 = new JLabel("Number of lines");
		this.add(label3);
		JTextField textField2 = new JTextField("31536000", 15);
		textField2.setToolTipText("Please type in integers (each line is one second)");
		this.add(textField2);

		JButton button1 = new JButton("Create");
//		button1.setToolTipText("Please choose raw data file with standard format");
		button1.addActionListener(ae -> {
			label2.setText("Processing");

			Thread t = new Thread(new Runnable() {
				public void run() {
					String url = textField1.getText();
					int lines = Integer.parseInt(textField2.getText());

					try {
						sqliteInterface.oneYearData(url, lines);
					} catch (SQLException e) {
						JOptionPane.showMessageDialog(null, "SQLException");
					} catch (ParseException e) {
						JOptionPane.showMessageDialog(null, "ParseException");
					}
					label2.setText("Complete");
				}
			});
			new Thread(t).start();
		});
		this.add(button1);

		V1.add(label1);
		V1.add(textField1);
		V2.add(label3);
		V2.add(textField2);
		baseBox.add(a);
		baseBox.add(V1);
		baseBox.add(V2);
		baseBox.add(button1);
		baseBox.add(label2);
		setLayout(new FlowLayout());
		add(baseBox);
	}
}

class mockDataID extends JPanel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public mockDataID() {
		Box baseBox, V1, V2;
		baseBox = Box.createVerticalBox();
		V1 = Box.createVerticalBox();
		V2 = Box.createVerticalBox();

		JTextArea a = new JTextArea(
				"Please use Following schema: CREATE TABLE IF NOT EXISTS liftData (id INTEGER,lift_stationary INTEGER,alarm_bell INTEGER,under_maintenance INTEGER,acpower INTEGER,position text,door_moving INTEGER,error text,timestamp INTEGER primary key)");
		a.setLineWrap(true);
		a.setWrapStyleWord(true);
		a.setEditable(false);
		this.add(a);
		JLabel label1 = new JLabel("Database location");
		this.add(label1);
		JTextField textField1 = new JTextField("jdbc:sqlite:D:/mockID.db", 15);
		textField1.setToolTipText("Please type in following format");
		this.add(textField1);

		JLabel label2 = new JLabel("");
		label2.setForeground(Color.red);

		JLabel label3 = new JLabel("Number of lines");
		this.add(label3);
		JTextField textField2 = new JTextField("31536000", 15);
		textField2.setToolTipText("Please type in integers (each line is one second)");
		this.add(textField2);

		JButton button1 = new JButton("Create");
//		button1.setToolTipText("Please choose raw data file with standard format");
		button1.addActionListener(ae -> {
			label2.setText("Processing");

			Thread t = new Thread(new Runnable() {
				public void run() {
					String url = textField1.getText();
					int lines = Integer.parseInt(textField2.getText());

					try {
						sqliteInterface.oneYearDataWithId(url, lines);
					} catch (SQLException e) {
						JOptionPane.showMessageDialog(null, "SQLException");
					}
					label2.setText("Complete");
				}
			});
			new Thread(t).start();

		});
		this.add(button1);

		V1.add(label1);
		V1.add(textField1);
		V2.add(label3);
		V2.add(textField2);
		baseBox.add(a);
		baseBox.add(V1);
		baseBox.add(V2);
		baseBox.add(button1);
		baseBox.add(label2);
		setLayout(new FlowLayout());
		add(baseBox);

	}
}

class queryAllString extends JPanel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public queryAllString() {
		JLabel label1 = new JLabel("Database location");
		this.add(label1);
		JTextField textField1 = new JTextField("jdbc:sqlite:D:/file.db", 15);
		textField1.setToolTipText("Please type in following format");
		this.add(textField1);

		JLabel label3 = new JLabel("SQL query:");
		this.add(label3);
		JTextField textField2 = new JTextField("select * from liftData", 20);
		textField2.setToolTipText("Please type sql query for sqlite");
		this.add(textField2);

		JLabel label2 = new JLabel("");
		label2.setForeground(Color.red);
		
		JLabel label4 = new JLabel("with time used:");
		JLabel label5 = new JLabel("");
		
		JButton button1 = new JButton("Query");
		button1.addActionListener(ae -> {
			label2.setText("Processing");
			LocalDateTime t1 = LocalDateTime.now();
			Thread t = new Thread(new Runnable() {
				public void run() {					
					String url = textField1.getText();
					String sql = textField2.getText();
					String result = url.replaceAll("jdbc:sqlite:", "");
					result = result.replaceAll(".db", ".txt");
					sqliteInterface.selectInLoop(url, sql, result);
					label2.setText("Complete");
					LocalDateTime t2 = LocalDateTime.now();
					long diff = java.time.Duration.between(t1, t2).toMillis();
					label5.setText(Long.toString(diff)+"ms");
				}
			});
			new Thread(t).start();

		});
		this.add(button1);
		this.add(label2);
		
		this.add(label4);
		this.add(label5);
		
	}
}

class queryIndividually extends JPanel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public queryIndividually() {
		JLabel label1 = new JLabel("Database location");
		this.add(label1);
		JTextField textField1 = new JTextField("jdbc:sqlite:D:/mockID.db", 15);
		textField1.setToolTipText("Please type in following format");
		this.add(textField1);

		JLabel label3 = new JLabel("SQL query:");
		this.add(label3);
		JTextField textField2 = new JTextField("select * from liftData", 20);
		textField2.setToolTipText("Please type sql query for sqlite");
		this.add(textField2);

		JLabel label2 = new JLabel("");
		label2.setForeground(Color.red);
		
		JLabel label4 = new JLabel("with time used:");
		JLabel label5 = new JLabel("");

		JButton button1 = new JButton("Query");
		button1.addActionListener(ae -> {
			label2.setText("Processing");
			LocalDateTime t1 = LocalDateTime.now();

			Thread t = new Thread(new Runnable() {
				public void run() {
					String url = textField1.getText();
					String sql = textField2.getText();
					String result = url.replaceAll("jdbc:sqlite:", "");
					result = result.replaceAll(".db", ".txt");
					sqliteInterface.selectIndividually(url, sql, result);
					label2.setText("Complete");
					LocalDateTime t2 = LocalDateTime.now();
					long diff = java.time.Duration.between(t1, t2).toMillis();
					label5.setText(Long.toString(diff)+"ms");
				}
			});
			new Thread(t).start();

		});
		this.add(button1);
		this.add(label2);
		
		this.add(label4);
		this.add(label5);
	}
}

class wrongTimeScanner extends JPanel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public wrongTimeScanner() {
		JLabel label2 = new JLabel("");
		label2.setForeground(Color.red);

		JButton button1 = new JButton("Choose .log file");
		button1.setToolTipText("Please choose .log file in JSON format");
		button1.addActionListener(ae -> {
			
			JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
			int returnValue = jfc.showOpenDialog(null);
			if (returnValue == JFileChooser.APPROVE_OPTION) {
				label2.setText("Processing");
				Thread t = new Thread(new Runnable() {
					public void run() {
						File selectedFile = jfc.getSelectedFile();
						String filePathIn = selectedFile.getAbsolutePath();
						try {
							scanner.wrongTimeScanner(filePathIn);
						} catch (IOException | JSONException e) {
							// TODO Auto-generated catch block
							JOptionPane.showMessageDialog(null, "IOException");
						}
						label2.setText("Complete");
					}
				});
				new Thread(t).start();
			}
		});
		this.add(button1);
		this.add(label2);
	}
}