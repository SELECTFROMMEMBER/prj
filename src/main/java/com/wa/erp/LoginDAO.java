package com.wa.erp;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {
	
	public int getMidPwdCnt( Map<String,String> midPwd);
	}
