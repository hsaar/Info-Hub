package com.infohub.project.hearts;

public class HeartsVO {
	private int heartId;
	private Integer category;
	private int loginLoginId;
	private Integer articleArticleId;
	private Integer boardBoardNo;
	private Integer commentBoardCommentId;

	HeartsVO() {
	}
	
	public HeartsVO(int heartId, Integer category, int loginLoginId, Integer articleArticleId, Integer boardBoardNo,
			Integer commentBoardCommentId) {
		super();
		this.heartId = heartId;
		this.category = category;
		this.loginLoginId = loginLoginId;
		this.articleArticleId = articleArticleId;
		this.boardBoardNo = boardBoardNo;
		this.commentBoardCommentId = commentBoardCommentId;
	}
	
	

	public int getHeartId() {
		return heartId;
	}

	public void setHeartId(int heartId) {
		this.heartId = heartId;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public int getLoginLoginId() {
		return loginLoginId;
	}

	public void setLoginLoginId(int loginLoginId) {
		this.loginLoginId = loginLoginId;
	}

	public Integer getArticleArticleId() {
		return articleArticleId;
	}

	public void setArticleArticleId(Integer articleArticleId) {
		this.articleArticleId = articleArticleId;
	}

	public Integer getBoardBoardNo() {
		return boardBoardNo;
	}

	public void setBoardBoardNo(Integer boardBoardNo) {
		this.boardBoardNo = boardBoardNo;
	}

	public Integer getCommentBoardCommentId() {
		return commentBoardCommentId;
	}

	public void setCommentBoardCommentId(Integer commentBoardCommentId) {
		this.commentBoardCommentId = commentBoardCommentId;
	}
	
	

}
