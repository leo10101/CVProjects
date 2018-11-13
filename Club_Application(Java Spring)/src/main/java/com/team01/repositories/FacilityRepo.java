package com.team01.repositories;


import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team01.model.Booking;
import com.team01.model.Facility;

public interface FacilityRepo extends JpaRepository<Facility , Integer> {
	@Query("SELECT f.facilityName FROM Facility f ")
	ArrayList<String> findAllFacilityNames();
	
	@Query("SELECT c from Facility c WHERE c.facilityId = :eid")
	Facility findfacilityNamesByEID(@Param("eid") Integer eid);
}
