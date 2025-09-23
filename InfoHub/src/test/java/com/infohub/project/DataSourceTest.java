package com.infohub.project;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.junit.Assert.assertEquals;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.infohub.project.searchlistAll.Criteria;
import com.infohub.project.searchlistAll.SearchListAllControl;
import com.infohub.project.searchlistAll.SearchListAllDAO;
import com.infohub.project.searchlistAll.SearchListAllDTO;
import com.infohub.project.searchlistAll.SearchListAllService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class DataSourceTest {
	private static final Logger logger = LoggerFactory.getLogger(SearchListAllControl.class);
	@Autowired  //spring 전용, @Inject : 자바/spring, @Resource : 이름으로 연결
	private DataSource dataSource;
	
	@Inject
	private SearchListAllService service;
	SearchListAllDAO dao;
			
//	@Test
//	public void testListCriteria()throws Exception{
//
//		Criteria cri = new Criteria();
//		cri.setPage(2);
//		cri.setPerPageNum(20);
//		
//		
//		List<SearchListAllDTO> list = dao.listCriteria(cri);
//		
//		for (SearchListAllDTO searchlistAllDTO : list) {
//			logger.info(searchlistAllDTO.getArticle_id() + ":" + searchlistAllDTO.getTitle());
//		}
//	}
	
	@Test
	public void listPageTest() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		List<SearchListAllDTO> lists = service.listPage(cri);
		for (SearchListAllDTO list : lists) {
			logger.info(list.getArticle_id()+ ":" + list.getTitle());
		}		
	}
	
	@Test
	public void getTotalCountTest() throws Exception {
		Criteria cri = new Criteria();
		Integer totalCount = service.getTotalCount(cri);
		logger.info("totalCount: "+totalCount.toString());
	}
	
	@Test
	public void uriTest() {
		int page = 6;
		int perPageNum = 10;
		
		UriComponents uriComponets = UriComponentsBuilder.newInstance()
				.path("/board/listPage")
				.queryParam("page", page)
				.queryParam("perPageNum", perPageNum)
				.build();
		
		String uri = "/board/listPage?page=" + page + "&perPageNum=" + perPageNum;
		
		logger.info(uri);
		logger.info(uriComponets.toString());
		//같지 않으면 에러
		assertEquals(uri, uriComponets.toString());
	}
}

