package com.infohub.project.boardhearts;

public class HeartsBoardVO {
	private int heartId;
	private int loginNo;
	private int boardno;
	private int commentId;
	private String regiDate;
	private boolean liked; //게시글 좋아요 여부 확인
	
	
	
	public HeartsBoardVO(){}



	public HeartsBoardVO(int heartId, int loginNo, int boardno, int commentId, String regiDate, boolean liked) {
		super();
		this.heartId = heartId;
		this.loginNo = loginNo;
		this.boardno = boardno;
		this.commentId = commentId;
		this.regiDate = regiDate;
		this.liked = liked;
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



	public boolean isLiked() {
		return liked;
	}



	public void setLiked(boolean liked) {
		this.liked = liked;
	}



	@Override
	public String toString() {
		return "HeartsBoardVO [heartId=" + heartId + ", loginNo=" + loginNo + ", boardno=" + boardno + ", commentId="
				+ commentId + ", regiDate=" + regiDate + ", liked=" + liked + "]";
	}



	
	
	
}

