package com.infohub.project.board;

public class BoardVO {
	private Integer boardno;
	private String title;
	private String content;
	private String regiId;
	private String regiDate;
	private Integer readcnt;
	private Integer loginLoginNo;
	private Boolean isNotice;

	private Integer categoryId; // 대분류 카테고리 ID
	private Integer subCategoryId; // 소분류 카테고리 ID (선택 안 할 경우 null이 될 수 있으므로 Integer 사용)

	private String categoryName; // 대분류 이름
	private String subCategoryName; // 소분류 이름
	
	private Integer heartCount; // ✅ 좋아요 수
	private Integer commentCount;
	private String imagePath;

	BoardVO() {
	}

	
	public BoardVO(Integer boardno, String title, String content, String regiId, String regiDate, Integer readcnt,
			Integer loginLoginNo, Boolean isNotice, Integer categoryId, Integer subCategoryId, String categoryName,
			String subCategoryName, Integer heartCount, Integer commentCount, String imagePath) {
		super();
		this.boardno = boardno;
		this.title = title;
		this.content = content;
		this.regiId = regiId;
		this.regiDate = regiDate;
		this.readcnt = readcnt;
		this.loginLoginNo = loginLoginNo;
		this.isNotice = isNotice;
		this.categoryId = categoryId;
		this.subCategoryId = subCategoryId;
		this.categoryName = categoryName;
		this.subCategoryName = subCategoryName;
		this.heartCount = heartCount;
		this.commentCount = commentCount;
		this.imagePath = imagePath;
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

	public Integer getLoginLoginNo() {
		return loginLoginNo;
	}

	public void setLoginLoginNo(Integer loginLoginNo) {
		this.loginLoginNo = loginLoginNo;
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

	public Integer getHeartCount() {
		return heartCount;
	}

	public void setHeartCount(Integer heartCount) {
		this.heartCount = heartCount;
	}

	public Boolean getIsNotice() {
		return isNotice;
	}

	public void setIsNotice(Boolean isNotice) {
		this.isNotice = isNotice;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}


	@Override
	public String toString() {
		return "BoardVO [boardno=" + boardno + ", title=" + title + ", content=" + content + ", regiId=" + regiId
				+ ", regiDate=" + regiDate + ", readcnt=" + readcnt + ", loginLoginNo=" + loginLoginNo + ", isNotice="
				+ isNotice + ", categoryId=" + categoryId + ", subCategoryId=" + subCategoryId + ", categoryName="
				+ categoryName + ", subCategoryName=" + subCategoryName + ", heartCount=" + heartCount
				+ ", commentCount=" + commentCount + ", imagePath=" + imagePath + "]";
	}



	
	
}
