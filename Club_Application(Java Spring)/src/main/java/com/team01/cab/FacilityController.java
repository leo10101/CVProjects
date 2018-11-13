package com.team01.cab;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team01.model.Facility;
import com.team01.services.FacilityService;


@Controller
@RequestMapping(value="/user")

public class FacilityController {
	
	@Autowired
	private FacilityService fs;
	
	@RequestMapping(value = "/facility", method = RequestMethod.GET)
	public String fHome(Locale locale, Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "facility";
		
}
	
	
	//----------------------------------------------------------------------------------------------
	@RequestMapping(value="/list")
	public ModelAndView list() {
		
		ModelAndView mav= new ModelAndView("FacilityList");
		ArrayList<Facility> faclist=fs.findAllFacility();
		System.out.println("total size"+faclist.size());
		mav.addObject("faclist", faclist);
		
		return mav;
		
	}
	

	@RequestMapping(value="/new", method=RequestMethod.GET)
	public ModelAndView NewFacility() {
		
		ModelAndView mav = new ModelAndView("NewFacility","Facility", new Facility());
		
	//	mav.setViewName("redirect:/admin/list");
		
		return mav;
	}
	
	

	@RequestMapping(value="/new", method=RequestMethod.POST)
	public ModelAndView CreateFacility(@ModelAttribute Facility facility,
			final RedirectAttributes redirectAttributes) {
		
		ModelAndView mav= new ModelAndView();
		fs.createFacility(facility);
		
		
	    int mess=facility.getFacilityId();
		System.out.println("hello"+mess);
		redirectAttributes.addFlashAttribute("mess",mess);
		mav.setViewName("redirect:/user/list");
		
		return mav;
		
	}
	
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(@PathVariable Integer id,final RedirectAttributes redirectAttributes)
	{
		ModelAndView mav = new ModelAndView("redirect:/user/list");
		Facility facility = fs.findFacility(id);
		fs.removeFacility(facility);
		String message = "The facility " + facility.getFacilityId() + " was successfully deleted.";
		redirectAttributes.addFlashAttribute("message", message);
		
		return mav;
	} 
	

	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editUserPage(@PathVariable Integer id) {
		ModelAndView mav = new ModelAndView("FacilityEditnDelete");
		Facility facility = fs.findFacility(id);
		
		mav.addObject("Facility", facility);
		
		
		return mav;
	
	}
	
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public ModelAndView editStudent(@ModelAttribute @Valid Facility facility, @PathVariable String id,
			 final RedirectAttributes redirectAttributes)  {
		fs.updateFacility(facility);
		ModelAndView mav = new ModelAndView("redirect:/user/list");
	    return mav;
	}
}