package com.wa.erp;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

//MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
//LoginController 클래스 선언하기
//MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
/*
 * 스프링에서 관용적으로 Controller 라는 단어가 들어간 클래스는 
 * URL 주소 접속 시 대응해서 호출되는 메소드를 소유하고 있다.
 * 클래스 이름 앞에는 @Controller 라는 어노테이션이 붙는다.
 * 클래스 내부의 URL 주소 접속 시 호출되는 메소드명 앞에는
 * @RequestMapping 이라는 어노테이션이 붙는다.
 * ------------------------------------
 * @Controller 어노테이션이 붙은 클래스 특징
 * ------------------------------------
 * 	(1) 스프링프레임워크가 알아서 객체를 생성하고 관리한다.
 *  (2) URL 주소 접속 시 대응해서 호출되는 메소드를 소유하고 있다.
*/


@Controller
public class LoginController {
	/*======================================================
	@Autowired
	접근지정자 인터페이스명 멤버변수명;
	    --------------------------------------------------
		위와 같은 멤버변수가 선언되면 아래와 같은 과정을 거친다.
			----------------------------------------------
			인터페이스명에 해당하는 인터페이스를 구현한 클래스를 찾아서
			객체화 하고 멤버변수에 객체의 메위주를 저장.
	==========================================================*/
	
	
	//===============================================
	//LoginService 인터페이스 구현한 클래스를 찾아서 객체화 해서
	//멤버변수 loginService 에 객체의 메위주를 저장.
	//즉 현재 LoginServiceImpl 객체의 메위주가 저장되어있음.
	//===============================================
	@Autowired
	private LoginService loginService;
	
	
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// 웹브라우저가 "/loginForm.do" 라는 URL 주소로 접근하면 호출되는 메소드 선언
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
		//--------------------------------------------------
		// URL 주소에 대응하여 호출되려면 메소드 앞에 
		// @RequestMapping( value="포트번호 이후 주소")  이라는 어노테이션이 붙어야한다.
		//--------------------------------------------------
		// <주의> @RequestMapping 이 붙은 메소드의 이름은 개발자 맘대로이다. 
		//        될수 있는 대로 URL 주소의 의도를 살리는 메소드 이름을 주는 것이 좋다.
	@RequestMapping( value ="/12Wa.do")
	public ModelAndView Wa12(
			) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		return mav;
	}
	
	// --------------------------------------------------
	@RequestMapping(value="/loginForm.do")
	public ModelAndView loginForm(
			//--------------------------------------
			// HttpSession 객체의 메위주를 저장하는 매개변수 session 선언하기
			// <주의>이 HttpSession 객체는 이전에 loginForm.do 로 접속 시 생성된 놈이다.
			// 이놈이 매개변수로 들어온다는 말은 뭔가 맡기겠다는 의미이다.
			// 로그인이 성공하면 아이디를 맡길 예정이다.
			//--------------------------------------
			HttpSession session
			) {
		
				//--------------------------------------------------
				// HttpSession 객체에 키값 "mid" 에 붙어 저장된 데이터 지우기
				// 즉 예전에 로그인 성공했을 때 HttpSession 객체에 저장한 로그인 아이디를 삭제한다.
				// 즉 로그 아웃을 한다.
				//--------------------------------------------------
				session.removeAttribute("mid");
		
		
				//--------------------------
				//[ModelAndView 객체] 생성하기
				//--------------------------
				ModelAndView mav = new ModelAndView();
				//--------------------------------------------------
				// [ModelAndView 객체]의 setViewName 메소드 호출하여  
				// [호출할 JSP 페이지명]을 문자로 저장하기
				//--------------------------------------------------
		
				mav.setViewName("loginForm.jsp");
				
				// [ModelAndView 객체] 리턴하기
					//[ModelAndView 객체]를 리턴한 후 스프링은
					// [ModelAndView 객체] 저장된 JSP 페이지를 찾아 호출한다.
				return mav;
			}
	
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// URL 주소  /loginProc.do 로 접근하면 호출되는 메소드 선언
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// 메소드 앞에 
	// @RequestMapping(~,~,produces="application/json;charset=UTF-8") 하고
	// @ResponseBody  가 붙으면 리턴하는 데이터가 웹브라우저에게 전송된다.
	@RequestMapping(
			value="/loginProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int loginProc(
			//--------------------------------------
			// "mid" 라는 파라미터명에 해당하는 파라미터값을 꺼내서 
			// 매개변수 mid 에 저장하고 들어온다.
			// 즉 id가 매개변수 mid로 들어온다.
			// value="mid"의 mid는 입력양식의 name 값과 동일.
			//--------------------------------------
			@RequestParam( value="pid" ) String pid
			//--------------------------------------
			// "pwd" 라는 파라미터명에 해당하는 파라미터값을 꺼내서 
			// 매개변수 pwd 에 저장하고 들어온다.
			//--------------------------------------
			,@RequestParam( value="pwd" ) String pwd
			
			//--------------------------------------
			// "autoLogin" 라는 파라미터명에 해당하는 파라미터값을 
			//		꺼내서 매개변수 autoLogin 에 저장하고 들어온다.
			// 즉 웹브라우저의 유저가 체크한 데이터가 아래 매개변수로 저장되어 들어온다. 
			// 즉 <input type="checkbox" name="autoLogin" value="yes"> 태그가 체크될 때 "yes" 값이 들어온다
			//--------------------------------------
			,@RequestParam( value="autoLogin", required=false) String autoLogin
				/*
				-----------------------------------------------------------------
				@RequestParam( value="xxx1", required=false또는true  ) String xxx2
				-----------------------------------------------------------------
					"xxx1" 이라는 파라미터명에 대응하는 파라미터값을 
									매개변수 xxx2 에 저장하고 들어와!
					required=false
						파라미터값이  없더라도 괜찮아.. 없으면 디폴트 값을 매개변수에 넣어줄께!
					required=true 
						파라미터값이  없으면 안돼...필수로 들어와..안들어오면 에러발생!
						required=true 도 없고 required=false 없으면 required=true 가 있다고 봐야함!
				*/
			//--------------------------------------
			// HttpSession 객체의 메위주를 저장하는 매개변수 session 선언하기
			// <주의>이 HttpSession 객체는 이전에 loginForm.do 로 접속 시 생성된 놈이다.
			// 이놈이 매개변수로 들어온다는 말은 뭔가 맡기겠다는 의미이다.
			// 로그인이 성공하면 아이디를 맡길 예정이다.
			//--------------------------------------
			,HttpSession session
			//--------------------------------------
			// [HtppServletResponse 객체]가 들어올 매개변수 선언
			// <주의>이 객체는 URL 접속 시 항상 새롭게 생성되고 응답메시지 전송후에 제거된다.
			// 이 객체는 응답메시지를 관리하고 있다.
			// 이놈이 매개변수로 들어온다는 말은 응답메시지에 뭔가 저장할 예정이란 의미이다.
			//--------------------------------------
			,HttpServletResponse response
			) {
				//HashMap 객체 생성하여 객체의 메위주를 변수 map에 저장하기.
				//HashMap 객체에 매개변수로 들어온 아이디를 저장하기.
				//HashMap 객체에 매개변수로 들어온 암호를 저장하기.
				// 한 HashMap 에 데이터가 다 들어있어야 DB연동하기 편하고 전송을 주고 받을 때도 편하다.
				Map<String,String> map = new HashMap<String,String>();
				// 키값은 오라클 테이블의 컬럼명과 일치해야함.
				map.put("pid", pid);
				map.put("pwd", pwd);
				
				
				//----------------------------------------------------
				// [로그인 아이디]와 [암호]의 DB 존재 개수를 저장할 변수 midPwdCnt 선언하고
				// LoginServiceImpl 객체의 getMidPwdCnt 메소드를 호출하여 얻은 데이터 저장하기
				// 즉 로그인 [아이디]와 [암호]의 DB 존재 개수를 구해서 변수 midPwdCnt 에 저장한다.
				//----------------------------------------------------
				int midPwdCnt = this.loginService.getMidPwdCnt(map);
				
//				만약에 midPwdCnt 변수안의 데이터가 1이면, 즉 아이디와 암호가 DB에 있으면
				if(midPwdCnt==1) {
//					HttpSession 객체에 로그인 아이디 저장하기
					session.setAttribute("pid", pid);
					
				//--------------------------------------
				// 매개변수 autoLogin 에 null 이 저장되어 있으면
				// 즉  [아이디,암호 자동 입력] 의사 없으면
				//--------------------------------------
					
				System.out.print(autoLogin);
				//--------------------------------------
				// 매개변수 autoLogin 에 "yes" 이 저장되어 있으면(=[아이디,암호 자동 입력]의사 있을 경우 )
				//--------------------------------------	
				if(autoLogin!=null) {
					//********************************************
					// 웹브가 파값으로 보낸 아이디,암호를 
					// 다시 [응답 메시지]에 쿠키로 저장하여
					// 웹브  쪽으로 보내기 위해 응답메시지에 저장하기
					//********************************************
					//---------------------------------------------------
					// Cookie 객체를 생성하고 쿠키명-쿠키값을 ["mid"-"입력아이디"]로 하기
					// Cookie 객체에 저장된 쿠키의 수명은 60*60*24으로 하기
					// Cookie 객체를 생성하고 쿠키명-쿠키값을 ["pwd"-"입력암호"]로 하기
					// Cookie 객체에 저장된 쿠키의 수명은 60*60*24으로 하기
					//---------------------------------------------------
					Cookie cookie1 = new Cookie("pid",pid);
						cookie1.setMaxAge(60*60*24);
					Cookie cookie2 = new Cookie("pwd",pwd);
						cookie2.setMaxAge(60*60*24);

						//---------------------------------------------------
						// Cookie 객체가 소유한 쿠키를 응답메시지에 저장하기. 
						// 응답메시지에 저장되는 쿠키는 결국 웹브라우저 즉 클라이언트쪽에 저장된다.
						//---------------------------------------------------
						response.addCookie(cookie1);
						response.addCookie(cookie2);
					}
				//--------------------------------------
				// 매개변수 autoLogin 에 null 이면
				// 즉  [아이디,암호 자동 입력] 의사 없으면
				//--------------------------------------
				else {
					//*********************************************************
					// 웹브라우저로 보낼 쿠키명-쿠키값을 만든다.
					// 웹브라우저에 저장할 쿠키명-쿠키값은 
					// "mid"-null    "pwd"-null  이다.
					// 즉 웹브라우저 쪽에 이미 있는 
					// 쿠키명 "mid" 에 대응하는 데이터를 null 로 바꾸어 무력화할 목적이다
					// 쿠키명 "pwd" 에 대응하는 데이터를 null 로 바꾸어 무력화할 목적이다
					// 이것들이 무력화 됨으로서 다음에 WAS 에 접속 시 아이디와 암호가 저장된
					// 쿠키는 들어올 수 없다.
					//*********************************************************
					
					//----------------------------------------
					// Cookie 객체를 생성하고 쿠키명-쿠키값을 ["mid"-null]로 하기
					// Cookie 객체에 저장된 쿠키의 수명은 0으로 하기
					// Cookie 객체를 생성하고 쿠키명-쿠키값을 ["pwd"-null]로 하기
					// Cookie 객체의 수명은 0으로 하기
					//----------------------------------------
					Cookie cookie1 = new Cookie("pid",null);
					cookie1.setMaxAge(0);
					Cookie cookie2 = new Cookie("pwd",null);
					cookie2.setMaxAge(0);
					
					//----------------------------------------
					// Cookie 객체가 소유한 쿠키를 응답메시지에 저장하기. 
					//----------------------------------------
					response.addCookie(cookie1);
					response.addCookie(cookie2);
					}
				}
				
				//로그인 아이디와 암호의 DB 존재 개수를 리턴하기.
				return midPwdCnt;
			}	
		
}







		/*
		@RequestMapping(value="/loginProc.do")
		public ModelAndView loginProc(
				@RequestParam( value="mid") String id, 
				@RequestParam( value="pwd") String pwd
				) {
			int idPwdCnt = 0;
			if(id.equals("abc")&&pwd.equals("123")) {			
				idPwdCnt = 1;
			}	
			
			//DB에 아이디와 암호의 존재 개수를 구하기.
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("idPwdCnt", idPwdCnt);
			mav.setViewName("loginProc.jsp");
			return mav;
		}*/