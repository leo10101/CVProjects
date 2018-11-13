package com.team01.jdbc.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.team01.jdbc.mapper.FacilityMapper;
import com.team01.jdbc.repositories.FacilityRepository;
import com.team01.model.Facility;

public class FacilityService {
	//returns the ArrayList<Facility> which contains all facility in the facility table
	public static ArrayList<Facility> findAll() throws ClassNotFoundException, SQLException{
		ArrayList<HashMap> facilityHMList = FacilityRepository.findAll();
		return FacilityMapper.mapList(facilityHMList);
	}
	
	//returns the Facility which correspond to the facilityId
	public static Facility findByFacilityId(Integer facilityId) throws ClassNotFoundException, SQLException{
		ArrayList<HashMap> facilityHMList = FacilityRepository.findByFacilityId(facilityId);
		if(facilityHMList.size()>0) {
			return FacilityMapper.map(facilityHMList.get(0));
		}
		else return null;		
	}
}
