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
	public List<BoardDTO> gettimeShareList() {
		List<BoardDTO> timeShareList = this.boardDAO.gettimeShareList();
		return timeShareList;
	}

	@Override
	public List<BoardDTO> getbuupList() {
		List<BoardDTO> buupList = this.boardDAO.getbuupList();
		return buupList;
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
	
			//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
			// 부업글 상세보기 화면에서 필요한 
			// [1개 게시판 글]을 검색 해 리턴하는 메소드 선언.
			// 매개변수로 검색할 게시판의 고유 번호가 들어온다.
			//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
			public BoardDTO getbuup(int b_no) {
				//-------------------------------------------
				// [BoardDAOImpl 객체]의 updateReadcount 메소드를 호출하여
				// [조회수 증가]하고 수정한 행의 개수를 얻는다
				//-------------------------------------------
			    //int updateCount    = this.boardDAO.updateReadcount(b_no);
				//------------------------------------------
				// [BoardDAOImpl 객체]의  getBoard 메소드를 호출하여
				// [1개 게시판 글]을 얻는다
				//------------------------------------------
				BoardDTO boardDTO  = this.boardDAO.getbuup(b_no);
				//------------------------------------------
				// [1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
				//------------------------------------------
				return boardDTO;
				}
			
		//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
		// 프리랜서 글 상세보기 화면에서 필요한 
		// [1개 게시판 글]을 검색 해 리턴하는 메소드 선언.
		// 매개변수로 검색할 게시판의 고유 번호가 들어온다.
		//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
		public BoardDTO gettimeShare(int b_no) {
			//-------------------------------------------
			// [BoardDAOImpl 객체]의 updateReadcount 메소드를 호출하여
			// [조회수 증가]하고 수정한 행의 개수를 얻는다
			//-------------------------------------------
			// int updateCount    = this.boardDAO.updateReadcount(b_no);
			//------------------------------------------
			// [BoardDAOImpl 객체]의  getBoard 메소드를 호출하여
			// [1개 게시판 글]을 얻는다
			//------------------------------------------
			BoardDTO boardDTO  = this.boardDAO.gettimeShare(b_no);
			//------------------------------------------
			// [1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
			//------------------------------------------
			return boardDTO;
			}

	
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
}
