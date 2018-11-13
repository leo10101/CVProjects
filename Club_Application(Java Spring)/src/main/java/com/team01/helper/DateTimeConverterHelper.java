package com.team01.helper;

import java.text.DateFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.StringTokenizer;

public abstract class DateTimeConverterHelper {
	//convert String to LocalTime compatible with SQL time format
	public static LocalTime convertStringToLocalTime(String input) {
		LocalTime output = null;
		if(input != null && input != "")
		{
		StringTokenizer inputST = new StringTokenizer(input, ":");
		String hour = inputST.nextToken();
		String minute = inputST.nextToken();

		DateTimeFormatter timeStringFormat = DateTimeFormatter.ofPattern("HH:mm:ss");

		output = output.parse(String.format("%s:%s:00", hour, minute), timeStringFormat);
		}
		return output;
	}
	
	//convert LocalTime to String - created due to changes in DB from SQLTime to varchar
	public static String convertLocalTimeToString(LocalTime input) {
		String output = null;
		if(input != null) output = input.toString().substring(0, 4);
		return output; //forces calling class to handle exception if null
	}

	//created to accommodate BookingController date format
	public static String convertDateToString(Date input) {
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		if(input != null) return formatter.format(input);
		else return null;
	}
	
	//convert LocalDate to String with the proper format for display on jsp
	public static String convertLocalDateToString(LocalDate input) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String stringDate = null;
		if(input != null) stringDate = input.format(formatter);
		return stringDate; //forces calling class to handle exception if null
	}
	
	//convert String to LocalDate to map it into Model that uses LocalDate
	public static LocalDate convertStringToLocalDate(String input) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate date;
		try {
		date = LocalDate.parse(input, formatter);
		}catch(Exception e) {
			date = null; //assign null if parse fails
		}
		return date;
	}
	
	//convert String to Date to map it into Model that uses Date
	public static Date convertStringToDate(String input) {
		LocalDate date = convertStringToLocalDate(input);
		if(date != null) return java.sql.Date.valueOf(date);
		else return null; //forces calling class to handle exception if null
	}
}
