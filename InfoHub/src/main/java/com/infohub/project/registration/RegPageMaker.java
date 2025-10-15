package com.infohub.project.registration;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.sound.sampled.AudioFormat.Encoding;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class RegPageMaker {

	private int displayPageNum = 5;
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private RegCriteria cri;
	
	public RegPageMaker(RegCriteria cri) {
		this.cri = cri;
	}
	
	public void setCri(RegCriteria cri) {
		this.cri=cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	
	private void calcData() {
		
		int page = this.cri.getPage();
		int perPageNum = this.cri.getPerPageNum();
		
		this.endPage = (int)(Math.ceil(page/(double)displayPageNum)*displayPageNum);
		
		this.startPage = (this.endPage-displayPageNum) + 1;
		
		int tempEndPage = (int)(Math.ceil(totalCount / (double) perPageNum));
		
		if(this.endPage > tempEndPage) {
			this.endPage = tempEndPage;
		}
		
		this.prev = (startPage != 1);
		this.next = (endPage * perPageNum < totalCount); 
	}

	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page) {
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page",page)
		.queryParam("perPageNum", cri.getPerPageNum())
		.queryParam("searchType",((RegCriteria) cri).getSearchType())
		.queryParam("keyword", encoding(((RegCriteria)cri).getKeyword())).build();
		
		return uriComponents.toUriString();
	}
	private String encoding(String keyword) {
		// TODO Auto-generated method stub
		if(keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
		
	}

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

	public int getTotalCount() {
		return totalCount;
	}

	public RegCriteria getCri() {
		return cri;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}


}
