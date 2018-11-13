package com.team01.jdbc.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.team01.jdbc.repositories.MemberRepository;
import com.team01.model.Member;
import com.team01.jdbc.mapper.MemberMapper;

public class MemberService {
	public static Member findByUserIdAndPassword(Integer userId, String password) throws ClassNotFoundException, SQLException {
		ArrayList<HashMap> member = MemberRepository.findByUserIdAndPassword(userId, password);
		try {
		return MemberMapper.map(member.get(0));
		}
		catch(IndexOutOfBoundsException e) {
			return null;
		}
	}
}
