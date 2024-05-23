package com.wa.erp;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO boardDAO;
	
//	public List<Map<String,String>> getBoardList(){
//	
//		List<Map<String,String>> boardList = this.boardDAO.getBoardList();
//		return boardList;
//	}

	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// n행m열의 게시판 검색을 getBoardList 메소드 선언하기
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
	public List<BoardDTO> getboardList(BoardSearchDTO boardSearchDTO){
		//--------------------------------------
		// BoardDAOImpl 객체의 getBoardList 메소드를 호출하여
		// n행m열의 게시판 검색 데이터가 저장된 List<BoardDTO> 객체얻기
		// List<BoardDTO> 객체의 메위주를 변수 boardList 에 저장하기
		//--------------------------------------
		List<BoardDTO> boardList = this.boardDAO.getboardList(boardSearchDTO);
		return boardList;
	}

	@Override
	public List<BoardDTO> getcompanyList(BoardSearchDTO boardSearchDTO) {
		List<BoardDTO> companyList = this.boardDAO.getcompanyList(boardSearchDTO);
		return companyList;
		

	}

	@Override
	public List<BoardDTO> getgongGoList() {
		List<BoardDTO> gongGoList = this.boardDAO.getgongGoList();
		return gongGoList;
	}


	@Override
	public List<BoardDTO> getprjList() {
		List<BoardDTO> prjList = this.boardDAO.getprjList();
		return prjList;
	}

	@Override
	public List<BoardDTO> getgongMoList() {
		List<BoardDTO> gongMoList = this.boardDAO.getgongMoList();
		return gongMoList;
	}
	
//	상세보기 화면에서 필요한
//	1개의 게시판 글 을 검색하여 리턴하는 메소드 선언
//	매개변수로 검색할 게시판의 고유번호가 들어온다.
	@Override
	public BoardDTO getBoard(Map<String,Object> paramMap) {
		
		
//		BoardDAOImpl 객체의 updateReadCount 메소드를 호출하여
//		조회수 증가 하고 수정한 행의 개수를 얻는다.
//		존재하지 않는 게시판이라도 쿼리문은 작동된다.
		int updateCnt = this.boardDAO.updateReadCount(paramMap);
		
//		BoardDAOImpl 객체의 getBoard 메소드를 호출하여
//		1개의 게시판 글 을 얻는다.
//		존재하지 않는 게시판 글일 경우 null로 들어온다.
		BoardDTO boardDTO = this.boardDAO.getBoard(paramMap);
		
//		1개 게시판 글이 저장된 BoardDTO 객체 리턴하기
		return boardDTO;
	}
	
	@Override
	public List<BoardDTO> getComment(Map<String,Object> paramMap) {
		
		List<BoardDTO> boardDTO = this.boardDAO.getComment(paramMap);
		
		return boardDTO;
	}
	
	// *********************************************************************//
	
	
	

	
		@Override
		public BoardDTO getcompanyDetail(int c_no) {
			//------------------------------------------
			// [BoardDAOImpl 객체]의  getBoard 메소드를 호출하여
			// [1개 게시판 글]을 얻는다
			//------------------------------------------
			BoardDTO boardDTO  = this.boardDAO.getcompanyDetail(c_no);
			//------------------------------------------
			// [1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
			//------------------------------------------
			return boardDTO;
		}
		
		// review 창 가져오기
		@Override
		public List<BoardReviewDTO> getreviewContent(int c_no) {
			List<BoardReviewDTO> reviewContent = this.boardDAO.getreviewContent(c_no);
			return reviewContent;
		}
		
		@Override
		public List<BoardDTO> getReview(int c_no) {
			// TODO Auto-generated method stub
			return null;
		}
		
		
		
	public int getboardListCnt(BoardSearchDTO boardSearchDTO ) {
		//--------------------------------------
		// BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
		// 게시판 검색 개수를 구하여 변수 boardListCnt 에 저장하기
		//--------------------------------------
		int boardListCnt = this.boardDAO.getboardListCnt(boardSearchDTO);
		
		//--------------------------------------
		// 변수 boardListCnt 안의 데이터를 리턴하기
		//--------------------------------------
		return boardListCnt;
	}

	public int getboardListAllCnt(BoardSearchDTO boardSearchDTO) {
		//--------------------------------------
		// BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
		// 게시판 총 개수를 구하여 변수 boardListAllCnt 에 저장하기
		//--------------------------------------
		int boardListAllCnt = this.boardDAO.getboardListAllCnt(boardSearchDTO);
		//--------------------------------------
		// 변수 boardListAllCnt 안의 데이터를 리턴하기
		//--------------------------------------
		return boardListAllCnt;
	}
	
	@Override
	public int getReviewListAllCnt() {
		int reviewListAllCnt = this.boardDAO.getReviewListAllCnt();
		return reviewListAllCnt;
	}

	@Override
	public int getReviewListCnt(BoardReviewDTO boardReviewDTO) {
		int reviewListCnt = this.boardDAO.getReviewListCnt(boardReviewDTO);
		return reviewListCnt;
	}



	@Override
	public List<BoardReviewDTO> getreviewContent(BoardReviewDTO boardReviewDTO) {
	List<BoardReviewDTO> reviewContent = this.boardDAO.getreviewContent(boardReviewDTO);

		return reviewContent;
	}

	@Override
	public BoardDTO getcompanyListDetail(int c_no) {
		BoardDTO boardDTO  = this.boardDAO.getcompanyListDetail(c_no);
		//------------------------------------------
		// [1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
		//------------------------------------------
		return boardDTO;
	}
	
		//프로젝트 공모 게시판을 위한 선언
		@Autowired
		private BoardDAO boardDTO;
		
		//입력을 위한 선언
		@Override
		public int insertPrj(BoardDTO boardDTO) {
			
			int boardRegCnt = this.boardDAO.insertPrj(boardDTO);
			
			return boardRegCnt;
		}

		@Override
		public BoardDTO getPrj(int prj_no) {
			
			int updateCount = this.boardDAO.prjUpdateReadcount(prj_no);
			
			BoardDTO boardDTO = this.boardDAO.getPrj(prj_no);
			
			return boardDTO;
			
		}
		
		// 프로젝트 수정/삭제
		@Override
		public BoardDTO getPrjForUpDel(int prj_no) {
			
			BoardDTO boardDTO = this.boardDAO.getPrj(prj_no);
			
			return boardDTO;
		}
		
		@Override
		public int updatePrj(BoardDTO boardDTO) {
			
			int prjCnt = this.boardDAO.getPrjCnt( boardDTO.getPrj_no() );
			if( prjCnt==0 ) { return -2; }
			
			int prjPwdCnt = this.boardDAO.getPrjPwdCnt(boardDTO);
			if( prjPwdCnt==0 ) {return -1;}
			
			int prjUpCnt = this.boardDAO.updatePrj(boardDTO);
			
			return prjUpCnt;
		}

		@Override
		public int deldatePrj(BoardDTO boardDTO) {
			
			int prjCnt = this.boardDAO.getPrjCnt( boardDTO.getPrj_no() );
			if( prjCnt==0 ) { return prjCnt; }
			
			int prjPwdCnt = this.boardDAO.getPrjPwdCnt(boardDTO);
			if( prjPwdCnt==0 ) {return -1;}
			
			int prjDelCnt = this.boardDAO.deldatePrj(boardDTO);
			
			return prjDelCnt;
		}

		
		//공모전을 위한 선언들
		@Override
		public int insertGongMo(BoardDTO boardDTO) {
			// boardDAOImpl 객체의
			// insertBoard 메소드 호출하여
			// 게시판 글 입력 후 적용 행의 개수 얻기
			int boardRegCnt = this.boardDTO.insertGongMo(boardDTO);
			// 1개 게시판 글 입력 적용 행의 개수 리턴하기
			return boardRegCnt;
		}

		@Override
		public List<BoardDTO> getGongMoList(BoardSearchDTO boardSearchDTO) {
			
			List<BoardDTO> gongMoList = this.boardDAO.getGongMoList(boardSearchDTO);
			
			return gongMoList;
		}

		@Override
		public BoardDTO getGongMo(int comp_pk) {
			// [BoardDAOImpl 객체]의 updateReadcount 메소드를 호출하여
			// [조회수 증가]하고 수정한 행의 개수를 얻는다.
			int updateCount = this.boardDAO.gongMoUpdateReadcount(comp_pk);
			// [BoardDAOImpl 객체]의 getBoard 메소드를 호출하여
			// [1개 게시판 글]을 얻는다.
			BoardDTO boardDTO = this.boardDAO.getGongMo(comp_pk);
			// [1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
			return boardDTO;
		}

		@Override
		public BoardDTO gongMoForUpDel(int comp_pk) {
			BoardDTO boardDTO = this.boardDAO.getGongMo(comp_pk);
			// [1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
			return boardDTO;
		}

		@Override
		public int updateGongMo(BoardDTO boardDTO) {
			// 암호의 존재 개수 얻기
			// 만약 암호의 존개 개수가 0개면(=암호가 틀렸으면) -1 리턴하기
			int boardPwdCnt = this.boardDAO.getGongMoPwdCnt(boardDTO);
			if( boardPwdCnt==0 ) {return -1;}
			// 수정 실행하고 수정 적용행의 개수 얻기
			int boardUpCnt = this.boardDAO.updateGongMo(boardDTO);
			// 수정 적용행의 개수 리턴히기
			return boardUpCnt;
		}

		@Override
		public int deldateGongMo(BoardDTO boardDTO) {
			// 암호의 존재 개수 얻기
			// 만약 암호의 존개 개수가 0개면(=암호가 틀렸으면) -1 리턴하기
			int boardPwdCnt = this.boardDAO.getGongMoPwdCnt(boardDTO);
			if( boardPwdCnt==0 ) {return -1;}
					
			// 삭제 실행하고 수정 적용행의 개수 얻기
			int boardDelCnt = this.boardDAO.deldateGongMo(boardDTO);
			// 삭제 적용행의 개수 리턴히기
			return boardDelCnt;
		}

		@Override
		public int getPrjListAllCnt() {
			
			int boardListAllCnt = this.boardDAO.getPrjListAllCnt();
			
			return boardListAllCnt;
		}

		@Override
		public int getPrjListCnt(BoardSearchDTO boardSearchDTO) {
			
			int boardListCnt = this.boardDAO.getPrjListCnt(boardSearchDTO);
			
			return boardListCnt;
		}

		@Override
		public List<BoardDTO> getPrjList(BoardSearchDTO boardSearchDTO) {
			
			List<BoardDTO> boardList = this.boardDAO.getPrjList( boardSearchDTO );
			
			return boardList;
		}

		@Override
		public int getGongMoListAllCnt() {
			
			int gongMoListAllCnt = this.boardDAO.getGongMoListAllCnt();
			
			return gongMoListAllCnt;
		}

		@Override
		public int getGongMoListCnt(BoardSearchDTO boardSearchDTO) {
			
			int gongMoListCnt = this.boardDAO.getGongMoListCnt(boardSearchDTO);
			
			return gongMoListCnt;
		}
		///////////////////////////////////////////////////////////////////////////////////////////////////////
		
		@Override
		public List<BoardDTO> getCommentLike(Map<String, Object> paramMap){
			
			List<BoardDTO> getCommentLike = this.boardDAO.getCommentLike(paramMap);
			
			return getCommentLike;
		}

/// 기업정보관련 추가///////////////
		@Override
		public int getcompanyListCnt(BoardSearchDTO boardSearchDTO) {
			int companyListCnt = this.boardDAO.getcompanyListCnt(boardSearchDTO);
			
			//--------------------------------------
			// 변수 boardListCnt 안의 데이터를 리턴하기
			//--------------------------------------
			return companyListCnt;
		}

		@Override
		public int getcompanyListAllCnt(BoardSearchDTO boardSearchDTO) {
			int companyAllListCnt = this.boardDAO.getcompanyListAllCnt(boardSearchDTO);
			
			//--------------------------------------
			// 변수 boardListCnt 안의 데이터를 리턴하기
			//--------------------------------------
			return companyAllListCnt;
		}

		@Override
		public BoardDTO getcompanyWelfare(int c_no) {
			BoardDTO welfare = this.boardDAO.getcompanyWelfare(c_no);

			return welfare;
		}

}
