package com.team01.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public class AvailableSessions {
	private HashMap<Facility, ArrayList<Sessions>> facilityAvailableSessions;
	private Date bookingDate;
	
	public HashMap<Facility, ArrayList<Sessions>> getFacilityAvailableSessions() {
		return facilityAvailableSessions;
	}
	public void setFacilityAvailableSessions(HashMap<Facility, ArrayList<Sessions>> facilityAvailableSessions) {
		this.facilityAvailableSessions = facilityAvailableSessions;
	}
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	
	
}
