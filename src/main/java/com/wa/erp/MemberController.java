package com.wa.erp;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value="/myPage.do")
	public ModelAndView myPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage.jsp");
		return mav;
	}
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/myCompany.do")
	public ModelAndView myCompany(
			@RequestParam(value="c_no") int c_no)
			 {
		
		List<BoardDTO> gongMoList = this.boardService.getMyGongMoList(c_no);
		
		List<BoardDTO> gongGoList = this.boardService.getMyGongGoList(c_no);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("gongGoList", gongGoList);
		
		mav.addObject("gongMoList", gongMoList);
		
		mav.setViewName("myCompany.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/memberRegForm.do")
	public ModelAndView memberRegForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberRegForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/personalRegForm.do")
	public ModelAndView personalRegForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("personalRegForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/companyRegForm.do")
	public ModelAndView companyRegForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("companyRegForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/resumRegForm.do")
	public ModelAndView resumRegForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("resumRegForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/companyUpdelForm.do")
	public ModelAndView companyUpdelForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("companyUpdelForm.jsp");
		return mav;
	}
	
//	@RequestMapping(value="/timeShareRegForm.do")
//	public ModelAndView timeShareRegForm() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("timeShareRegForm.jsp");
//		return mav;
//	}
	
	@RequestMapping(
			value="/memProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public Map<String,String> insertMemProc(
			//-------------------------------------------
			//파라미터값이 저장된 [BoardDTO 객체]가 들어올 매개변수 선언
			//-------------------------------------------
				//[파라미터명]과 [BoardDTO 객체]의 멤버변수명이 같으면
				//setter 메소드가 작동되어 [파라미터값]이 [멤버변수]에 저장된다.
				MemberDTO memberDTO
			) {
//		게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
		Map<String,String> resultMap = new HashMap<String,String>();

		

		//-------------------------------------------
		// [BoardServiceImpl 객체]의 updateBoard 메소드 호출로 
		// 게시판 글 수정하고 [수정 적용행의 개수] 얻기
		//-------------------------------------------
		int insertMemCnt = this.memberService.insertMember(memberDTO);
		
		//-------------------------------------------
		// HashMap 객체에 게시판 수정 행의 개수 저장하기
		//-------------------------------------------
		resultMap.put("result", insertMemCnt+"");

		//-------------------------------------------
		// HashMap 객체의 메위주 리턴하기
		//-------------------------------------------
		return resultMap;
	}

	/*--------------회사회원가입----------------*/
	@RequestMapping( 
			value="/comProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public Map<String,String> comRegProc (  
			MemberDTO  companyDTO
	){

		Map<String,String> resultMap = new HashMap<String,String>();

		int companyRegCnt = this.memberService.insertCompany(companyDTO);

		resultMap.put( "result", companyRegCnt+"" );

		return resultMap;
	}
	/*----------------------------------------*/
	
	
	
	
	
	
	
	
	/*--------------회사정보등록----------------*/
	@RequestMapping( 
			value="/comUpDelProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public Map<String,String> comInfoProc (  
			MemberDTO  companyDTO
	){

		Map<String,String> resultMap = new HashMap<String,String>();

		int companyInfoCnt = this.memberService.insertCompanyInfo(companyDTO);

		resultMap.put( "result", companyInfoCnt+"" );

		return resultMap;
	}
	/*----------------------------------------*/
	
	
	
}






