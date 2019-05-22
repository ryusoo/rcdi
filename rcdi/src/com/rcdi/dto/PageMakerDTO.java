package com.rcdi.dto;

public class PageMakerDTO { // 페이지 네이션
	private int totalCount;	// 전체 데이터 개수
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	private boolean prev; // 이전 페이지
	private boolean next; // 이후 페이지
	private int displayPageNum = 10; // 화면에 보여지는 블럭 수
 	private int finalPage;
	private CriteriaDTO criDto;
	int displayPagehalf = 4; // page 중앙일 때 왼쪽 오른쪽 몇개를 띄워줄 것인지 정해줌.
	//page(), pagestart(), perPageNum()
	
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
	}
	
	private void calcData() {
		int temp;
		finalPage = (int)Math.ceil(totalCount/(double)(displayPageNum));
		if(criDto.getPage()-displayPagehalf<=0) {
			temp = criDto.getPage()-1;
			endPage = ((displayPagehalf*2)-temp)+criDto.getPage();
			if(endPage>finalPage) {
				endPage = finalPage;
			}
			startPage = 1;
			if(criDto.getPage()<1) {
				criDto.setPage(1);
			}else if(criDto.getPage()>finalPage) {
				criDto.setPage(finalPage);
			}
		}else if(criDto.getPage()+displayPagehalf > finalPage) {
			temp = finalPage - criDto.getPage();
			startPage = criDto.getPage()-((displayPagehalf*2)-temp);
			endPage = finalPage;
			if(criDto.getPage()>finalPage) {
				criDto.setPage(finalPage);
			}
		}else {
			startPage = criDto.getPage()-displayPagehalf;
			endPage = criDto.getPage()+displayPagehalf;
		}
		prev = startPage==1?false:true;
		next = endPage == finalPage? false:true;
	}
	/*
	private void calcData() {
		// Math 클래스의 ceil 메서드는 무조건 소수점을 올림함
		endPage = (int)Math.ceil(criDto.getPage() / (double)displayPageNum) * displayPageNum;
		// 10								2 / 10 = 0.2 => 1 * 10
		startPage = (endPage - displayPageNum) + 1;
		// 1
		int tempEndPage = (int)(Math.ceil(totalCount / (double)(criDto.getPerPageNum() / criDto.getPage())));
		// 62								310 / ( 10 / 2) => 62
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false: true;
		// false
		next = (endPage *(criDto.getPerPageNum()/criDto.getPage())) >= totalCount ? false: true;
		// true
		finalPage = (int)Math.ceil(totalCount / (double)(displayPageNum));
		// 31
	}
	*/
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getFinalPage() {
		return finalPage;
	}
	public void setFinalPage(int finalPage) {
		this.finalPage = finalPage;
	}
	public CriteriaDTO getCriDto() {
		return criDto;
	}
	public void setCriDto(CriteriaDTO criDto) {
		this.criDto = criDto;
	}
	
	
	
	@Override
	public String toString() {
		return "PageMakerDTO [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", finalPage="
				+ finalPage + "]";
	}
	
	
	
	
	
	
	
}
