package com.infohub.project.policy;

public class PolicyDTO {
    private String title;
    private String content;
    
    // 기본 생성자
    public PolicyDTO() {}

    // 파라미터 생성자
    public PolicyDTO(String title, String content) {
        this.title = title;
        this.content = content;
    }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
}
