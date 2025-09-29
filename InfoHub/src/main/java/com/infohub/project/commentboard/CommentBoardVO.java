package com.infohub.project.commentboard;

import java.time.LocalDateTime;
import java.util.List;

public class CommentBoardVO {
	private Integer commentId;
    private Integer boardNo;
    private Integer loginNo;
    private String loginUser;
    private Integer parentCommentId; // 대댓글이면 원댓글 id, 댓글이면 null
    private String comment;
    private Integer hearts;
    private LocalDateTime createdDate;
    private LocalDateTime lastModified;
    private List<CommentBoardVO> replies; // 대댓글 리스트
    
    
    CommentBoardVO(){}


	public CommentBoardVO(Integer commentId, Integer boardNo, Integer loginNo, String loginUser, Integer parentCommentId, String comment, Integer hearts,
			LocalDateTime createdDate, LocalDateTime lastModified, List<CommentBoardVO> replies) {
		super();
		this.commentId = commentId;
		this.boardNo = boardNo;
		this.loginNo = loginNo;
		this.loginUser= loginUser;
		this.parentCommentId = parentCommentId;
		this.comment = comment;
		this.hearts = hearts;
		this.createdDate = createdDate;
		this.lastModified = lastModified;
		this.replies = replies;
	}


	public Integer getCommentId() {
		return commentId;
	}


	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}


	public Integer getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}


	public Integer getLoginNo() {
		return loginNo;
	}


	public void setLoginNo(Integer loginNo) {
		this.loginNo = loginNo;
	}


	public String getLoginUser() {
		return loginUser;
	}


	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}


	public Integer getParentCommentId() {
		return parentCommentId;
	}


	public void setParentCommentId(Integer parentCommentId) {
		this.parentCommentId = parentCommentId;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	public Integer getHearts() {
		return hearts;
	}


	public void setHearts(Integer hearts) {
		this.hearts = hearts;
	}


	public LocalDateTime getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}


	public LocalDateTime getLastModified() {
		return lastModified;
	}


	public void setLastModified(LocalDateTime lastModified) {
		this.lastModified = lastModified;
	}


	public List<CommentBoardVO> getReplies() {
		return replies;
	}


	public void setReplies(List<CommentBoardVO> replies) {
		this.replies = replies;
	}


	
    
	@Override
	public String toString() {
		return "CommentBoardVO [commentId=" + commentId + ", boardNo=" + boardNo + ", loginNo=" + loginNo
				+ ", loginUser=" + loginUser + ", parentCommentId=" + parentCommentId + ", comment=" + comment
				+ ", hearts=" + hearts + ", createdDate=" + createdDate + ", lastModified=" + lastModified
				+ ", replies=" + replies + "]";
	}


	public boolean isEdited() {//웹에서 수정됨 표시
	    return !createdDate.equals(lastModified);
	}

}
