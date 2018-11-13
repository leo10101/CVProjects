package com.team01.repositories;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team01.model.Booking;
import com.team01.model.Member;

public interface BookingRepo extends JpaRepository<Booking, Integer> {
	@Query("SELECT c from Booking c WHERE c.facilityId = :eid")
	ArrayList<Booking> findCoursesByEID(@Param("eid") Integer eid);
	
	@Query(value = "SELECT DISTINCT u.BookingNo FROM Booking u", nativeQuery=true)
	 ArrayList<Booking> findAllBookingNo();
	
	

}
