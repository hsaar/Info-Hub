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

    private String categoryName;         // 대분류 이름
    private String subCategoryName;      // 소분류 이름
    
    private int heartCount; // ✅ 좋아요 수
	BoardVO() {
	}

	
	public BoardVO(Integer boardno, String title, String content, String regiId, String regiDate, Integer readcnt,
			Integer login_loginNo, Integer categoryId, Integer subCategoryId, String categoryName,
			String subCategoryName, int heartCount) {
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
		this.categoryName = categoryName;
		this.subCategoryName = subCategoryName;
		this.heartCount = heartCount;
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

	public String getRegiId() {
		return regiId;
	}

	public void setRegiId(String regiId) {
		this.regiId = regiId;
	}

	public String getRegiDate() {
		return regiDate;
	}

	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}

	public Integer getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(Integer readcnt) {
		this.readcnt = readcnt;
	}

	public Integer getLogin_loginNo() {
		return login_loginNo;
	}

	public void setLogin_loginNo(Integer login_loginNo) {
		this.login_loginNo = login_loginNo;
	}

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

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getSubCategoryName() {
		return subCategoryName;
	}

	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}

	
	
	public int getHeartCount() {
		return heartCount;
	}


	public void setHeartCount(int heartCount) {
		this.heartCount = heartCount;
	}


	@Override
	public String toString() {
		return "BoardVO [boardno=" + boardno + ", title=" + title + ", content=" + content + ", regiId=" + regiId
				+ ", regiDate=" + regiDate + ", readcnt=" + readcnt + ", login_loginNo=" + login_loginNo
				+ ", categoryId=" + categoryId + ", subCategoryId=" + subCategoryId + ", categoryName=" + categoryName
				+ ", subCategoryName=" + subCategoryName + ", heartCount=" + heartCount + "]";
	}


	
	
	
	
}
