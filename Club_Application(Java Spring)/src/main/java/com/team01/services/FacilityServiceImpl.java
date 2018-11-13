package com.team01.services;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.model.Facility;
import com.team01.repositories.FacilityRepo;
@Component
@Service
public class FacilityServiceImpl implements FacilityService {
@Resource
private FacilityRepo facilityRepo;
@Override
public ArrayList<Facility> findAllFacility() {
	ArrayList<Facility> l = (ArrayList<Facility>) facilityRepo.findAll();
	return l;
}

@Override
public Facility findFacility(Integer flNo) {
	return facilityRepo.findOne(flNo);
}

@Override
public Facility createFacility(Facility facility) {
	return facilityRepo.saveAndFlush(facility);
}

@Override
public Facility changeFacility(Facility facility) {
	return facilityRepo.saveAndFlush(facility);
}

@Override
public void removeFacility(Facility facility) {
	facilityRepo.delete(facility);

}

@Override	
public ArrayList<String> findAllFacilityNames(){
	return facilityRepo.findAllFacilityNames();
	
	
};


	@Override
	public Facility updateFacility(Facility facility) {
		return facilityRepo.save(facility);
	};
	
	
	@Override
	public Facility findfacilityNamesByEID(Integer eid){
		return facilityRepo.findfacilityNamesByEID(eid);
			};

}
