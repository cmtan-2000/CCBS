package controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.BranchDAO;
import model.Branch;

@Controller
@RequestMapping("/branch")
public class BranchController {

	BranchDAO brchDAO = new BranchDAO();
	
	@RequestMapping("/add")
	protected String add(@RequestParam Map<String, String> req) {
		
		Branch brch = new Branch();
		
		int user_id = 10;
		brch.setUser_id(user_id); // refers to company's id
		String brch_name = req.get("branchName");
		brch.setBrch_name(brch_name);
		String brch_addr = req.get("address");
		brch.setBrch_addr(brch_addr);
		String brch_post = req.get("branchPostcode");
		brch.setBrch_post(brch_post);
		String brch_city = req.get("branchCity");
		brch.setBrch_city(brch_city);
		String state = req.get("branchState");
		brch.setState(state);
		
		int rw = brchDAO.add(brch);
		
		return "redirect:/company";
		
//		return "this is from add - Branch... row affected :" + rw;
	}

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("test");
		List<Branch> branchList = brchDAO.getAll();
		model.addObject(branchList);
		return model;
	}
	
}
