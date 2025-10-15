package com.infohub.project.myboard;

public class MyBoardDTO {
    private int boardno;
    private String title;
    private String content; 
    private String regiDate; 
    private int readCnt;
    private int loginNo; 
    
    // 정렬
    private int hearts;
    private int categoryId;

    public MyBoardDTO() {}

    // getter & setter
    public int getBoardNo() {
        return boardno;
    }

    public void setBoardNo(int boardno) {
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
    
    public int getHearts(){ 
    	return hearts; 
    }
    
    public void setHearts(int hearts) { 
    	this.hearts = hearts;
    }
    
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "MyBoardDTO{" +
                "boardNo=" + boardno +
                ", title='" + title + '\'' +
                ", regiDate='" + regiDate + '\'' +
                ", readCnt=" + readCnt +
                ", loginNo=" + loginNo +
                '}';
    }
}
