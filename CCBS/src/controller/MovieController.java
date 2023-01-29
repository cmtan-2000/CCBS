package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.MovieDAO;
import model.Movie;

@Controller
//@RequestMapping("/movie")
public class MovieController extends HttpServlet {

	MovieDAO movDAO = new MovieDAO();

	public MovieController() {
		super();
	}

	@RequestMapping("/movie/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("movieGridListView");
		List<Movie> movieList = movDAO.getAll();
		mav.addObject("movieList", movieList);
		return mav;
	}

	@RequestMapping("/movie/{id}")
	public ModelAndView view(@PathVariable Map<String, String> pathV) {
		ModelAndView mav = new ModelAndView("viewMovie");
		int id = Integer.valueOf(pathV.get("id"));
		Movie movieObject = movDAO.findById(id);
		mav.addObject("movieObject", movieObject);
		return mav;
	}

	@RequestMapping("/company/movie/index")
	public ModelAndView cIndex() {
		ModelAndView mav = new ModelAndView("movieGridListView");
		List<Movie> movieList = movDAO.getAll();
		mav.addObject("movieList", movieList);
		return mav;
	}

	@RequestMapping("/company/movie/{id}")
	public ModelAndView cView(@PathVariable Map<String, String> pathV) {
		ModelAndView mav = new ModelAndView("movieDetail");
		int id = Integer.valueOf(pathV.get("id"));
		Movie movieObject = movDAO.findById(id);
		mav.addObject("movieObject", movieObject);
		return mav;
	}

//	@PostMapping("/company/movie/create")
	@RequestMapping(value = "/company/movie/create", method = RequestMethod.POST)
	public void cCreate(@RequestParam Map<String, String> req) {
		String name = req.get("name");
		String tags = req.get("tags");
		String poster = req.get("formFile");
		String deluxePrice = req.get("deluxePrice");
		String dualmaxPrice = req.get("dualmaxPrice");
		String tdPrice = req.get("3dPrice");
		String dadbPrice = req.get("dadbPrice");
		String premiumPrice = req.get("premiumPrice");
		String classicPrice = req.get("classicPrice");
		String director = req.get("director");
		String screenplay = req.get("screenplay");
		String cast = req.get("cast");
		System.out.print(tags);

//		movDAO.add(inst);

//		ModelAndView mav = new ModelAndView("viewMovie");
//		return mav;
	}

	@RequestMapping("/company/movie/delete/{id}")
	public String cDelete(@PathVariable Map<String, String> pathV) {
		movDAO.delete(Integer.valueOf(pathV.get("id")));
		return "redirect:/company/movie/index";
	}

}
