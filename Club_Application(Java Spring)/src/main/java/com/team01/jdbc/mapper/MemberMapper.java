package com.team01.jdbc.mapper;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.team01.model.Facility;
import com.team01.model.Member;

public class MemberMapper {
	
	//this mapper uses the format return by the repository which gets its data in ArrayList<HashMap> from the DAO class
		//maps the HashMap to the Member model and returns the instantiated and mapped model
	public static Member map(HashMap memberMap) {
		Member member = new Member();
		member.setRoleId((Integer)memberMap.get("RoleId"));
		member.setUserId((Integer)memberMap.get("UserId"));
		member.setUserPassword((String)memberMap.get("UserPassword"));
		member.setMemberNo((Integer)memberMap.get("MemberNo"));
		member.setMemberName((String)memberMap.get("MemberName"));
		member.setDateOfBirth((Date)memberMap.get("DateOfBirth"));
		member.setAddress((String)memberMap.get("Address"));
		member.setPostalCode((Integer)memberMap.get("PostalCode"));
		member.setContactTitle((String)memberMap.get("ContactTitle"));
		member.setPhoneNo((Integer)memberMap.get("PhoneNo"));
		member.setEmail((String)memberMap.get("Email"));
		return member;
	}
	
	//adds the member returned by the above method to a list
	public static ArrayList<Member> mapList(ArrayList<HashMap> memberMapList){
		ArrayList<Member> memberList = new ArrayList<Member>();
		for(int i = 0; i < memberMapList.size(); i++) {
			memberList.add(map(memberMapList.get(i)));
		}
		return memberList;	
	}
}
