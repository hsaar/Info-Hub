/*
 * Table: commentboard
Columns:
commentId int AI PK 
hearts int 
loginUser varchar(45) 
boardno int 
loginNo int 
parentCommentId int 
comment varchar(255) 
createdDate datetime 
lastModified
 */

package com.infohub.project.boardcomment;

import java.time.LocalDateTime;
import java.util.List;

public class CommentBoardVO {
	private Integer commentId;
    private Integer boardno;
    private Integer loginNo;
    private String loginUser;
    private Integer parentCommentId; // 대댓글이면 원댓글 id, 댓글이면 null
    private String comment;
    private Integer hearts;
    private String createdDate;
    private String lastModified;
    private List<CommentBoardVO> replies; // 대댓글 리스트
    private int isDeleted;
    
    
    CommentBoardVO(){}

    
    
	public CommentBoardVO(Integer commentId, Integer boardno, Integer loginNo, String loginUser,
			Integer parentCommentId, String comment, Integer hearts, String createdDate, String lastModified,
			List<CommentBoardVO> replies, int isDeleted) {
		super();
		this.commentId = commentId;
		this.boardno = boardno;
		this.loginNo = loginNo;
		this.loginUser = loginUser;
		this.parentCommentId = parentCommentId;
		this.comment = comment;
		this.hearts = hearts;
		this.createdDate = createdDate;
		this.lastModified = lastModified;
		this.replies = replies;
		this.isDeleted =isDeleted;
	}
	
	

	@Override
	public String toString() {
		return "CommentBoardVO [commentId=" + commentId + ", boardno=" + boardno + ", loginNo=" + loginNo
				+ ", loginUser=" + loginUser + ", parentCommentId=" + parentCommentId + ", comment=" + comment
				+ ", hearts=" + hearts + ", createdDate=" + createdDate + ", lastModified=" + lastModified
				+ ", replies=" + replies + ", isDeleted="+ isDeleted + "]";
	}



	public Integer getCommentId() {
		return commentId;
	}



	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}



	public Integer getboardno() {
		return boardno;
	}



	public void setboardno(Integer boardno) {
		this.boardno = boardno;
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



	public String getCreatedDate() {
		return createdDate;
	}



	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}



	public String getLastModified() {
		return lastModified;
	}



	public void setLastModified(String lastModified) {
		this.lastModified = lastModified;
	}



	public List<CommentBoardVO> getReplies() {
		return replies;
	}



	public void setReplies(List<CommentBoardVO> replies) {
		this.replies = replies;
	}



	public boolean isEdited() {//웹에서 수정됨 표시
	    return !createdDate.equals(lastModified);
	}



	public int getIsDeleted() {
		return isDeleted;
	}



	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}

	
	
}
