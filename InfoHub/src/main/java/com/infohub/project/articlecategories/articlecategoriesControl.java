package com.infohub.project.articlecategories;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.infohub.project.HomeController;

@Controller
public class articlecategoriesControl { 
	
	private static final Logger logger = LoggerFactory.getLogger(articlecategoriesControl.class);
	
	@Autowired
	private articlecategoriesService service;
	
	@RequestMapping("listAll")
	public String articlecategorieslistAll(Model model) throws Exception{
		logger.info("전체조회");
		List<ArticlecategoriesVO> listAll = service.articlecategorieslistAll();
		
		model.addAttribute("listAll", listAll);
		return "listAll";
	}
	
	
	
//	@RequestMapping("emplistAll")
//	public String empList(Model model)throws Exception {
//		logger.info("전체사원 조회입니다.");
//		
//		 List<EmpVO> list  = service.emplistAll();
//		 model.addAttribute("list", list);
//		
//		return "emplistAll";
//	
//	}
//	
//	@GetMapping("empselectOne")
//	public String selectOne(Model model) {
//		
//		return "empselectOne";
//	}
//	
//	@PostMapping("/selectOne")
//     public String selectOne(@RequestParam("one")int one, Model model) {
//	     try {
//	        EmpVO tmp = service.selectOne(one);
//	        model.addAttribute("one",tmp);
//	     } catch (NumberFormatException e) {
//	        // TODO Auto-generated catch block
//	        e.printStackTrace();
//	     } catch (Exception e) {
//	        // TODO Auto-generated catch block
//	        e.printStackTrace();
//	     }
//	      
//	     return "empselectOne";
//	  }
//	
//	@GetMapping("empInsert")
//	public String insert(Model model) {
//		
//		return "empInsert";
//	}
//	
//	@PostMapping("/submit")
//    public String insert(@RequestParam("empno")int empno,@RequestParam("ename")String ename,@RequestParam("job")String job, @RequestParam("mgr")int mgr, @RequestParam("hiredate")String hiredate, @RequestParam("sal")double sal,@RequestParam("comm")double comm, @RequestParam("deptno")int deptno, Model model) {
//	   	 logger.info("사원추가입니다");
//	     try {
//			service.insert(new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno));
//			model.addAttribute("result", "empInsert");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	   	 
//	    
//	  return "empInsert";
//	}
//
//	
//	@GetMapping("empUpdate")
//	public String update(Model model) {
//		
//		return "empUpdate";
//	}
//	
//	@PostMapping("update")
//	public String update(@RequestParam("empno")int empno, @RequestParam("ename")String ename,@RequestParam("job")String job, @RequestParam("mgr")int mgr, @RequestParam("hiredate")String hiredate, @RequestParam("sal")double sal,@RequestParam("comm")double comm, @RequestParam("deptno")int deptno, Model model) throws Exception{
//		logger.info("사원수정입니다");
//	   
//			service.update(new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno));
//			model.addAttribute("result", "empUpdate");
//
//		return "empUpdate";
//	}	
}
//	@GetMapping("empCount")
//	public String empcount(Model model) {
//		
//		try {
//			int cnt = service.empCount();
//			model.addAttribute("cnt", cnt);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return "home";
