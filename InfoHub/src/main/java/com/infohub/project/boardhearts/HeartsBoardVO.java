package com.infohub.project.boardhearts;

public class HeartsBoardVO {
	private int heartId;
	private int loginNo;
	private int boardno;
	private int commentId;
	private String regiDate;
	
	
	
	HeartsBoardVO(){}



	public HeartsBoardVO(int heartId, int loginNo, int boardno, int commentId, String regiDate) {
		super();
		this.heartId = heartId;
		this.loginNo = loginNo;
		this.boardno = boardno;
		this.commentId = commentId;
		this.regiDate = regiDate;
	}



	public int getHeartId() {
		return heartId;
	}



	public void setHeartId(int heartId) {
		this.heartId = heartId;
	}



	public int getLoginNo() {
		return loginNo;
	}



	public void setLoginNo(int loginNo) {
		this.loginNo = loginNo;
	}



	public int getBoardno() {
		return boardno;
	}



	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}



	public int getCommentId() {
		return commentId;
	}



	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}



	public String getRegiDate() {
		return regiDate;
	}



	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}



	@Override
	public String toString() {
		return "HeartsBoardVO [heartId=" + heartId + ", loginNo=" + loginNo + ", boardno=" + boardno + ", commentId="
				+ commentId + ", regiDate=" + regiDate + "]";
	}
	
	
}

