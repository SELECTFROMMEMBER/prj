package com.wa.erp;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RegUpDelDAO {
	/*nnnnnnnnnnnn게시판 등록, 수정, 삭제을 위한nnnnnnnnnnnnn*/
	BoardDTO getBoard(BoardSearchDTO boardSearchDTO);
	
	int insertBoard(BoardDTO boardDTO);
	
	int updateBoard(BoardDTO boardDTO);
	
	int getboardCnt(BoardDTO boardDTO);
	
	int getboardPwdCnt(BoardDTO boardDTO);

	int deleteBoard(BoardDTO boardDTO);
	/*nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn*/
	
	/*nnnnnnnnnnnn회사공고nnnnnnnnnnnnn*/
	int insertGonggo(BoardDTO boardDTO);
//
//	int insertGonggo_field(BoardDTO boardDTO);
//	
//	int insertBenefit_code(BoardDTO boardDTO);
//	
//	int insertRole_Detail(BoardDTO boardDTO);
	/*nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn*/
	
	// (프리랜서)	
    int inserttimeShare(BoardDTO boardDTO); 
    int updatetimeShare(BoardDTO boardDTO);  
	int deletetimeShare(BoardDTO boardDTO); 
	
	int gettimeSharePwdCnt(BoardDTO boardDTO);
    int gettimeShareCnt(int b_no);
  
	BoardDTO gettimeShareForUpDel(int b_no); 
	
	
	// (부업)	
		int insertbuup(BoardDTO boardDTO); 
		int updatebuup(BoardDTO boardDTO); 
		int deletebuup(BoardDTO boardDTO); 
		
		int getbuupPwdCnt(BoardDTO boardDTO);
		int updatebuupEmpty( BoardDTO boardDTO );
	    int getbuupCnt(int b_no);
	    
		BoardDTO getbuupForUpDel(int b_no); 
		
		//기업리뷰 작성

		int upReview(BoardDTO boardDTO);
	}
