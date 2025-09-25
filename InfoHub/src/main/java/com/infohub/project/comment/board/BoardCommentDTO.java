package com.infohub.project.comment.board;

import java.time.LocalDateTime;

/**
 * 게시판 댓글 DTO
 */
public class BoardCommentDTO {
    private int commentId;
    private String comment;
    private LocalDateTime createdDate;
    private LocalDateTime lastModified;
    private int loginNo;
    private int boardId;

    public BoardCommentDTO() {}

    public BoardCommentDTO(int commentId, String comment, LocalDateTime createdDate,
                           LocalDateTime lastModified, int loginNo, int boardId) {
        this.commentId = commentId;
        this.comment = comment;
        this.createdDate = createdDate;
        this.lastModified = lastModified;
        this.loginNo = loginNo;
        this.boardId = boardId;
    }

    // getter / setter
    public int getCommentId() { return commentId; }
    public void setCommentId(int commentId) { this.commentId = commentId; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public LocalDateTime getCreatedDate() { return createdDate; }
    public void setCreatedDate(LocalDateTime createdDate) { this.createdDate = createdDate; }

    public LocalDateTime getLastModified() { return lastModified; }
    public void setLastModified(LocalDateTime lastModified) { this.lastModified = lastModified; }

    public int getLoginNo() { return loginNo; }
    public void setLoginNo(int loginNo) { this.loginNo = loginNo; }

    public int getBoardId() { return boardId; }
    public void setBoardId(int boardId) { this.boardId = boardId; }

    @Override
    public String toString() {
        return "BoardCommentDTO{" +
                "commentId=" + commentId +
                ", comment='" + comment + '\'' +
                ", createdDate=" + createdDate +
                ", lastModified=" + lastModified +
                ", loginNo=" + loginNo +
                ", boardId=" + boardId +
                '}';
    }
}
