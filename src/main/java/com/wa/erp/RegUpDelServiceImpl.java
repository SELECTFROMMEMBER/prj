package com.wa.erp;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RegUpDelServiceImpl implements RegUpDelService{
	
	@Autowired
	private RegUpDelDAO regUpDelDAO;
	
	/*mmmmmmmmmmmmmmm게시판 등록, 수정, 삭제mmmmmmmmmmmmmmm*/
	@Override
	public BoardDTO getBoard(BoardSearchDTO boardSearchDTO) {
			BoardDTO boardDTO = this.regUpDelDAO.getBoard(boardSearchDTO);
			
			return boardDTO;
	}
	//================================================================
	//======================    게시판 등록   ===============================
	//================================================================
	@Override
	public int insertBoard(BoardDTO boardDTO) {
		
		int boardRegCnt = this.regUpDelDAO.insertBoard(boardDTO);
		
		return boardRegCnt;
	}
	//================================================================
	//======================    게시판 댓글 등록   ============================
	//================================================================
	@Override
	public int insertComment(BoardDTO boardDTO) {
		
		int CommentRegCnt = this.regUpDelDAO.insertComment(boardDTO);
		
		return CommentRegCnt;
	}
	//================================================================
	//======================    게시판 댓글 좋아요+   =========================
	//================================================================
	@Override
	public int updateRec(BoardDTO boardDTO) {
		System.out.println("1:"+boardDTO.getComment_no());
		System.out.println("1:"+boardDTO.getTable());
		System.out.println("1:"+boardDTO.getP_no());
		System.out.println("1:"+boardDTO.getB_no());
		int checkLike = this.regUpDelDAO.checkLike(boardDTO);
		if(checkLike==1) {
			return -2;
		}
		int insertLikeCnt = this.regUpDelDAO.insertLike(boardDTO);
		if(insertLikeCnt==0) {return -1;}

		int updateRecCnt = this.regUpDelDAO.updateRec(boardDTO);
		
		return updateRecCnt;
	}
	//================================================================
	//======================    게시판 댓글 싫어요-   =========================
	//================================================================
	@Override
	public int downdateRec(BoardDTO boardDTO) {
		
		int deleteLikeCnt = this.regUpDelDAO.deleteLike(boardDTO);
		if(deleteLikeCnt==0) {return -1;}

		int downdateRecCnt = this.regUpDelDAO.downdateRec(boardDTO);
		
		return downdateRecCnt;
	}
	//================================================================
	//======================    게시판 수정   ===============================
	//================================================================
	@Override
	public int updateBoard(BoardDTO boardDTO) {
		
		int boardCnt = this.regUpDelDAO.getboardCnt( boardDTO);
		if( boardCnt==0 ) { return -2; }
		
		int boardPwdCnt = this.regUpDelDAO.getboardPwdCnt( boardDTO );
		if( boardPwdCnt==0 ) { return -1; }
		
		int boardUpCnt = this.regUpDelDAO.updateBoard(boardDTO);
		
		return boardUpCnt;
	}
	
	//================================================================
	//======================    게시판 삭제   ===============================
	//================================================================
	@Override
	public int deleteBoard(BoardDTO boardDTO) {
		
		int boardCnt = this.regUpDelDAO.getboardCnt( boardDTO);
		if( boardCnt==0 ) { return boardCnt; }
		
		int boardPwdCnt = this.regUpDelDAO.getboardPwdCnt( boardDTO );
		if( boardPwdCnt==0 ) { return -1; }
		
		int boardDelCnt = this.regUpDelDAO.deleteBoard(boardDTO);
		
		return boardDelCnt;
	}
	/*mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm*/
	
	
	@Override	
public int insertGongo(BoardDTO boardDTO ) {

		int insertGonggoCnt = this.regUpDelDAO.insertGonggo(boardDTO);		
		/*
		 * int insertGonggo_fieldCnt = this.boardDAO.insertGonggo_field( boardDTO); int
		 * insertGonggo_benefitCnt = this.boardDAO.insertBenefit_code(boardDTO); int
		 * insertRole_DetailCnt = this.boardDAO.insertRole_Detail(boardDTO);
		 */
		return insertGonggoCnt;
	}


//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
		// [1개 프리랜서 글 등록 후 입력 적용 행의 개수] 리턴하는 메소드 선언
		//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
		public int inserttimeShare( BoardDTO boardDTO ) {
			
			int timeShareRegCnt = this.regUpDelDAO.inserttimeShare( boardDTO );
			//----------------------------------------------
			// 1개 게시판 글 입력 적용 행의 개수 리턴하기
			//----------------------------------------------
			return timeShareRegCnt;
			}
		
		//05.08
		//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
		// 수정/삭제 화면에서 필요한 
		// [1개 게시판 글]을 검색 해 리턴하는 메소드 선언.
		// 매개변수로 검색할 게시판의 고유 번호가 들어온다.
		//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
		public BoardDTO gettimeShareForUpDel(int b_no){
			//------------------------------------------
			// [BoardDAOImpl 객체]의  getBoard 메소드를 호출하여
			// [1개 게시판 글]을 얻는다
			//------------------------------------------
			BoardDTO boardDTO  = this.regUpDelDAO.gettimeShareForUpDel(b_no);
			//------------------------------------------
			// [1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
			//------------------------------------------
			return boardDTO;
		}
		
		//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
		// [1개 게시판] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
		//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
		public int updatetimeShare(BoardDTO boardDTO)  {
			//--------------------------------------
			// 수정할 게시판의 존재 개수 얻기
			// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
			//--------------------------------------
			int timeShareCnt = this.regUpDelDAO.gettimeShareCnt( boardDTO.getB_no() );
			if( timeShareCnt==0 ) { return timeShareCnt; }
			
			//--------------------------------------
			// 암호의 존재 개수 얻기
			// 만약 암호의 존재 개수가 0개면(=암호가 틀렸으면) -1리턴하기
			//--------------------------------------
			int timeSharePwdCnt = this.regUpDelDAO.gettimeSharePwdCnt( boardDTO );
			if( timeSharePwdCnt==0 ) { return -1; }
			//--------------------------------------
			// 수정 실행하고 수정 적용행의 개수 얻기
			//--------------------------------------
			int timeShareUpCnt = this.regUpDelDAO.updatetimeShare( boardDTO );
			//--------------------------------------
			// 수정 적용행의 개수 리턴하기
			//--------------------------------------
			return timeShareUpCnt;
		}
		
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 게시판] 삭제 후 삭제 적용행의 개수를 리턴하는 메소드 선언
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
	public int deletetimeShare(BoardDTO boardDTO)  {
		//--------------------------------------
		// 삭제할 게시판의 존재 개수 얻기
		// 만약 삭제할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		//--------------------------------------
		int timeShareCnt = this.regUpDelDAO.gettimeShareCnt( boardDTO.getB_no() );
		if( timeShareCnt==0 ) { return timeShareCnt; }
		//--------------------------------------
		// 암호의 존재 개수 얻기
		// 만약 암호의 존재 개수가 0개면(=암호가 틀렸으면) -1리턴하기
		//--------------------------------------
		int timeSharePwdCnt = this.regUpDelDAO.gettimeSharePwdCnt( boardDTO );
		if( timeSharePwdCnt==0 ) { return -1; }
	  
		//--------------------------------------
		// 삭제 실행하고 삭제 적용행의 개수 얻기
		//--------------------------------------
		int timeShareDelCnt = this.regUpDelDAO.deletetimeShare( boardDTO );
		//--------------------------------------
		// 수정 적용행의 개수 리턴하기
		//--------------------------------------
		return timeShareDelCnt;
		}
	
	
	
	
	
	//=================================================================
	//부업 등록, 수정, 삭제
	//=================================================================
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
		// 수정/삭제 화면에서 필요한 
		// [1개 게시판 글]을 검색 해 리턴하는 메소드 선언.
		// 매개변수로 검색할 게시판의 고유 번호가 들어온다.
		//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
		public BoardDTO getbuupForUpDel(int b_no){
			//------------------------------------------
			// [BoardDAOImpl 객체]의  getbuup 메소드를 호출하여
			// [1개 게시판 글]을 얻는다
			//------------------------------------------
			BoardDTO boardDTO  = this.regUpDelDAO.getbuupForUpDel(b_no);
			//------------------------------------------
			// [1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
			//------------------------------------------
			return boardDTO;
			}	
		
		//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
		// [1개 게시판] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
		//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
		public int updatebuup(BoardDTO boardDTO)  {
			//--------------------------------------
			// 수정할 게시판의 존재 개수 얻기
			// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
			//--------------------------------------
			int buupCnt = this.regUpDelDAO.getbuupCnt( boardDTO.getB_no() );
			if( buupCnt==0 ) { return buupCnt; }
			
			//--------------------------------------
			// 암호의 존재 개수 얻기
			// 만약 암호의 존재 개수가 0개면(=암호가 틀렸으면) -1리턴하기
			//--------------------------------------
			int buupPwdCnt = this.regUpDelDAO.getbuupPwdCnt( boardDTO );
			if( buupPwdCnt==0 ) { return -1; }
			//--------------------------------------
			// 수정 실행하고 수정 적용행의 개수 얻기
			//--------------------------------------
			int buupUpCnt = this.regUpDelDAO.updatebuup( boardDTO );
			//--------------------------------------
			// 수정 적용행의 개수 리턴하기
			//--------------------------------------
			return buupUpCnt;
			}
		
		
		
				//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
				// [1개 게시판] 삭제 후 삭제 적용행의 개수를 리턴하는 메소드 선언
				//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
				public int deletebuup(BoardDTO boardDTO)  {
				//--------------------------------------
				// 삭제할 게시판의 존재 개수 얻기
				// 만약 삭제할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
				//--------------------------------------
				int buupCnt = this.regUpDelDAO.getbuupCnt( boardDTO.getB_no() );
				if( buupCnt==0 ) { return buupCnt; }
				//--------------------------------------
				// 암호의 존재 개수 얻기
				// 만약 암호의 존재 개수가 0개면(=암호가 틀렸으면) -1리턴하기
				//--------------------------------------
				int buupPwdCnt = this.regUpDelDAO.getbuupPwdCnt( boardDTO );
				if( buupPwdCnt==0 ) { return -1; }
		      
				//--------------------------------------
				// 삭제 실행하고 삭제 적용행의 개수 얻기
				//--------------------------------------
				int buupDelCnt = this.regUpDelDAO.deletebuup( boardDTO );
				//--------------------------------------
				// 수정 적용행의 개수 리턴하기
				//--------------------------------------
				return buupDelCnt;
				}
				
				
				
				//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
				// [1개 부업 글 입력 후 입력 적용 행의 개수] 리턴하는 메소드 선언
				//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
				public int insertbuup( BoardDTO boardDTO ) {
				
				int buupRegCnt = this.regUpDelDAO.insertbuup( boardDTO );
				//----------------------------------------------
				// 1개 게시판 글 입력 적용 행의 개수 리턴하기
				//----------------------------------------------
				return buupRegCnt;
				}
				
				
				//기업리뷰 작성
	@Override
	public int upReview(BoardDTO boardDTO) {
		
		//----------------------------------------------
		// BoardDAOImpl 객체의  
			// insertBoard 메소드 호출하여 
			// 게시판 글 입력 후 입력 적용 행의 개수 얻기
		//----------------------------------------------
		int reviewRegCnt = this.regUpDelDAO.upReview( boardDTO );

		//----------------------------------------------
		// 1개 게시판 글 입력 적용 행의 개수 리턴하기
		//----------------------------------------------
		return reviewRegCnt;
	}	
	
	//이력서 등록
	public int insertResume(BoardDTO boardDTO ) {
		int insertResumeCnt = this.regUpDelDAO.insertResume(boardDTO);			
		int insertAwardsCnt = this.regUpDelDAO.insertAwards(boardDTO); 
			if(insertAwardsCnt==0) {return -1;}
			
		 int insertEducationCnt = this.regUpDelDAO.insertEducation(boardDTO); 
		 	if(insertEducationCnt==0) {return -2;}
		 	
		 int insertCareerCnt = this.regUpDelDAO.insertCareer(boardDTO); 
		 	if(insertCareerCnt==0) {return -3;}
		 	
		 int insertPerson_licenseCnt = this.regUpDelDAO.insertPerson_license(boardDTO);
		 	if(insertPerson_licenseCnt==0) {return -4;}
		 	
		 int insertSkillCnt = this.regUpDelDAO.insertSkill_Code(boardDTO);
		 	if(insertSkillCnt==0) {return -5;}
		 
		 return insertResumeCnt;
	}
	@Override
	public int deleteReview(BoardDTO boardDTO) {
	
		//--------------------------------------
		// 수정 실행하고 수정 적용행의 개수 얻기
		//--------------------------------------
		int boardDelCnt = this.regUpDelDAO.deleteReview( boardDTO );
		//--------------------------------------
		// 수정 적용행의 개수 리턴하기
		//--------------------------------------
		return boardDelCnt;
	}
	@Override
	public int updateReview(BoardDTO boardDTO) {

		
		int reviewUpdateCnt = this.regUpDelDAO.updateReview(boardDTO);
		
		return reviewUpdateCnt;
	}
	
	//관심기업 등록
	public int insertLikeCompany(BoardDTO boardDTO) {
		
		int updaterec = this.regUpDelDAO.updateCompanyRec(boardDTO);
		if(updaterec==0) {
			return 3;
		}
		int insertLikeCnt = this.regUpDelDAO.insertLikeCompany(boardDTO);

		return insertLikeCnt;
	}

	//관심기업 해제
	public int deleteLikeCompany(BoardDTO boardDTO) {
		
		int downdaterec = this.regUpDelDAO.downdateCompanyRec(boardDTO);
		if(downdaterec==0) {
			return 3;
		}
		int deleteLikeCnt = this.regUpDelDAO.deleteLikeCompany(boardDTO);
		
		return deleteLikeCnt;
	}
	
	//댓글 수정
	public int updateComment(BoardDTO boardDTO) {
		int updateComment = this.regUpDelDAO.updateComment(boardDTO);
		
		return updateComment;
	}

	//댓글 삭제
	public int deleteComment(BoardDTO boardDTO) {
		int deleteComment = this.regUpDelDAO.deleteComment(boardDTO);
		
		int deleteLike = this.regUpDelDAO.deleteLikecomment(boardDTO);
		
		return deleteComment;
	}
	@Override
	public int insertNotice(BoardDTO boardDTO) {
		int noticeRegCnt = this.regUpDelDAO.insertNotice(boardDTO);
		
		return noticeRegCnt;
	}
	@Override
	public int updateNotice(BoardDTO boardDTO) {
		int updateNotice = this.regUpDelDAO.updateNotice(boardDTO);
		
		return updateNotice;
		
	}
	@Override
	public int deleteNotice(BoardDTO boardDTO) {
		int deleteNotice = this.regUpDelDAO.deleteNotice(boardDTO);
		
		
		return deleteNotice;
	}
	@Override
	public int deleteSelectPostCnt(BoardDTO boardDTO) {
	int deleteSelectPost = this.regUpDelDAO.deleteSelectPost(boardDTO);
		
		
		return deleteSelectPost;
	}
	
}
