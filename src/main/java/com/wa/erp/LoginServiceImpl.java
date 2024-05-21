package com.wa.erp;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDAO loginDAO;
	
	public BoardDTO getMem(Map<String,String> midPwd) {
		BoardDTO getMem = this.loginDAO.getMem(midPwd);
		
		return getMem;
	}
	
	public int checkpercom(Map<String,String> midPwd) {
		
		int checkpid = this.loginDAO.checkpid(midPwd);
		if(checkpid==1) {return 1;}
		
		int checkcid = this.loginDAO.checkcid(midPwd);
		if (checkcid==1) {return 2;}
		
		return 0;
	}
	
}
