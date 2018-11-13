package com.team01.cab;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team01.jdbc.service.MemberService;
import com.team01.model.Member;



/**
 * Handles requests for the application home page.
 */
@Controller

public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
	
	String page = "home";
	if(session.getAttribute("roleId") != null) {
		if((Integer)session.getAttribute("roleId") == 0) page = "adminWelcome";
	}
	return page;
	}
	
	@RequestMapping(value = "/userProfile", method = RequestMethod.GET)
	public ModelAndView userPage() {
		ModelAndView mav = new ModelAndView("home", "member", new Member());
		return mav;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("login", "member", new Member());
		return mav;
	}
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/memberlogin", method = RequestMethod.POST)
	public ModelAndView authenticateLogin(@RequestParam("memberNo") Integer userId, @RequestParam("password") String password, Model model, HttpSession session) throws ClassNotFoundException, SQLException{
		Member member = MemberService.findByUserIdAndPassword(userId, password);
		ModelAndView mv;
		if(member == null) {
			mv = new ModelAndView("login");
			mv.addObject("invalidloginmessage", "Username and password do not match, please try again.");
		}
		else if(member.getRoleId() == 0) {
			mv = new ModelAndView("redirect:/adminHome");
			session.setAttribute("roleId", member.getRoleId());
			session.setAttribute("memberNo", member.getMemberNo());
			session.setAttribute("memberName", member.getMemberName());
		}
		else {
			mv = new ModelAndView("redirect:/");
			session.setAttribute("roleId", member.getRoleId());
			session.setAttribute("memberNo", member.getMemberNo());
			session.setAttribute("memberName", member.getMemberName());
		}
		return mv;
	}
	
	@RequestMapping(value = "/adminHome", method = RequestMethod.GET)
	public ModelAndView adminPage() {
		ModelAndView mav = new ModelAndView("adminWelcome", "member", new Member());
		return mav;
	}
	
}
