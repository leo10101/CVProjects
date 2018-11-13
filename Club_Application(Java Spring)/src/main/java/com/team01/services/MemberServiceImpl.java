package com.team01.services;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.model.Member;
import com.team01.repositories.MemberRepository;


@Service
@Component
public class MemberServiceImpl implements MemberService{

	@Resource
	private MemberRepository memberRepository;
	
	@Override
	@Transactional
	public Member createMember(Member member) {
		return memberRepository.saveAndFlush(member);
	}

	@Override
	@Transactional
	public Member findMember(Integer memId) {
		return memberRepository.findOne(memId);
	}

	@Override
	@Transactional
	public ArrayList<Member> findAllMember() {
		ArrayList<Member> ul = (ArrayList<Member>) memberRepository.findAll();
		return ul;
	}

	@Override
	@Transactional
	public Member changeMember(Member member) {
		return memberRepository.saveAndFlush(member);
		}

	@Override
	public void removeMember(Member member) {
		memberRepository.delete(member);
	}

	@Override
	public Member updateMember(Member member) {
		return memberRepository.save(member);
	}

}
