package com.wa.erp;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {
	
	public BoardDTO getMem(Map<String,String> midPwd);
	
	public int checkpid(Map<String,String> midPwd);
	
	public int checkcid(Map<String,String> midPwd);
	}
