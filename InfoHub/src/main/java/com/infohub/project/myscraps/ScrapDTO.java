package com.infohub.project.myscraps;

public class ScrapDTO {
    private int scrapsNo;
    private int loginNo;
    private int policyId;
    private String createdDate;

    // 정책 정보 임시 필드(title, content)
    private String policyTitle;
    private String policyContent;
    
    public ScrapDTO() {}

    // getter & setter
    public int getScrapId() { return scrapsNo; }
    public void setScrapId(int scrapId) { this.scrapsNo = scrapId; }

    public int getLoginId() { return loginNo; }
    public void setLoginId(int loginId) { this.loginNo = loginId; }

    public int getPolicyId() { return policyId; }
    public void setPolicyId(int policyId) { this.policyId = policyId; }

    public String getCreatedAt() { return createdDate; }
    public void setCreatedAt(String createdAt) { this.createdDate = createdAt; }

    public String getPolicyTitle() { return policyTitle; }
    public void setPolicyTitle(String policyTitle) { this.policyTitle = policyTitle; }

    public String getPolicyContent() { return policyContent; }
    public void setPolicyContent(String policyContent) { this.policyContent = policyContent; }

}
