package com.wa.erp;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



//==============================================
//[LoginService 인터페이스]를 구현한 LoginServiceImpl 클래스 선언하기
//==============================================
//-------------------------------------------
// 스프링에서 관용적으로   Service 라는 단어가 들어간 클래스는  
// [트랜잭션이 걸린 세분화된 DB 연동 지시]를 내리는 메소드 소유한 클래스 이다.
// 클래스 이름 앞에는 @Service , @Transactional 라는 어노테이션이 붙는다.
//-------------------------------------------
@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	

	@Autowired
	private MemberDAO memberDAO;
	

	public int insertMemberCnt(MemberDTO memberDTO){
		
		int midCnt = this.memberDAO.getMidCnt(memberDTO);
		if(midCnt>0) {
			return 2;
		}
		int insertSkill = this.memberDAO.insertSkill(memberDTO);
		
		
		if(insertSkill==0) {
			return insertSkill;
		}
		
		
		
		int insertMemCnt = this.memberDAO.insertMemberCnt(memberDTO);
		
		

		return insertMemCnt;
	}
	
	
	/*-------------회사 회원가입을 위한 선언--------------*/
	public int insertCompany(MemberDTO memberDTO) {


		int cidCnt = this.memberDAO.getCidCnt(memberDTO); 
		if(cidCnt>0){ return 2; }

		int insertCompanyCnt = this.memberDAO.insertCompany( memberDTO );


		return insertCompanyCnt;
	}

	/*------------ 기업정보 입력을 위한 선언-------------- */
	public int insertCompanyInfo(MemberDTO memberDTO) {

		 int insertCompanyCnt = this.memberDAO.insertCompanyInfo(memberDTO);   
		 if( memberDTO.getWelfare_code()!=null ) {
			 insertCompanyCnt = this.memberDAO.insetCompanyWelfare( memberDTO );
			}
		return insertCompanyCnt;
	}


	/*--------------------------------------------*/
}
