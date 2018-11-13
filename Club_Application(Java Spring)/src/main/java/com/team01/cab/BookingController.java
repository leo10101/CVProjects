package com.team01.cab;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team01.model.Booking;
import com.team01.model.Facility;
import com.team01.model.Member;
import com.team01.model.Sessions;

import com.team01.services.BookingService;
import com.team01.services.FacilityService;
import com.team01.services.MemberService;
import com.team01.services.SessionService;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/booking")
@ComponentScan(basePackages = "com.team01.services")
public class BookingController {
	@Autowired
	private FacilityService fservice;
	@Autowired
	private BookingService bservice;
	@Autowired
	private SessionService sservice;
	@Autowired
	private MemberService mservice;
	@InitBinder("booking")
	private void initCourseBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		dateFormat.setLenient(false);
	}
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView employeeListPage(HttpServletRequest req) {	
		HttpSession session = req.getSession();
		Integer value = (Integer)session.getAttribute("memberNo");
		
		if(value == null) {
			return new ModelAndView("redirect:/login");
		}
		ModelAndView mav = new ModelAndView("searchbooking", "booking", new Booking());
		List<Facility> facilityList = fservice.findAllFacility();
		mav.addObject(facilityList);
		return mav;
	}
		
	@RequestMapping(value = "/choose", method = RequestMethod.POST)
	public ModelAndView newBookingPage(HttpServletRequest req ,@ModelAttribute Booking booking, BindingResult result,
			final RedirectAttributes redirectAttributes, @RequestParam("facilityId") int facilityId,
			@RequestParam("bookingDate")@DateTimeFormat(pattern = "MM/dd/yyyy") Date bDate) {
		HttpSession session = req.getSession();
		Integer value = (Integer)session.getAttribute("memberNo");
		
		if(value == null) {
			return new ModelAndView("redirect:/login");
		}
		ModelAndView mav = new ModelAndView("choosebooking", "facility", new Facility());
		int selectedFId = facilityId;
		mav.addObject("value", value);
		mav.addObject("booking", booking);
		mav.addObject("selectedFId", selectedFId);
		mav.addObject("bookingDate", bDate);
		Facility fac = fservice.findfacilityNamesByEID(facilityId);
		mav.addObject("facility" , fac );
		ArrayList<Sessions> availableSessionList = new ArrayList<>();
		ArrayList<Integer> searchAllSessions = new ArrayList<Integer>();
		ArrayList<Integer> searchAllSessions1 = new ArrayList<Integer>();
		ArrayList<Sessions> sessionList = sservice.findAll();
		for (Sessions searchAllSession : sessionList) {
			searchAllSessions1.add(searchAllSession.getSessionNo());
		}
		ArrayList<Booking> searchDate = bservice.findCoursesByEID(selectedFId);
		for (Booking bd : searchDate) {
			if (bDate.equals(bd.getBookingDate())) {
				searchAllSessions.add(bd.getSessionNo());
			}
		}				
		if (searchAllSessions.size() == 0) {
			for ( Sessions s : sessionList ) {
			
			availableSessionList.add(s);
			}
		}		
		else {		
		for (int q = 0 ; q < searchAllSessions1.size(); q++) {
			boolean e = false;
			
			for (int j = 0 ; j < searchAllSessions.size(); j++) {
				if (searchAllSessions1.get(q) == searchAllSessions.get(j)) {
					e = true;					
				}		
			}
			if (e == false) {
				int l = (searchAllSessions1.get(q));
				availableSessionList.add(sservice.findSessions(l));
			}		
		}
		}
		mav.addObject("availableSessionList", availableSessionList);
		return mav;
	}
	@RequestMapping(value = "/summary", method = RequestMethod.POST)
		public ModelAndView createBooking1(@ModelAttribute @Valid Booking booking, BindingResult result,
				final RedirectAttributes redirectAttributes, @RequestParam("facilityId") int facilityId)
 {
			if (result.hasErrors())
				return new ModelAndView("choosebooking");
			bservice.createBooking(booking);
			
			Facility f = fservice.findFacility(booking.getFacilityId());
			Sessions s = sservice.findSessions(booking.getSessionNo());
			Member m = mservice.findMember(booking.getMemberNo());
			ModelAndView mav = new ModelAndView("bookingsummary", "booking", booking);									
			mav.addObject("fname", f.getFacilityName());
			mav.addObject("sTime", s.getStartTime());
			mav.addObject("eTime", s.getEndTime());
			mav.addObject("mName", m.getMemberName());
			return mav;
		}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView bookingListPage() {
		ModelAndView mav = new ModelAndView("bookingDetail");
		ArrayList<Booking> bookingList = bservice.findAllBooking();
		mav.addObject("bookingList",bookingList);
		return mav;
	}
		
	}









