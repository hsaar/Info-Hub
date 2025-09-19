package com.infohub.project.comment_board;

import java.time.LocalDateTime;

public class CommentVO {
	private int commentId;
	private LocalDateTime createdDate;
	private LocalDateTime privatelast_modified;
	private String comment;
	private int boardBoardNo;//fk
	private int loginId;//fk
	private int hearts;
	
	
	CommentVO(){}
	
	

	public CommentVO(int commentId, LocalDateTime createdDate, LocalDateTime privatelast_modified, String comment,
			int boardBoardNo, int loginId, int hearts) {
		super();
		this.commentId = commentId;
		this.createdDate = createdDate;
		this.privatelast_modified = privatelast_modified;
		this.comment = comment;
		this.boardBoardNo = boardBoardNo;
		this.loginId = loginId;
		this.hearts = hearts;
	}



	public int getCommentId() {
		return commentId;
	}


	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}


	public LocalDateTime getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}


	public LocalDateTime getPrivatelast_modified() {
		return privatelast_modified;
	}


	public void setPrivatelast_modified(LocalDateTime privatelast_modified) {
		this.privatelast_modified = privatelast_modified;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	public int getBoardBoardNo() {
		return boardBoardNo;
	}


	public void setBoardBoardNo(int boardBoardNo) {
		this.boardBoardNo = boardBoardNo;
	}


	public int getLoginId() {
		return loginId;
	}


	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}


	public int getHearts() {
		return hearts;
	}


	public void setHearts(int hearts) {
		this.hearts = hearts;
	}
	
	
}
