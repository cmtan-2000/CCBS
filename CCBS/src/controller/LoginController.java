package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.DBConnect;
import bdUtil.FABDAO;
import bdUtil.HallDAO;
import bdUtil.BranchDAO;
import bdUtil.MovieDAO;
import model.*;

//@WebServlet("/LoginController")
@Controller
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout() {
		ModelAndView mav = new ModelAndView("Logout");
		return mav;
	}
	
	@PostMapping("/login_success")
	protected String login(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, String> req) throws ServletException, IOException {
		
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		ModelAndView model = null;
		String username = req.get("username");
		String password = req.get("password");
		int user_id = 0;
		User user = new User();
		int type = 0;
		
		try {
			Connection con = DBConnect.openconnection();
			String sql = "select * from profile where username=? AND password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				System.out.println("username: " + rs.getString("username"));
				System.out.println("password: " + rs.getString("password"));
				
				//validation
				if(username.equals(rs.getString("username")) && password.equals(rs.getString("password"))) {	
					//check user type
					type = rs.getInt("type");
					user_id = rs.getInt("user_id");
					System.out.println("Type: " + rs.getInt("type"));
					System.out.println("User_ID: " + rs.getInt("user_id"));
					user.setType(type);
					user.setUser_id(user_id);
					session.setAttribute("user", user);
					System.out.println("Set User_ID: " + user.getUser_id());
				}
			}
		}
		catch(SQLException ex) {
			ex.printStackTrace();
		}
		
		if(type==1) return "redirect:/admin";
		else if (type==2) return "redirect:/company";
		else if (type==3) return "redirect:/";
		else return "redirect:/loginError";
	}

	@RequestMapping("/")
	public ModelAndView userDashboard() {
		ModelAndView mav = new ModelAndView("movieGridListView");
		MovieDAO movDAO = new MovieDAO();
		mav.addObject("movieList", movDAO.getAll());
		return mav;
	}

	@RequestMapping("/admin")
	public ModelAndView adminDashboard() {
		ModelAndView mav = new ModelAndView("adminDashboard");
		BranchDAO branchDAO = new BranchDAO();
		mav.addObject("branchHall", branchDAO.getBranchHall());
		HallDAO halldao = new HallDAO();
		List<Hall> hallPendList = halldao.getAllPending();
		
		mav.addObject("hallPendList", hallPendList);
		return mav;
	}

	@RequestMapping("/company")
	public ModelAndView companyDashboard() {
		ModelAndView mav = new ModelAndView("index");
		MovieDAO movDAO = new MovieDAO();
		BranchDAO brchDAO = new BranchDAO();
		HallDAO hallDAO = new HallDAO();

		mav.addObject("movieList", movDAO.getAll());
		mav.addObject("allTags", movDAO.getAllMovieTags());
		mav.addObject("allGenres", movDAO.getAllMovieGenres());
		
		int company_id = 10;
		List<Branch> compBrchList = brchDAO.getCompanyBranch(company_id );
		List<Hall> hallList = hallDAO.getAll();

		FABDAO fabDAO = new FABDAO();
		Map<String, List<FAB>> fabList = fabDAO.getAllFAB();
		mav.addObject("FABList", fabList);

		List<Branch> brchList = brchDAO.getAll();
		mav.addObject("compBrchList", compBrchList);
		mav.addObject("branchList", compBrchList);
		mav.addObject("hallList", hallList);
		return mav;
	}

	@RequestMapping("/loginError")
	public ModelAndView loginError() {
		ModelAndView mav = new ModelAndView("errorLogin");
		return mav;
	}
}