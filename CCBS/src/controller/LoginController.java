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

	@RequestMapping("/company")
	public ModelAndView companyDashboard() {
		ModelAndView mav = new ModelAndView("index");
		MovieDAO movDAO = new MovieDAO();
		List<Movie> movieList = movDAO.getAll();
		mav.addObject("movieList", movieList);
		mav.addObject("allTags", movDAO.getAllMovieTags());
		mav.addObject("allGenres", movDAO.getAllMovieGenres());
		return mav;
	}

	@RequestMapping("/loginError")
	public ModelAndView loginError() {
		ModelAndView mav = new ModelAndView("errorLogin");
		return mav;
	}

}
