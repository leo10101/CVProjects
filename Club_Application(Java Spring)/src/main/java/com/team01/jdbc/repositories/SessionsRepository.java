package com.team01.jdbc.repositories;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import com.team01.helper.DateTimeConverterHelper;
import com.team01.jdbc.dao.DAO;

//prepared sql statement, actual injection is done in com.team01.jdbc.dao
public class SessionsRepository {
	public static ArrayList<HashMap> findAvailableSessions(Integer facilityId, String bookingDate) throws ClassNotFoundException, SQLException{	
		//This condition have to be met to find available sessions pertaining to the particular facility and booking date
		//- Sessions found on that booking date with count > CapPerSession from facility table IS NOT available
		//- CapPerSession defines the maximum number of bookings per session
		String sqlStt = String.format("SELECT * FROM Sessions "
				+ "WHERE SessionNo NOT IN(SELECT DISTINCT SessionNo "
				+ "FROM Booking WHERE FacilityId = '%s' "
				+ "AND BookingDate = '%s' "
				+ "GROUP BY SessionNo "
				+ "HAVING (SELECT COUNT(SessionNo) FROM Booking  WHERE FacilityId = '%s') "
				+ ">= (SELECT CapPerSession FROM Facility WHERE FacilityId = '%s')) ", facilityId, bookingDate, facilityId, facilityId);
		
		return DAO.factoryCreate().Query(sqlStt);		
	}
}
