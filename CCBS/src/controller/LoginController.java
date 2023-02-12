package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.BranchDAO;
import bdUtil.HallDAO;
import bdUtil.MovieDAO;
import model.*;

//@WebServlet("/LoginController")
@Controller
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	@PostMapping("/login")
	protected String login(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, String> req) throws ServletException, IOException {

		ModelAndView model = null;

		String username = req.get("username");
		String password = req.get("password");

		User user = new User();
		user.setUserName(username);
		user.setPassword(password);

		if (username.equals("admin") && password.equals("admin")) {
			return "redirect:/admin";
		} else if (username.equals("company") && password.equals("company")) {
			return "redirect:/company";
		} else if (username.equals("user") && password.equals("user")) {
			return "redirect:/";
		}
		return "redirect:/loginError";
	}

	@RequestMapping("/")
	public ModelAndView userDashboard() {
		ModelAndView mav = new ModelAndView("viewMovie");
		return mav;
	}

	@RequestMapping("/admin")
	public ModelAndView adminDashboard() {
		ModelAndView mav = new ModelAndView("adminDashboard");
		return mav;
	}

	@SuppressWarnings({ "null", "unchecked", "unused", "rawtypes" })
	@RequestMapping("/company")
	public ModelAndView companyDashboard() {
		ModelAndView mav = new ModelAndView("index");
		MovieDAO movDAO = new MovieDAO();
		BranchDAO brchDAO = new BranchDAO();
		HallDAO hallDAO = new HallDAO();
		
		List<Movie> movieList = movDAO.getAll();
		List<Branch> brchList = brchDAO.getAll();
		List<Hall> hallList = hallDAO.getAll();
		
		
//		TODO: need to define the company id
//		System.out.println("This is what u want"+hallList);
		int company_id = 10;
		List<Branch> compBrchList = brchDAO.getCompanyBranch(company_id );
				
		/*
		 * // need to searh each the branch listed here, and get the specific hall
		 * for(Branch brch : compBrchList) { List BrchHallPack = null;
		 * System.out.println(brch.getBrch_id()); List<Hall> hallList =
		 * hallDAO.getBranchHall(brch.getBrch_id());
		 * System.out.println(hallList.size());
		 * 
		 * BrchHallList.add(hallList); // find the specific branch id , and }
		 * 
		 * System.out.println(BrchHallList);
		 */
		
		mav.addObject("movieList", movieList);
//		mav.addObject("branchList", brchList);
		mav.addObject("compBrchList", compBrchList);
		mav.addObject("hallList", hallList);
		return mav;
	}

	@RequestMapping("/loginError")
	public ModelAndView loginError() {
		ModelAndView mav = new ModelAndView("errorLogin");
		return mav;
	}

}
