package com.infohub.project.board;

public class BoardVO {
	private Integer boardno;
	private String title;
	private String content;
	private String regiId;
	private String regiDate;
	private Integer readcnt;
	private Integer login_loginNo;
	
	private Integer categoryId;     // 대분류 카테고리 ID
    private Integer subCategoryId; // 소분류 카테고리 ID (선택 안 할 경우 null이 될 수 있으므로 Integer 사용)

	BoardVO() {
	}

	public BoardVO(Integer boardno, String title, String content, String regiId, String regiDate, Integer readcnt,
			Integer login_loginNo, Integer categoryId, Integer subCategoryId) {
		super();
		this.boardno = boardno;
		this.title = title;
		this.content = content;
		this.regiId = regiId;
		this.regiDate = regiDate;
		this.readcnt = readcnt;
		this.login_loginNo = login_loginNo;
		this.categoryId = categoryId;
		this.subCategoryId = subCategoryId;
	}

	public Integer getBoardno() {
		return boardno;
	}

	public void setBoardno(Integer boardno) {
		this.boardno = boardno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getregiId() {
		return regiId;
	}

	public void setregiId(String regiId) {
		this.regiId = regiId;
	}

	public String getregiDate() {
		return regiDate;
	}

	public void setregiDate(String regiDate) {
		this.regiDate = regiDate;
	}

	public Integer getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(Integer readcnt) {
		this.readcnt = readcnt;
	}

	public Integer getlogin_loginNo() { return login_loginNo; }
	public void setlogin_loginNo(Integer login_loginNo) { this.login_loginNo = login_loginNo; }


	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getSubCategoryId() {
		return subCategoryId;
	}

	public void setSubCategoryId(Integer subCategoryId) {
		this.subCategoryId = subCategoryId;
	}

	@Override
	public String toString() {
		return "BoardVO [boardno=" + boardno + ", title=" + title + ", content=" + content + ", regiId=" + regiId
				+ ", regiDate=" + regiDate + ", readcnt=" + readcnt + ", login_loginNo=" + login_loginNo
				+ ", categoryId=" + categoryId + ", subCategoryId=" + subCategoryId + "]";
	}


}
