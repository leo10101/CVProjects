package com.team01.cab;

import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team01.model.Member;
import com.team01.services.MemberService;

import antlr.collections.List;

@RequestMapping(value="/admin")
@Controller
@ComponentScan(basePackages="com.team01.services")
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView newMemberPage() {
		ModelAndView mav = new ModelAndView("register", "member", new Member());
		return mav;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createNewUser(@ModelAttribute @Valid Member member, BindingResult result,
			final RedirectAttributes redirectAttributes) {

		if (result.hasErrors())
			return new ModelAndView("register");

		ModelAndView mav = new ModelAndView();
		String message = "New user " + member.getMemberNo() + " was successfully created.";
		mService.createMember(member);
		//mav.setViewName("redirect:/admin/list");
		mav.setViewName("redirect:/login");

		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView memberListPage() {
		ModelAndView mav = new ModelAndView("member-list");
		ArrayList<Member> memberList = mService.findAllMember();
		mav.addObject("memberList", memberList);
		return mav;
	}
	
	/////////////////////////////MEMBER K///////////////////////////////
	
	@RequestMapping(value = "/mlist")
	public ModelAndView memberlist() {

		ModelAndView mav = new ModelAndView("MemberList");
		ArrayList<Member> memlist = mService.findAllMember();
		System.out.println("total size" + memlist.size());
		mav.addObject("memlist", memlist);
        return mav;

	}
	
	
	//member
		@RequestMapping(value = "/mnew", method = RequestMethod.GET)
		public ModelAndView NewMember() {

			ModelAndView mav = new ModelAndView("NewMember", "Member", new Member());
			return mav;
		}

		@RequestMapping(value = "/mnew", method = RequestMethod.POST)
		public ModelAndView CreateMember(@ModelAttribute Member member, final RedirectAttributes redirectAttributes) {

			ModelAndView mav = new ModelAndView();
			mService.createMember(member);

			int mess = member.getMemberNo();
			System.out.println("hello" + mess);
			redirectAttributes.addFlashAttribute("mess", mess);
			mav.setViewName("redirect:/admin/mlist");

			return mav;

		}
		
		/////Edit//////////
		@RequestMapping(value = "/medit/{memberno}", method = RequestMethod.GET)
		public ModelAndView editUserPag(@PathVariable Integer memberno) {
			ModelAndView mav = new ModelAndView("MemberEdit");
			System.out.println(memberno);
			Member member = mService.findMember(memberno);
	        mav.addObject("Member", member);
	        return mav;

		}

		@RequestMapping(value = "/medit/{id}", method = RequestMethod.POST)
		public ModelAndView editStuden(@ModelAttribute @Valid Member member, @PathVariable String id,
				final RedirectAttributes redirectAttributes) {
			mService.updateMember(member);
			ModelAndView mav = new ModelAndView("redirect:/admin/mlist");
			return mav;
			}
	
	
	
	
	
	
}
