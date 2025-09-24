package com.infohub.project.board;

public class BoardVO {
	private int boardno;
	private String title;
	private String content;
	private String regi_id;
	private String regi_date;
	private int readcnt;
	private int login_login_id;
	
	private int categoryId;     // 대분류 카테고리 ID
    private Integer subCategoryId; // 소분류 카테고리 ID (선택 안 할 경우 null이 될 수 있으므로 Integer 사용)

	BoardVO() {
	}

	public BoardVO(int boardno, String title, String content, String regi_id, String regi_date, int readcnt,
			int login_login_id, int categoryId, Integer subCategoryId) {
		super();
		this.boardno = boardno;
		this.title = title;
		this.content = content;
		this.regi_id = regi_id;
		this.regi_date = regi_date;
		this.readcnt = readcnt;
		this.login_login_id = login_login_id;
		this.categoryId = categoryId;
		this.subCategoryId = subCategoryId;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
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

	public String getRegi_id() {
		return regi_id;
	}

	public void setRegi_id(String regi_id) {
		this.regi_id = regi_id;
	}

	public String getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(String regi_date) {
		this.regi_date = regi_date;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public int getLogin_login_id() {
		return login_login_id;
	}

	public void setLogin_login_id(int login_login_id) {
		this.login_login_id = login_login_id;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
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
		return "BoardVO [boardno=" + boardno + ", title=" + title + ", content=" + content + ", regi_id=" + regi_id
				+ ", regi_date=" + regi_date + ", readcnt=" + readcnt + ", login_login_id=" + login_login_id
				+ ", categoryId=" + categoryId + ", subCategoryId=" + subCategoryId + "]";
	}




}
