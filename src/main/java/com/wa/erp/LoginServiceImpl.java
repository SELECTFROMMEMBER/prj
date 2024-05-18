package com.wa.erp;

import java.util.Map;

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
public class LoginServiceImpl implements LoginService{
	
	//==============================================
	// @Autowired
	// 접근지정자  인터페이스명 멤버변수명;
	//==============================================
		//---------------------------------------------
		// 위와 같은 멤버변수가 선언되면 아래와 같은 과정을 거친다.
		//---------------------------------------------
			// 인터페이스명에 해당하는 인터페이스를 구현한 클래스를 찾아서 
			// 객체화 하고 멤버변수에 객체의 메위주를 저장.
	
	//==============================================
	// LoginDAO 인터페이스 구현한 클래스를 찾아서 객체화 해서  
	// 멤버변수 loginDAO 에 객체의 메위주를 저장.
	// 즉 현재 LoginDAOImpl 객체의 메위주가 저장되었음
	//==============================================
	@Autowired
	private LoginDAO loginDAO;
	
	//==============================================
	// 로그인 아이디와 암호의 존재의 개수를 리턴하는 메소드 선언
	// 매개변수로는 웹브가 보낸 아이디와 암호가 저장된
	// HashMap 객체가 들어 오고 있다.
	//==============================================
	public int getMidPwdCnt(Map<String,String> midPwdMap){
		
		//----------------------------------------------------
		// [로그인 아이디]와 [암호]의 DB 존재 개수를 저장할 변수 midPwdCnt 선언하고
		// LoginServiceImpl 객체의 getMidPwdCnt 메소드를 호출하여 얻은 데이터 저장하기
		// 즉 로그인 [아이디]와 [암호]의 DB 존재 개수를 구해서 변수 midPwdCnt 에 저장한다.
		//----------------------------------------------------
		int midPwdCnt = this.loginDAO.getMidPwdCnt(midPwdMap);
		//----------------------------------------------------
		// [로그인 아이디]와 [암호]의 DB 존재 개수를 리턴하기
		//----------------------------------------------------
		return midPwdCnt;
	}
}
