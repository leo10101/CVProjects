package com.team01.jdbc.repositories;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.team01.jdbc.dao.DAO;


public class FacilityRepository {
	
	//prepared sql statement, actual injection is done in com.team01.jdbc.dao
	public static ArrayList<HashMap> findAll() throws ClassNotFoundException, SQLException{
		String sqlStt = "SELECT * FROM Facility ORDER BY FacilityId";
		return DAO.factoryCreate().Query(sqlStt);
	}
	
	public static ArrayList<HashMap> findByFacilityId(Integer facilityId) throws ClassNotFoundException, SQLException{
		String sqlStt = String.format("SELECT * FROM Facility WHERE FacilityId = %s", Integer.toString(facilityId));
		return DAO.factoryCreate().Query(sqlStt);
	}
	
}
