package com.wa.erp;

import java.util.Map;

public interface LoginService {
	
	
	public BoardDTO getMem(Map<String,String> midPwd);
	
	public int checkpercom(Map<String,String> midPwd);
	}
