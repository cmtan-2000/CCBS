package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.BranchDAO;
import bdUtil.DBConnect;
import model.Branch;
import model.Movie;

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
				
//		return "this is from add - Branch... row affected :" + rw;
		return "redirect:/company";
	}
	
	
	@RequestMapping("/manageSchedule")
	@ResponseBody()
	protected String manage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		String hall_id = request.getParameter("hall_id");
		String[] mid = request.getParameterValues("movie_id");
		  if (mid != null) {
			  
			  
		    for (String id : mid) {
		    	System.out.println(id);
		    }
		  }
		
		return "worked";
		
	}
	
	@RequestMapping("/test")
	@ResponseBody()
	protected ModelAndView manageHall(HttpServletRequest request) {
		System.out.println(request.getParameter("hall_id"));
		System.out.println(request.getParameter("hall_type"));
		
		BranchDAO bDAO = new BranchDAO();
		System.out.println("bcsd");
		List<Map<String, Object>> movieList = bDAO.getHallMovieByType(Integer.parseInt(request.getParameter("hall_id")));
		System.out.println(bDAO.getHallMovieByType(Integer.parseInt(request.getParameter("hall_id"))));
//		Connection conn = DBConnect.openconnection();
//		String hall_type = null;
////		To get the specific Hall Type
//		String sql = "SELECT hall.hall_type FROM hall INNER JOIN branch on hall.brch_id "
//				+ "= branch.brch_id WHERE hall.hall_id = ?";
//		try {
//			PreparedStatement ps = conn.prepareStatement(sql);
//			ps.setInt(1, Integer.parseInt(request.getParameter("hall_id")));
//			ResultSet rs = ps.executeQuery();
//			while(rs.next()) {
//				System.out.println(rs.getString("hall_type"));
//				hall_type = rs.getString("hall_type");
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		String sql2 = "SELECT * FROM movie " + 
//				"INNER JOIN prices ON prices.movie_id = movie.movie_id" + 
//				"WHERE prices.type = ? ";
//		List<Movie> movieList = null;
//		try {
//			PreparedStatement ps2 = conn.prepareStatement(sql2);
//			ps2.setString(1, "2D");
//			ResultSet rs = ps2.executeQuery();
//			while(rs.next()){
//				Movie movie = new Movie();
//				movie.setName(rs.getString("name"));
//				System.out.println(movie.getName());
//				movie.setMovie_id(rs.getInt("int"));
//				System.out.println(movie.getMovie_id());
//
//				movieList.add(movie);
//			}
//		}catch (SQLException e) {
//			e.printStackTrace();
//		}
				
		
		ModelAndView model = new ModelAndView("manageSchedulDialog");
		List<Movie> moList = new ArrayList<Movie>();
		for(Map <String, Object> movie: movieList) {
			Movie mvie = new Movie();
			int id = Integer.parseInt(movie.get("movie_id").toString());
			String name = movie.get("name").toString();
			String duration = String.valueOf(movie.get("duration"));
			mvie.setMovie_id(id);
			mvie.setName(name+" + "+duration);
			moList.add(mvie);
		}
		model.addObject("movieList", moList);
		model.addObject("hall_Id", request.getParameter("hall_id"));
		return model;
	}
	

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("test");
		List<Branch> branchList = brchDAO.getAll();
		model.addObject(branchList);
		return model;
	}
	
}
