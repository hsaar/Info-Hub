package com.infohub.project.category;

import java.util.Collections;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infohub.project.category.CategoryController;

@Controller
public class CategoryController {
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	@Autowired
	private CategoryService service;
	
	 @GetMapping("/selectcategory")
    public String writeForm(Model model) {
		 List<CategoryVO> mainCategories = service.getMainCategories();
		    System.out.println("MainCategories = " + mainCategories); // 로그 확인
        model.addAttribute("mainCategories",mainCategories);


        return "selectcategory";
    }
	 
	  // ✅ 소분류 JSON 반환용
	    @GetMapping("/selectcategory/sub")
	    @ResponseBody
	    public List<CategoryVO> getSubCategories(@RequestParam("parentId") int parentId) {
	        return service.getSubCategories(parentId);
	    }
	 
 /*     
	 // 소분류는 처음에는 비워둠
        model.addAttribute("subCategories", Collections.emptyList());
        return "selectcategory";
    }
	 
	// 대분류 선택 시 소분류 조회
	 @GetMapping("/selectcategory/sub")
	 @ResponseBody
	 public List<CategoryVO> getSubCategories(@RequestParam("parentId") int parentId) {
	     return service.getSubCategories(parentId);
	 }
*/

}
