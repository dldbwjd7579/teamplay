package edu.spring.ex00.service;

import edu.spring.ex00.domain.Member;

public interface MemberService {

	// 회원 가입
		int insert(Member m);
	// 회원 정보 조회
		Member select(String userid);
	
	
}
