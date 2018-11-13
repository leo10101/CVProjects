package com.team01.repositories;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.team01.model.Member;

public interface MemberRepository extends JpaRepository<Member, Integer> {
	
	 @Query(value = "SELECT DISTINCT u.memberNo FROM Member u", nativeQuery=true)
	 ArrayList<Member> findAllMember();
	 
}
