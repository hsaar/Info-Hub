package com.infohub.project.myscraps;

public class ScrapDTO {
    private int scrapsNo;
    private int loginNo;
    private int registrationNo;
    private int policyId;
    private String createdDate;

    // 정책 정보 임시 필드(title, content)
    private String policyTitle;
    private String policyContent;
    private int policyCategoryId;
    private String policyApplicationEnd;

    
    public ScrapDTO() {}

    // getter & setter
    public int getScrapNo() { return scrapsNo; }
    public void setScrapNo(int scrapNo) { this.scrapsNo = scrapNo; }

    public int getLoginNo() { return loginNo; }
    public void setLoginNo(int loginNo) { this.loginNo = loginNo; }

    public int getRegistrationNo() { return registrationNo; }
    public void setRegistrationNo(int registrationNo) { this.registrationNo = registrationNo; }

    public int getPolicyId() { return policyId; }
    public void setPolicyId(int policyId) { this.policyId = policyId; }

    public String getCreatedAt() { return createdDate; }
    public void setCreatedAt(String createdAt) { this.createdDate = createdAt; }

    public String getPolicyTitle() { return policyTitle; }
    public void setPolicyTitle(String policyTitle) { this.policyTitle = policyTitle; }

    public String getPolicyContent() { return policyContent; }
    public void setPolicyContent(String policyContent) { this.policyContent = policyContent; }

    public int getPolicyCategoryId() { return policyCategoryId; }
    public void setPolicyCategoryId(int policyCategoryId) { this.policyCategoryId = policyCategoryId; }

    public String getPolicyApplicationEnd() { return policyApplicationEnd; }
    public void setPolicyApplicationEnd(String policyApplicationEnd) { this.policyApplicationEnd = policyApplicationEnd; }
}

