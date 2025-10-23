package com.infohub.project.article;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.infohub.project.openapi.ElasticsearchService;

@Service
public class ArticleServiceImpl implements ArticleService{
	
	@Autowired
	ArticleDAO dao;
	
	@Autowired
    private ElasticsearchService esService;
	

	@Override
	public List<ArticleVO> articlListAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll(cri);
	}
	
	@Override
	public List<ArticleVO> articlListAll1(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll1(cri);
	}

	@Override
	public List<ArticleVO> articlListAll2(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll2(cri);
	}

	@Override
	public List<ArticleVO> articlListAll3(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll3(cri);
	}

	@Override
	public List<ArticleVO> articlListAll4(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll4(cri);
	}

	@Override
	public List<ArticleVO> articlListAll5(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll5(cri);
	}
	
	@Override
	public List<ArticleVO> articlListAll6(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll6(cri);
	}

	@Override
	public List<ArticleVO> articleContent(int articleId) throws Exception {
		// TODO Auto-generated method stub
		dao.updateViews(articleId);
		
		 List<ArticleVO> articles = dao.articleContent(articleId);
		    if (articles != null && !articles.isEmpty()) {
		        ArticleVO article = articles.get(0);

		        // 3️⃣ Elasticsearch 업데이트 (커스텀 esService 사용)
		        Map<String, Object> updateFields = new HashMap<>();
		        updateFields.put("views", article.getViews()); // DB에서 증가된 조회수
		        updateFields.put("hearts", article.getHearts());

		        esService.updateDocument("news_index", String.valueOf(article.getArticleId()), updateFields);
		    }
		
		return dao.articleContent(articleId);
	}

	@Override
	public int countHearts(int articleId) throws Exception {
		// TODO Auto-generated method stub
		return dao.countHearts(articleId);
	}

	@Override
	public List<ArticleVO> result(int articleId) throws Exception {
		// TODO Auto-generated method stub
		return dao.result(articleId);
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalCount(cri);
	}

	@Override
	public List<ArticleVO> noArticleContent(int articleId) throws Exception {
		// TODO Auto-generated method stub
		dao.updateViews(articleId);
		
		List<ArticleVO> articles = dao.articleContent(articleId);
	    if (articles != null && !articles.isEmpty()) {
	        ArticleVO article = articles.get(0);

	        // 3️⃣ Elasticsearch 업데이트 (커스텀 esService 사용)
	        Map<String, Object> updateFields = new HashMap<>();
	        updateFields.put("views", article.getViews()); // DB에서 증가된 조회수
	        updateFields.put("hearts", article.getHearts());

	        esService.updateDocument("news_index", String.valueOf(article.getArticleId()), updateFields);
	    }
		return dao.articleContent(articleId);
	}

	@Override
	public List<ArticleVO> viewsArticle() throws Exception {
		// TODO Auto-generated method stub
		return dao.viewsArticle();
	}

	@Override
	public List<ArticleVO> findAllArticles() throws Exception {
		// TODO Auto-generated method stub
		return dao.findAllArticles();
	}

	@Override
	public int getTotalCountByCategory(int articlecategories_categoriesNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalCountByCategory(articlecategories_categoriesNo);
	}

	@Override
	public List<ArticleVO> elasticArticles() throws Exception {
		// TODO Auto-generated method stub
		return dao.elasticArticles();
	}

	

}
