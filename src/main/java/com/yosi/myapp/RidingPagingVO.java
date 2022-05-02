package com.yosi.myapp;

public class RidingPagingVO {
	// 페이징
	private int onePageRecord = 9; // 한 페이지당 출력 할 페이지 수
	private int pageNum = 1; // 현재 페이지
	private int totalRecord;
	private int totalRecord1; // 총 레코드 수
	private int totalRecord2; // 총 레코드 수
	private int totalRecord3; // 총 레코드 수
	private int totalPage; // 총 페이지 수
	private int totalPage1; // 총 페이지 수
	private int totalPage2; // 총 페이지 수
	private int totalPage3; // 총 페이지 수
	private int offsetIndex = 0;
	private int onePageCount = 9; // 한 번에 표시할 레코드 수
	private int startPage = 1;

	// 검색
	private String searchKey;
	private String searchWord;

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		// offset 위치 계산
		offsetIndex = (pageNum - 1) * onePageRecord;
		// 페이지 번호의 시작값
		startPage = ((pageNum - 1) / onePageCount * onePageCount) + 1;
	}

	//
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;

		// 총 페이지 수
		if (totalRecord % onePageRecord == 0) { // 나머지 레코드가 없는 경우
			totalPage = totalRecord / onePageRecord;
		} else { // 나머지 레코드가 있는 경우 (1~4개)
			totalPage = totalRecord / onePageRecord + 1;
		}
	}
	
	//
	public int getTotalRecord1() {
		return totalRecord1;
	}
	public void setTotalRecord1(int totalRecord1) {
		this.totalRecord1 = totalRecord1;

		// 총 페이지 수
		if (totalRecord1 % onePageRecord == 0) { // 나머지 레코드가 없는 경우
			totalPage1 = totalRecord1 / onePageRecord;
		} else { // 나머지 레코드가 있는 경우 (1~4개)
			totalPage1 = totalRecord1 / onePageRecord + 1;
		}
	}
	
	public int getTotalRecord2() {
		return totalRecord2;
	}

	public void setTotalRecord2(int totalRecord2) {
		this.totalRecord2 = totalRecord2;

		// 총 페이지 수
		if (totalRecord2 % onePageRecord == 0) { // 나머지 레코드가 없는 경우
			totalPage2 = totalRecord2 / onePageRecord;
		} else { // 나머지 레코드가 있는 경우 (1~4개)
			totalPage2 = totalRecord2 / onePageRecord + 1;
		}
	}
	public int getTotalRecord3() {
		return totalRecord3;
	}

	public void setTotalRecord3(int totalRecord3) {
		this.totalRecord3 = totalRecord3;

		// 총 페이지 수
		if (totalRecord3 % onePageRecord == 0) { // 나머지 레코드가 없는 경우
			totalPage3 = totalRecord3 / onePageRecord;
		} else { // 나머지 레코드가 있는 경우 (1~4개)
			totalPage3 = totalRecord3 / onePageRecord + 1;
		}
	}
	
	//

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getTotalPage1() {
		return totalPage1;
	}

	public void setTotalPage1(int totalPage1) {
		this.totalPage1 = totalPage1;
	}

	public int getTotalPage2() {
		return totalPage2;
	}

	public void setTotalPage2(int totalPage2) {
		this.totalPage2 = totalPage2;
	}

	public int getTotalPage3() {
		return totalPage3;
	}

	public void setTotalPage3(int totalPage3) {
		this.totalPage3 = totalPage3;
	}

	public int getOffsetIndex() {
		return offsetIndex;
	}

	public void setOffsetIndex(int offsetIndex) {
		this.offsetIndex = offsetIndex;
	}

	public int getOnePageCount() {
		return onePageCount;
	}

	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
}
