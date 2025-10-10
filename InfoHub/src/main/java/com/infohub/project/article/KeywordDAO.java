package com.infohub.project.article;

public interface KeywordDAO {

	 int countKeyword(int searchId) throws Exception;
	 public int insertKeyword(KeywordDTO KeywordDTO) throws Exception;
	 public int updateKeywordCountBySkeyword(String skeyword) throws Exception; 
	 public java.util.List<KeywordDTO> findTop7() throws Exception;
} 
