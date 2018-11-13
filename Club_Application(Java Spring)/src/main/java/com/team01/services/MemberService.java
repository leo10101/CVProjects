package com.team01.services;

import java.util.ArrayList;

import com.team01.model.Member;

public interface MemberService {

	Member createMember(Member member);
	
	Member findMember(Integer memno);
	
	ArrayList<Member> findAllMember();
	
	Member changeMember(Member member);
	
	void removeMember(Member member);
	
	Member updateMember(Member member);
	
	

}
