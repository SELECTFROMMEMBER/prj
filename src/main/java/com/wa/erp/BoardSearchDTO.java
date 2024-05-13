package com.wa.erp;

import java.util.List;


//게시판 검색화면에서 검색버튼 누르면
//WAS 로 접속할 때 가져올 파라미터값을 저장할 DTO 객체 선언하기
//이 객체에는 검색조건이 주로 들어있다.
public class BoardSearchDTO {
	private String keyword;
	private String boardname;
	private String selectedIndustry;
	private int c_no;
	private int b_no;
	private String type;
	private String table;
	private double avg_star;
//	private String keyword2;
//	private String orand;
//	private List<String> checkdate;
//	private String sort;
//	private String minYear;
//	private String minMonth;
//	private String maxYear;
//	private String maxMonth;
//
	private String sort;
	private int selectPageNo;		// 선택한 페이지 번호 관련 파값 저장 변수
	private int rowCntPerPage;		// 페이지 당 보여줄 행의 개수 관련 파값 저장 변수
	private int begin_rowNo;		// 테이블 검색 시 시작행 번호 저장 변수 선언.
	private int end_rowNo;			// 테이블 검색 시 끝행 번호 저장 변수 선언.
//	
	
	
	
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public double getAvg_star() {
		return avg_star;
	}
	public void setAvg_star(double avg_star) {
		this.avg_star = avg_star;
	}
	public String getSelectedIndustry() {
		return selectedIndustry;
	}
	public void setSelectedIndustry(String selectedIndustry) {
		this.selectedIndustry = selectedIndustry;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
//	public String getOrand() {
//		return orand;
//	}
//	public void setOrand(String orand) {
//		this.orand = orand;
//	}
//	public String getKeyword2() {
//		return keyword2;
//	}
//	public void setKeyword2(String keyword2) {
//		this.keyword2 = keyword2;
//	}
//	public String getSort() {
//		return sort;
//	}
//	public void setSort(String sort) {
//		this.sort = sort;
//	}
//	public List<String> getCheckdate() {
//		return checkdate;
//	}
//	public void setCheckdate(List<String> checkdate) {
//		this.checkdate = checkdate;
//	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	public int getBegin_rowNo() {
		return begin_rowNo;
	}
	public void setBegin_rowNo(int begin_rowNo) {
		this.begin_rowNo = begin_rowNo;
	}
	public int getEnd_rowNo() {
		return end_rowNo;
	}
	public void setEnd_rowNo(int end_rowNo) {
		this.end_rowNo = end_rowNo;
	}
//	public String getMinYear() {
//		return minYear;
//	}
//	public void setMinYear(String minYear) {
//		this.minYear = minYear;
//	}
//	public String getMinMonth() {
//		return minMonth;
//	}
//	public void setMinMonth(String minMonth) {
//		this.minMonth = minMonth;
//	}
//	public String getMaxYear() {
//		return maxYear;
//	}
//	public void setMaxYear(String maxYear) {
//		this.maxYear = maxYear;
//	}
//	public String getMaxMonth() {
//		return maxMonth;
//	}
//	public void setMaxMonth(String maxMonth) {
//		this.maxMonth = maxMonth;
//	}
//	
//	
	
	
	
	
}
