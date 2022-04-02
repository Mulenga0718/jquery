package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberService {
	
	public List<MemberVO> selectAll();	
	
	//중복검사 메소드
	public String idCheck(String id);
	//우편번호 검색 메소드  
	public List<ZipVO> ziplist(String dong);
	//저장하는 메소드 
	public String insertmember(MemberVO vo);
	
	
}
