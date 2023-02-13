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
public class MovieController extends HttpServlet {

	MovieDAO movDAO = new MovieDAO();

	public MovieController() {
		super();
	}

	@RequestMapping("/movie/{id}")
	public ModelAndView view(@PathVariable Map<String, String> pathV) {
		ModelAndView mav = new ModelAndView("viewMovie");
		int id = Integer.valueOf(pathV.get("id"));
		Movie movieObject = movDAO.findById(id);
		mav.addObject("movie", movieObject);
		return mav;
	}

	@RequestMapping("/movie/{id}/view")
	public ModelAndView cIndex(@PathVariable Map<String, String> pathV,
			@RequestParam(value = "company", required = false, defaultValue = "") String company,
			@RequestParam(value = "city", required = false, defaultValue = "Kuala Lumpur") String city,
			@RequestParam(value = "state", required = false, defaultValue = "Selangor") String state,
			@RequestParam(value = "date", required = false, defaultValue = "2023-02-13") String date) {
		ModelAndView mav = new ModelAndView("movieHomePage");
		int movieId = Integer.valueOf(pathV.get("id"));
		Movie movieObject = movDAO.findById(movieId);
		mav.addObject("movie", movieObject);
		if (city != "" && state != "" && date != "")
			mav.addObject("branchMovie", movDAO.getBranchMovie(movieId, company, city, state, date));
		return mav;
	}

	// home page for company is /company ->index.jsp
	@RequestMapping("/company/movie/{id}")
	public ModelAndView cView(@PathVariable Map<String, String> pathV) {
		ModelAndView mav = new ModelAndView("movieDetail");
		int id = Integer.valueOf(pathV.get("id"));
		Movie movieObject = movDAO.findById(id);
		mav.addObject("movie", movieObject);
		mav.addObject("moviePrices", movDAO.getMoviePrices(id));
		mav.addObject("allTags", movDAO.getAllMovieTags());
		mav.addObject("allGenres", movDAO.getAllMovieGenres());
		return mav;
	}

	@PostMapping("/company/movie/create") // create+update in insertMovieModal.jsp
	public String cCreate(@RequestParam Map<String, String> req) {
		try {
			if (req.get("formType").equals("create"))
				movDAO.add(req);
			else
				movDAO.update(req, Integer.parseInt(req.get("id")));
			return "redirect:/company";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "an error occured";
	}

	@RequestMapping("/company/movie/delete/{id}")
	public String cDelete(@PathVariable Map<String, String> pathV) {
		movDAO.delete(Integer.valueOf(pathV.get("id")));
		return "redirect:/company";
	}

}