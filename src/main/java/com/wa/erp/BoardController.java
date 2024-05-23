package com.wa.erp;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	
	// URL 주소 /boardList.do 로 접근하면 호출되는 메소드 선언
	@RequestMapping(value = "/freedome.do")
	public ModelAndView freedome(
			@RequestParam(value="boardname", required=false) String boardname,
				BoardSearchDTO boardSearchDTO
			) {
		
		boardSearchDTO.setBoardname(boardname);
		
//		게시판 검색 결과 개수 저장할 변수 boardListCnt 선언하여 저장하기
//		<주의> 페이징 처리 관련 데이터를 얻으려면 반드시 검색 결과 개수가 필요하다.
		int freedomeListCnt = this.boardService.getboardListCnt( boardSearchDTO );

		
//		게시판 총 개수 저장할 변수 boardListAllCnt 선언하여 저장하기
		int freedomeListAllCnt = this.boardService.getboardListAllCnt(boardSearchDTO);
		
		
		
		
//		게시판 페이징 처리관련 정보들 저장한 Map<String,Object> 객체 구하고
//		이 객체의 메위주를 변수 boardMap 에 저장하기
//		이 객체안의 모든 정보는 boardList.jsp 페이지에서 사용될 예정이다.
		Map<String,Integer> boardMap = Util.getPagingMap(
				boardSearchDTO.getSelectPageNo()	//선택한 페이지 번호
				,boardSearchDTO.getRowCntPerPage()	//페이지 당 보여줄 검색 행의 개수
				,freedomeListCnt			//검색결과 개수
				);
		
		//-------------------------------------------------------------
		// BoardSearchDTO 객체에 
		//		선택 페이지 번호, 페이지 당 보일 행 개수
		//		테이블에서 검색 시 사용할 시작 행 번호
		//		테이블에서 검색 시 사용할 끝 행 번호
		// 저장하기.
		//-------------------------------------------------------------
		boardSearchDTO.setSelectPageNo(  (int)boardMap.get("selectPageNo")  ); 
		boardSearchDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
		boardSearchDTO.setBegin_rowNo(   (int)boardMap.get("begin_rowNo")   ); 
		boardSearchDTO.setEnd_rowNo(     (int)boardMap.get("end_rowNo")     );
		
		
		//--------------------------------------------------------------
		//BoardServiceImpl 객체의 getBoardList 메소드를 호출하여
		// n행m열의 게시판 검색 데이터가 저장된 List<BoardDTO> 객체 얻기
		//List<BoardDTO>객체의 메위주를 boardList에 저장한다.
		//--------------------------------------------------------------
		List<BoardDTO> freedomeList = this.boardService.getboardList(boardSearchDTO);
//		List<Map<String, String>> boardList = this.boardService.getBoardList();
		
		boardSearchDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
		
	
		//ModelAndView 객체 생성하기
		ModelAndView mav = new ModelAndView();
		
		//--------------------------------------------------------------
		//[ModelAndView 객체]에 키값 "boardList"에
		// n행m열의 검색 데이터가 저장된 List<BoardDTO> 객체 붙여 저장하기.
		//[ModelAndView 객체]에 저장된 객체는 [HttpServletRequest 객체] 에도 저장이 된다.
		//--------------------------------------------------------------
		mav.addObject("freedomeList", freedomeList);
		//ModelAndView 객체 검색된 게시판의 개수를 저장한다.
		mav.addObject("freedomeListCnt", freedomeListCnt+"");

		//ModelAndView 객체 게시판의 총 개수를 저장한다.
		mav.addObject("freedomeListAllCnt", freedomeListAllCnt);

//		ModelAndView 객체에 페이징 처리 관련 데이터를 가진 HashMap 객체를 저장하기
		mav.addObject("boardMap", boardMap);

		
		//[ModelAndView 객체]의 setViewName 메소드 호출하여
		//[호출할 JSP 페이지명]을 문자로 저장하기
		mav.setViewName("freedome.jsp");

		//[ModelAndView 객체] 리턴하기
		//[ModelAndView 객체]를 리턴한 후에 Springframework가 JSP페이지를 호출한다.
		return mav;
		
		
		
	}
	
	
	
	
	
	//--------------------------------------------------------------------------------------
	// qna 게시판 불러오기
	//--------------------------------------------------------------------------------------
	@RequestMapping( value ="/qna.do")
	public ModelAndView qna(
			@RequestParam(value="boardname", required=false) String boardname,
			BoardSearchDTO boardSearchDTO
			) {
		
		boardSearchDTO.setBoardname(boardname);
		
		int qnaListCnt = this.boardService.getboardListCnt( boardSearchDTO );

		int qnaListAllCnt = this.boardService.getboardListAllCnt(boardSearchDTO);
		
		Map<String,Integer> boardMap = Util.getPagingMap(
				boardSearchDTO.getSelectPageNo()	//선택한 페이지 번호
				,boardSearchDTO.getRowCntPerPage()	//페이지 당 보여줄 검색 행의 개수
				,qnaListCnt			//검색결과 개수
				);

		boardSearchDTO.setSelectPageNo(  (int)boardMap.get("selectPageNo")  ); 
		boardSearchDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
		boardSearchDTO.setBegin_rowNo(   (int)boardMap.get("begin_rowNo")   ); 
		boardSearchDTO.setEnd_rowNo(     (int)boardMap.get("end_rowNo")     );
		
		List<BoardDTO> qnaList = this.boardService.getboardList(boardSearchDTO);
		
		boardSearchDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaList", qnaList);
		
		mav.addObject("qnaListCnt", qnaListCnt+"");

		mav.addObject("qnaListAllCnt", qnaListAllCnt);

		mav.addObject("boardMap", boardMap);
		
		mav.setViewName("qna.jsp");
		return mav;
	}
	
	
	
	
	
	//--------------------------------------------------------------------------------------
	// interview 게시판 불러오기
	//--------------------------------------------------------------------------------------
	@RequestMapping( value ="/interview.do")
	public ModelAndView interview(
			@RequestParam(value="boardname", required=false) String boardname,
			BoardSearchDTO boardSearchDTO
			) {
		
		boardSearchDTO.setBoardname(boardname);
		
		int interviewListCnt = this.boardService.getboardListCnt( boardSearchDTO );

		int interviewListAllCnt = this.boardService.getboardListAllCnt(boardSearchDTO);
		
		Map<String,Integer> boardMap = Util.getPagingMap(
				boardSearchDTO.getSelectPageNo()	//선택한 페이지 번호
				,boardSearchDTO.getRowCntPerPage()	//페이지 당 보여줄 검색 행의 개수
				,interviewListCnt			//검색결과 개수
				);

		boardSearchDTO.setSelectPageNo(  (int)boardMap.get("selectPageNo")  ); 
		boardSearchDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
		boardSearchDTO.setBegin_rowNo(   (int)boardMap.get("begin_rowNo")   ); 
		boardSearchDTO.setEnd_rowNo(     (int)boardMap.get("end_rowNo")     );
		
		List<BoardDTO> interviewList = this.boardService.getboardList(boardSearchDTO);
		
		boardSearchDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("interviewList", interviewList);
		
		mav.addObject("interviewListCnt", interviewListCnt+"");

		mav.addObject("interviewListAllCnt", interviewListAllCnt);

		mav.addObject("boardMap", boardMap);
		
		mav.setViewName("interview.jsp");
		return mav;
	}
	

	
	
	
	
	//--------------------------------------------------------------------------------------
	// newComer 게시판 불러오기
	//--------------------------------------------------------------------------------------
	@RequestMapping( value ="/newComer.do")
	public ModelAndView newComer(
			@RequestParam(value="boardname", required=false) String boardname,
			BoardSearchDTO boardSearchDTO
			) {
		
		boardSearchDTO.setBoardname(boardname);
		
		int newComerListCnt = this.boardService.getboardListCnt( boardSearchDTO );

		int newComerListAllCnt = this.boardService.getboardListAllCnt(boardSearchDTO);
		
		Map<String,Integer> boardMap = Util.getPagingMap(
				boardSearchDTO.getSelectPageNo()	//선택한 페이지 번호
				,boardSearchDTO.getRowCntPerPage()	//페이지 당 보여줄 검색 행의 개수
				,newComerListCnt			//검색결과 개수
				);

		boardSearchDTO.setSelectPageNo(  (int)boardMap.get("selectPageNo")  ); 
		boardSearchDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
		boardSearchDTO.setBegin_rowNo(   (int)boardMap.get("begin_rowNo")   ); 
		boardSearchDTO.setEnd_rowNo(     (int)boardMap.get("end_rowNo")     );
		
		List<BoardDTO> newComerList = this.boardService.getboardList(boardSearchDTO);
		
		boardSearchDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("newComerList", newComerList);
		
		mav.addObject("newComerListCnt", newComerListCnt+"");

		mav.addObject("newComerListAllCnt", newComerListAllCnt);

		mav.addObject("boardMap", boardMap);
		
		mav.setViewName("newComer.jsp");
		
		return mav;
	}
	
	
	
	
	
	//--------------------------------------------------------------------------------------
	// jobReady 게시판 불러오기
	//--------------------------------------------------------------------------------------
	@RequestMapping( value ="/jobReady.do")
	public ModelAndView jobReady(
			@RequestParam(value="boardname", required=false) String boardname,
			BoardSearchDTO boardSearchDTO
			) {
		
		boardSearchDTO.setBoardname(boardname);
		
		int jobReadyListCnt = this.boardService.getboardListCnt( boardSearchDTO );

		int jobReadyListAllCnt = this.boardService.getboardListAllCnt(boardSearchDTO);
		
		Map<String,Integer> boardMap = Util.getPagingMap(
				boardSearchDTO.getSelectPageNo()	//선택한 페이지 번호
				,boardSearchDTO.getRowCntPerPage()	//페이지 당 보여줄 검색 행의 개수
				,jobReadyListCnt			//검색결과 개수
				);

		boardSearchDTO.setSelectPageNo(  (int)boardMap.get("selectPageNo")  ); 
		boardSearchDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
		boardSearchDTO.setBegin_rowNo(   (int)boardMap.get("begin_rowNo")   ); 
		boardSearchDTO.setEnd_rowNo(     (int)boardMap.get("end_rowNo")     );
		
		List<BoardDTO> jobReadyList = this.boardService.getboardList(boardSearchDTO);
		
		boardSearchDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("jobReadyList", jobReadyList);
		
		mav.addObject("jobReadyListCnt", jobReadyListCnt+"");

		mav.addObject("jobReadyListAllCnt", jobReadyListAllCnt);

		mav.addObject("boardMap", boardMap);
		
		mav.setViewName("jobReady.jsp");
		
		return mav;
	}

	
	
	
	
	//--------------------------------------------------------------------------------------
	// joongGo 게시판 불러오기
	//--------------------------------------------------------------------------------------
	@RequestMapping( value ="/joongGo.do")
	public ModelAndView joongGo(
			@RequestParam(value="boardname", required=false) String boardname,
			BoardSearchDTO boardSearchDTO
			) {
		
		boardSearchDTO.setBoardname(boardname);
		
		int joongGoListCnt = this.boardService.getboardListCnt( boardSearchDTO );
		
		int joongGoListAllCnt = this.boardService.getboardListAllCnt(boardSearchDTO);
		
		Map<String,Integer> boardMap = Util.getPagingMap(
				boardSearchDTO.getSelectPageNo()	//선택한 페이지 번호
				,boardSearchDTO.getRowCntPerPage()	//페이지 당 보여줄 검색 행의 개수
				,joongGoListCnt			//검색결과 개수
				);
		
		boardSearchDTO.setSelectPageNo(  (int)boardMap.get("selectPageNo")  ); 
		boardSearchDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
		boardSearchDTO.setBegin_rowNo(   (int)boardMap.get("begin_rowNo")   ); 
		boardSearchDTO.setEnd_rowNo(     (int)boardMap.get("end_rowNo")     );
		
		List<BoardDTO> joongGoList = this.boardService.getboardList(boardSearchDTO);
		
		boardSearchDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("joongGoList", joongGoList);
		
		mav.addObject("joongGoListCnt", joongGoListCnt+"");
		
		mav.addObject("joongGoListAllCnt", joongGoListAllCnt);
		
		mav.addObject("boardMap", boardMap);
		
		mav.setViewName("joongGoList.jsp");
		
		return mav;
	}

	
	//=================================================
	//기업정보 리스트 불러오기
	//=================================================
	@RequestMapping( value ="/companyList.do")
	public ModelAndView companyList(
			BoardSearchDTO boardSearchDTO
			) {
		List<BoardDTO> companyList = this.boardService.getcompanyList(boardSearchDTO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("companyList", companyList);
		mav.setViewName("companyList.jsp");
		return mav;
	}
	
	@RequestMapping( value ="/gongGoList.do")
	public ModelAndView gongGoList(
			BoardSearchDTO boardSearchDTO
			) {
		List<BoardDTO> gongGoList = this.boardService.getgongGoList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("gongGoList", gongGoList);
		mav.setViewName("gongGoList.jsp");
		return mav;
	}
	


	
	//--------------------------------------------------------------------------------------
	// 자유게시판 상세보기
	//--------------------------------------------------------------------------------------
	@RequestMapping( value ="/freedomeDetailForm.do")
	public ModelAndView freedomeDetailForm(
			//--------------------------------------
			// "b_no" 라는 파라미터명에 해당하는 파라미터값을 꺼내서 
			// 매개변수 b_no 에 저장하고 들어온다.
			// 즉 게시판 고유 번호가 매개변수 b_no 로 들어온다.
			// RequestParam으로 파라미터값을 불러오면 반드시 파라미터값이 있어야한다.
			// 파라미터 값은 모두 문자로 처리된다. int b_no 에서 int로 변환한다.
			//--------------------------------------
			@RequestParam(value="Detail_b_no") int b_no,
			@RequestParam(value="Detail_board") String table,
			@RequestParam(value="Comment_board") String comment,
			@RequestParam(value="comment_sort", required=false) String sort,
			@RequestParam(value="p_no", required=false) int p_no,
			@RequestParam(value="c_no", required=false) int c_no
			
			) {
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("tablename", table);
		paramMap.put("b_no", b_no);
		paramMap.put("comment",comment );
		paramMap.put("sort", sort);
		paramMap.put("p_no", p_no);
		paramMap.put("c_no", c_no);
		
//		BoardServiceImpl 객체의 getBoard 메소드를 호출하여
//		상세보기 화면에서 필요한 [1개의 게시판 글] 가져오기
		BoardDTO boardDTO = this.boardService.getBoard(paramMap);
		List<BoardDTO> commentList = this.boardService.getComment(paramMap);
		
		//ModelAndView 객체 생성하기
		ModelAndView mav = new ModelAndView();
		
		if(c_no!=0 || p_no!=0) {
			List<BoardDTO> commentLike = this.boardService.getCommentLike(paramMap);		
			   List<Integer> likeNoList = new ArrayList<>();
			   if (commentLike != null) {
				    for (int i = 0; i < commentLike.size(); i++) {
				        BoardDTO likeDTO = commentLike.get(i);
				        int likeNo = likeDTO.getLike_no();
				        if (likeNo != 0) {
				            likeNoList.add(likeNo);
				        }   
				    }
			   }
			mav.addObject("likeNoList", likeNoList);
		}
		
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("commentList", commentList);
		
		//[ModelAndView 객체]의 setViewName 메소드 호출하여
		//[호출할 JSP 페이지명]을 문자로 저장하기
		mav.setViewName("freedomeDetailForm.jsp");
		
		return mav;
		
	}

	
	
	
	
	
	
	
	//--------------------------------------------------------------------------------------
	// QnA게시판 상세보기
	//--------------------------------------------------------------------------------------
	@RequestMapping( value ="/qnaDetailForm.do")
	public ModelAndView qnaDetailForm(
			@RequestParam(value="Detail_b_no") int b_no,
			@RequestParam(value="Detail_board") String table,
			@RequestParam(value="Comment_board") String comment,
			@RequestParam(value="comment_sort", required=false) String sort,
			@RequestParam(value="p_no", required=false) int p_no,
			@RequestParam(value="c_no", required=false) int c_no
			) {
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("tablename", table);
		paramMap.put("b_no", b_no);
		paramMap.put("comment",comment );
		paramMap.put("sort", sort);
		paramMap.put("p_no", p_no);
		paramMap.put("c_no", c_no);
		
		BoardDTO boardDTO = this.boardService.getBoard(paramMap);
		List<BoardDTO> commentList = this.boardService.getComment(paramMap);

		ModelAndView mav = new ModelAndView();
		
		if(c_no!=0 || p_no!=0) {
			List<BoardDTO> commentLike = this.boardService.getCommentLike(paramMap);		
			   List<Integer> likeNoList = new ArrayList<>();
			   if (commentLike != null) {
				    for (int i = 0; i < commentLike.size(); i++) {
				        BoardDTO likeDTO = commentLike.get(i);
				        int likeNo = likeDTO.getLike_no();
				        if (likeNo != 0) {
				            likeNoList.add(likeNo);
				        }   
				    }
			   }
			mav.addObject("likeNoList", likeNoList);
		}
		
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("commentList", commentList);

		mav.setViewName("qnaDetailForm.jsp");
		
		return mav;
		
	}

	
	
	
	//--------------------------------------------------------------------------------------
	// 신입게시판 상세보기
	//--------------------------------------------------------------------------------------
	@RequestMapping( value ="/newComerDetailForm.do")
	public ModelAndView newComerDetailForm(
			@RequestParam(value="Detail_b_no") int b_no,
			@RequestParam(value="Detail_board") String table,
			@RequestParam(value="Comment_board") String comment,
			@RequestParam(value="comment_sort", required=false) String sort,
			@RequestParam(value="p_no", required=false) int p_no,
			@RequestParam(value="c_no", required=false) int c_no
			) {
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("tablename", table);
		paramMap.put("b_no", b_no);
		paramMap.put("comment",comment );
		paramMap.put("sort", sort);
		paramMap.put("p_no", p_no);
		paramMap.put("c_no", c_no);
		
		BoardDTO boardDTO = this.boardService.getBoard(paramMap);
		List<BoardDTO> commentList = this.boardService.getComment(paramMap);
		
		ModelAndView mav = new ModelAndView();
		
		if(c_no!=0 || p_no!=0) {
			List<BoardDTO> commentLike = this.boardService.getCommentLike(paramMap);		
			   List<Integer> likeNoList = new ArrayList<>();
			   if (commentLike != null) {
				    for (int i = 0; i < commentLike.size(); i++) {
				        BoardDTO likeDTO = commentLike.get(i);
				        int likeNo = likeDTO.getLike_no();
				        if (likeNo != 0) {
				            likeNoList.add(likeNo);
				        }   
				    }
			   }
			mav.addObject("likeNoList", likeNoList);
		}
		
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("commentList", commentList);
		
		mav.setViewName("newComerDetailForm.jsp");
		
		return mav;
		
	}

	
	
	
	
	
	
	
	
	//--------------------------------------------------------------------------------------
	// 신입게시판 상세보기
	//--------------------------------------------------------------------------------------
	@RequestMapping( value ="/jobReadyDetailForm.do")
	public ModelAndView jobReadyDetailForm(
			@RequestParam(value="Detail_b_no") int b_no,
			@RequestParam(value="Detail_board") String table,
			@RequestParam(value="Comment_board") String comment,
			@RequestParam(value="comment_sort", required=false) String sort,
			@RequestParam(value="p_no", required=false) int p_no,
			@RequestParam(value="c_no", required=false) int c_no
			) {
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("tablename", table);
		paramMap.put("b_no", b_no);
		paramMap.put("comment",comment );
		paramMap.put("sort", sort);
		paramMap.put("p_no", p_no);
		paramMap.put("c_no", c_no);
		
		BoardDTO boardDTO = this.boardService.getBoard(paramMap);
		List<BoardDTO> commentList = this.boardService.getComment(paramMap);
		
		ModelAndView mav = new ModelAndView();
		
		if(c_no!=0 || p_no!=0) {
			List<BoardDTO> commentLike = this.boardService.getCommentLike(paramMap);		
			   List<Integer> likeNoList = new ArrayList<>();
			   if (commentLike != null) {
				    for (int i = 0; i < commentLike.size(); i++) {
				        BoardDTO likeDTO = commentLike.get(i);
				        int likeNo = likeDTO.getLike_no();
				        if (likeNo != 0) {
				            likeNoList.add(likeNo);
				        }   
				    }
			   }
			mav.addObject("likeNoList", likeNoList);
		}
		
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("commentList", commentList);
		
		mav.setViewName("jobReadyDetailForm.jsp");
		
		return mav;
		
	}

	
	
	
	
	
	
	
	
	//--------------------------------------------------------------------------------------
	// 면접게시판 상세보기
	//--------------------------------------------------------------------------------------
	@RequestMapping( value ="/interviewDetailForm.do")
	public ModelAndView interviewDetailForm(
			@RequestParam(value="Detail_b_no") int b_no,
			@RequestParam(value="Detail_board") String table,
			@RequestParam(value="Comment_board") String comment,
			@RequestParam(value="comment_sort", required=false) String sort,
			@RequestParam(value="p_no", required=false) int p_no,
			@RequestParam(value="c_no", required=false) int c_no
			) {
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("tablename", table);
		paramMap.put("b_no", b_no);
		paramMap.put("comment",comment );
		paramMap.put("sort", sort);
		paramMap.put("p_no", p_no);
		paramMap.put("c_no", c_no);
		
		BoardDTO boardDTO = this.boardService.getBoard(paramMap);
		List<BoardDTO> commentList = this.boardService.getComment(paramMap);
		
		ModelAndView mav = new ModelAndView();
		
		if(c_no!=0 || p_no!=0) {
			List<BoardDTO> commentLike = this.boardService.getCommentLike(paramMap);		
			   List<Integer> likeNoList = new ArrayList<>();
			   if (commentLike != null) {
				    for (int i = 0; i < commentLike.size(); i++) {
				        BoardDTO likeDTO = commentLike.get(i);
				        int likeNo = likeDTO.getLike_no();
				        if (likeNo != 0) {
				            likeNoList.add(likeNo);
				        }   
				    }
			   }
			mav.addObject("likeNoList", likeNoList);
		}
		
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("commentList", commentList);
		
		mav.setViewName("interviewDetailForm.jsp");
		
		return mav;
		
	}

	
	
	
	
	
	
	
	//--------------------------------------------------------------------------------------
	// 중고게시판 상세보기
	//--------------------------------------------------------------------------------------
	@RequestMapping( value ="/joongGoDetailForm.do")
	public ModelAndView joongGoDetailForm(
			@RequestParam(value="Detail_b_no") int b_no,
			@RequestParam(value="Detail_board") String table,
			@RequestParam(value="Comment_board") String comment,
			@RequestParam(value="comment_sort", required=false) String sort,
			@RequestParam(value="p_no", required=false) int p_no,
			@RequestParam(value="c_no", required=false) int c_no
			) {
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("tablename", table);
		paramMap.put("b_no", b_no);
		paramMap.put("comment",comment );
		paramMap.put("sort", sort);
		paramMap.put("p_no", p_no);
		paramMap.put("c_no", c_no);
		
		BoardDTO boardDTO = this.boardService.getBoard(paramMap);
		List<BoardDTO> commentList = this.boardService.getComment(paramMap);
		
		ModelAndView mav = new ModelAndView();
		
		if(c_no!=0 || p_no!=0) {
			List<BoardDTO> commentLike = this.boardService.getCommentLike(paramMap);		
			   List<Integer> likeNoList = new ArrayList<>();
			   if (commentLike != null) {
				    for (int i = 0; i < commentLike.size(); i++) {
				        BoardDTO likeDTO = commentLike.get(i);
				        int likeNo = likeDTO.getLike_no();
				        if (likeNo != 0) {
				            likeNoList.add(likeNo);
				        }   
				    }
			   }
			mav.addObject("likeNoList", likeNoList);
		}
		
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("commentList", commentList);
		
		mav.setViewName("joongGoDetailForm.jsp");
		
		return mav;
		
	}
	

		
	
			//--------------------------------------------------------------------------------------
			// 기업정보 상세보기
			//--------------------------------------------------------------------------------------
			@RequestMapping( value="/companyListDetail.do")
			public ModelAndView companyListDetailForm( 
					
					@RequestParam(value="c_no") int c_no	,
					BoardReviewDTO boardReviewDTO


			){	
				int reviewListAllCnt =  this.boardService.getReviewListAllCnt( );
				int reviewListCnt =  this.boardService.getReviewListCnt( boardReviewDTO );
				if(boardReviewDTO.getReviewSort()==""){
					boardReviewDTO.setReviewSort(null);
				}
				Map<String,Integer> boardMap = Util.getPagingMap(
						boardReviewDTO.getSelectPageNo()       
						, boardReviewDTO.getRowCntPerPage()    
						, reviewListCnt                         
				);
				boardReviewDTO.setSelectPageNo(  (int)boardMap.get("selectPageNo")  ); 
				boardReviewDTO.setRowCntPerPage( (int)boardMap.get("rowCntPerPage") ); 
				boardReviewDTO.setBegin_rowNo(   (int)boardMap.get("begin_rowNo")   ); 
				boardReviewDTO.setEnd_rowNo(     (int)boardMap.get("end_rowNo")     ); 
				BoardDTO boardDTO = this.boardService.getcompanyListDetail(c_no);
			    List<BoardReviewDTO> reviewContent = this.boardService.getreviewContent(boardReviewDTO);
				ModelAndView mav = new ModelAndView( );
				mav.addObject("boardDTO", boardDTO);
			    mav.addObject("reviewContent", reviewContent);
				mav.setViewName("companyListDetail.jsp");
				mav.addObject("reviewListCnt", reviewListCnt+"" );
				mav.addObject("reviewListAllCnt", reviewListAllCnt );
				mav.addObject("boardMap", boardMap );
				return mav;
			}


}
