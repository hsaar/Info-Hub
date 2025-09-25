package com.infohub.project.board;

public class BoardVO {
	private int boardno;
	private String category;
	private String title;
	private String content;
	private String regi_id;
	private String regi_date;
	private int readcnt;
	private int login_login_id;

	BoardVO() {
	}

	public BoardVO(int boardno, String category, String title, String content, String regi_id, String regi_date,
			int readcnt, int login_login_id) {
		super();
		this.boardno = boardno;
		this.category = category;
		this.title = title;
		this.content = content;
		this.regi_id = regi_id;
		this.regi_date = regi_date;
		this.readcnt = readcnt;
		this.login_login_id = login_login_id;
	}


	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	@Override
	public String toString() {
		return "boardVO [boardno=" + boardno + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", regi_id=" + regi_id + ", regi_date=" + regi_date + ", readcnt=" + readcnt + 
				 ", login_login_id=" + login_login_id + "]";
	}

}
