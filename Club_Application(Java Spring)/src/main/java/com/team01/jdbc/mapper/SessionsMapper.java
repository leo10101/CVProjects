package com.team01.jdbc.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.team01.helper.DateTimeConverterHelper;
import com.team01.model.Sessions;

public class SessionsMapper {
/*	public static Sessions map(HashMap sessionsMap) {
		Sessions sessions = new Sessions();
		sessions.setSessionNo((Integer)sessionsMap.get("SessionNo"));
		sessions.setStartTime(DateTimeConverterHelper.convertStringToLocalTime(sessionsMap.get("StartTime").toString()));
		sessions.setEndTime(DateTimeConverterHelper.convertStringToLocalTime(sessionsMap.get("EndTime").toString()));
		return sessions;
	}*/
	
	//this mapper uses the format return by the repository which gets its data in ArrayList<HashMap> from the DAO class
	//maps the HashMap to the Session model and returns the instantiated and mapped model
	public static Sessions map(HashMap sessionsMap) {
		Sessions sessions = new Sessions();
		sessions.setSessionNo((Integer)sessionsMap.get("SessionNo"));
		sessions.setStartTime((String)sessionsMap.get("StartTime"));
		sessions.setEndTime((String)sessionsMap.get("EndTime"));
		return sessions;
	}
	
	//adds the session returned by the above method to a list
	public static ArrayList<Sessions> mapList(ArrayList<HashMap> sessionsMapList){
		ArrayList<Sessions> sessionsList = new ArrayList<Sessions>();
		for(int i = 0; i < sessionsMapList.size(); i++) {
			sessionsList.add(map(sessionsMapList.get(i)));
		}
		return sessionsList;	
	}
}
