package com.wa.erp;

import java.util.List;
import java.util.Map;

public interface RegUpDelService {
	/*게시판 등록,수정,삭제을 위한 선언*/
	int insertBoard(BoardDTO boardDTO);
	int updateBoard(BoardDTO boardDTO);
	int deleteBoard(BoardDTO boardDTO);
	
	/*게시판 댓글 등록*/
	int insertComment(BoardDTO boardDTO);
	//게시판 댓글 좋아요 +
	int updateRec(BoardDTO boardDTO);
	//게시판 댓글 싫어요 +
	int downdateRec(BoardDTO boardDTO);
	/*mmmmmmmmmmmmmmmmmm*/
	BoardDTO getBoard(BoardSearchDTO boardSearchDTO);
	
	//공고//
	public int insertGongo(BoardDTO boardDTO);
	//////////////////////////////////////
	
	//(부업)
	int insertbuup(BuupDTO buupDTO);
	int updatebuup(BuupDTO buupDTO);
	int deletebuup(BuupDTO buupDTO);
	
	BuupDTO getbuupForUpDel(int b_no);
	
	//(프리랜서)
	int inserttimeShare(TimeShareDTO timeShareDTO);	
	int updatetimeShare(TimeShareDTO timeShareDTO);
	int deletetimeShare(TimeShareDTO timeShareDTO);
	
	TimeShareDTO gettimeShareForUpDel(int b_no);
		
		//리뷰 등록
		int upReview(BoardDTO boardDTO);
		
		//이력서 등록
		int insertResume(BoardDTO boardDTO);

		
		
		// 마이페이지 회원정보 수정		
		int  deletePrivacy(MypageDTO mypageDTO );
		int  updatePrivacy(MypageDTO mypageDTO );

		MypageDTO getPrivacyForUpDel(int p_no);		
		
	}
