package com.infohub.project.registration;

public interface RegKeywordDAO {

	 int countKeyword(int regsearchId) throws Exception;
	 public int insertKeyword(RegKeywordDTO regKeywordDTO) throws Exception;
	 public int updateKeywordCountBySkeyword(String regkeyword) throws Exception; 
	 public java.util.List<RegKeywordDTO> findTop7() throws Exception;
	 
} 
