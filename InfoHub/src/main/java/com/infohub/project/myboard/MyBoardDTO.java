package com.infohub.project.myboard;

public class MyBoardDTO {
    private int boardNo;
    private String title;
    private String content; 
    private String regiDate; 
    private int readCnt;
    private int loginNo; 

    public MyBoardDTO() {}

    // getter & setter
    public int getBoardNo() {
        return boardNo;
    }

    public void setBoardNo(int boardNo) {
        this.boardNo = boardNo;
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

    public String getRegiDate() {
        return regiDate;
    }

    public void setRegiDate(String regiDate) {
        this.regiDate = regiDate;
    }

    public int getReadCnt() {
        return readCnt;
    }

    public void setReadCnt(int readCnt) {
        this.readCnt = readCnt;
    }

    public int getLoginNo() {
        return loginNo;
    }

    public void setLoginNo(int loginNo) {
        this.loginNo = loginNo;
    }

    @Override
    public String toString() {
        return "MyBoardDTO{" +
                "boardNo=" + boardNo +
                ", title='" + title + '\'' +
                ", regiDate='" + regiDate + '\'' +
                ", readCnt=" + readCnt +
                ", loginNo=" + loginNo +
                '}';
    }
}
