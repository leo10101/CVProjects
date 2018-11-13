package com.team01.jdbc.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.team01.model.Facility;

public class FacilityMapper {
	private FacilityMapper() {}
	
	//this mapper uses the format return by the repository which gets its data in ArrayList<HashMap> from the DAO class
	//maps the HashMap to the Facility model and returns the instantiated and mapped model
	public static Facility map(HashMap facilityMap) {
		Facility facility = new Facility();
		facility.setFacilityId((Integer)facilityMap.get("FacilityId"));
		facility.setFacilityName((String)facilityMap.get("FacilityName"));
		facility.setFacilityDescription((String)facilityMap.get("FacilityDescription"));
		facility.setLocation((String)facilityMap.get("Location"));
		facility.setCapPerSession((Integer)facilityMap.get("CapPerSession"));
		return facility;
	}
	
	//adds the facility returned by the above method to a list
	public static ArrayList<Facility> mapList(ArrayList<HashMap> facilityMapList){
		ArrayList<Facility> facilityList = new ArrayList<Facility>();
		for(int i = 0; i < facilityMapList.size(); i++) {
			facilityList.add(map(facilityMapList.get(i)));
		}
		return facilityList;	
	}
}
