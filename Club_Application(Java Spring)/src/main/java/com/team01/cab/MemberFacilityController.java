package com.team01.cab;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.Instant;
import java.util.ArrayList;

import java.util.Date;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.team01.model.AvailableSessions;
import com.team01.model.Facility;
import com.team01.model.Sessions;
import com.team01.helper.DateTimeConverterHelper;
import com.team01.jdbc.service.FacilityService;
import com.team01.jdbc.service.SessionsService;

/**
 * Handles requests for the application member facility page.
 */

@Controller
public class MemberFacilityController {
	//The very first instance when directing to facility/facilitypage uri
	//Only facilities model(arraylist of facility) will be added at this point
	//Facility in facilities will be displayed in memberfacilitypage using a foreach
	@RequestMapping(value = "/facility/facilitypage", method = RequestMethod.GET)
	public ModelAndView facilityPage(Model model) throws ClassNotFoundException, SQLException {
		ArrayList<Facility> facilities = FacilityService.findAll();
		model.addAttribute("facilities", facilities);
		ModelAndView mv = new ModelAndView("memberfacility");
		mv.addObject(model);
		return mv;
	}
	
	//This part of the controller will be called when bookingDate is inputted and corresponding search button is clicked
	//bookingDate and facilityId is passed from the view via a post method and will be used to query the available sessions for each facility
	//Available sessions are sessions that are not in the booking table with count greater than or equal to the CapPerSession as specified in the facility table
	//A HashMap<Facility, ArrayList<Sessions> will be returned whereby it contains a hashmap corresponding to the facility and its arraylist of available sessions	
	@RequestMapping(value = "/facility/facilitypage", method = RequestMethod.POST)
	public ModelAndView facilitySessionsPage(Model model, @RequestParam("bookingDate") String bookingDate) throws ClassNotFoundException, SQLException {
		ArrayList<Facility> facilities = FacilityService.findAll();
		//String test = bookingDate;
		
		//ArrayList<ArrayList<Sessions>> availableSessionsList = new ArrayList<ArrayList<Sessions>>();
		AvailableSessions facilityAvailableSessions = new AvailableSessions();
		facilityAvailableSessions.setFacilityAvailableSessions(new HashMap<Facility, ArrayList<Sessions>>());
		
		
		for(int i = 0; i<facilities.size(); i++) {
			ArrayList<Sessions> availableSessions = SessionsService.findAllAvailableSessions(facilities.get(i).getFacilityId(), bookingDate);
			facilityAvailableSessions.getFacilityAvailableSessions().put(facilities.get(i), availableSessions);
		}
		
		//returns null if bookingDate is null, refer to com.team01.helperlogic.DateTimeConvertHelper class
		//bookingDate will be null, if request param is either null or invalid to be converted to date
		Date bDate = DateTimeConverterHelper.convertStringToDate(bookingDate); 
		facilityAvailableSessions.setBookingDate(bDate);
		
		//if bDate is null, a null-flag will be passed to the view
		//this nullflag will enable the view to take corrective action such as display error message
		if(bDate == null) model.addAttribute("nullflag", "nullflag");
		
		else if(bDate.compareTo(new Date()) < 0) model.addAttribute("timetravellerflag", "timetravellerflag");
		
		
		model.addAttribute("facilities", facilities);
		model.addAttribute("availableSessions", facilityAvailableSessions);
		model.addAttribute("bookingDate", DateTimeConverterHelper.convertDateToString(bDate));
		ModelAndView mv = new ModelAndView("memberfacility");
		mv.addObject(model);
		return mv;
	}
	
	//to test if the required parameters, can be passed and accommodate to the booking controller's method requirement
	@RequestMapping(value = "/facility/booking", method = RequestMethod.POST)
	public ModelAndView forwardToBooking(@RequestParam("facilityId") Integer facilityId,
			@RequestParam("bookingDate") String bookingDate, Model model) throws ClassNotFoundException, SQLException {

		ModelAndView mv = new ModelAndView("testpage");
		model.addAttribute("bookingDate", bookingDate);
		model.addAttribute("facilityId", facilityId);
		return mv;
	}

}
