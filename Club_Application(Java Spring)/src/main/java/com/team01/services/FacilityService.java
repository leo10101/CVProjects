package com.team01.services;

import java.util.ArrayList;

import org.springframework.data.repository.query.Param;

import com.team01.model.Facility;


public interface FacilityService {
	ArrayList<Facility> findAllFacility();

	Facility findFacility(Integer flNo);

	Facility createFacility(Facility facility);
	Facility changeFacility(Facility facility);

	void removeFacility(Facility facility);
	ArrayList<String> findAllFacilityNames();
	
	Facility updateFacility(Facility facility);
	Facility findfacilityNamesByEID(@Param("eid") Integer eid);
	
	
	
	
	
	

}
