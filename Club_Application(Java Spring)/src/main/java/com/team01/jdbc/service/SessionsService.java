package com.team01.jdbc.service;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import com.team01.jdbc.mapper.SessionsMapper;
import com.team01.jdbc.repositories.SessionsRepository;
import com.team01.model.Sessions;

public class SessionsService {
/*	public static ArrayList<Sessions> findAllAvailableSessions(Integer facilityId, LocalDate bookingDate) throws ClassNotFoundException, SQLException{
		ArrayList<HashMap> sessionsHMList = SessionsRepository.findAvailableSessions(facilityId, bookingDate);
		return SessionsMapper.mapList(sessionsHMList);
	}*/
	
	//returns the ArrayList<Sessions> which contains the available sessions corresponding to the facility and booking date 
	public static ArrayList<Sessions> findAllAvailableSessions(Integer facilityId, String bookingDate) throws ClassNotFoundException, SQLException{
		ArrayList<HashMap> sessionsHMList = SessionsRepository.findAvailableSessions(facilityId, bookingDate);
		return SessionsMapper.mapList(sessionsHMList);
	}
}
