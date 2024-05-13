package com.wa.erp;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	
	int insertMemberCnt( MemberDTO memberDTO);

	int insertSkill( MemberDTO memberDTO);
	
	int getMidCnt( MemberDTO memberDTO);
	
	/*-------------회사 정보를 위한 서언-------------*/
	int insertCompany(MemberDTO companyDTO);

	int getCidCnt(MemberDTO companyDTO);

	int insertCompanyInfo(MemberDTO companyDTO);

	int insetCompanyWelfare(MemberDTO companyDTO);
	/*-------------------------------------------*/
	
	}
