package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;
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
import bdUtil.MovieDAO;
import model.Hall;
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

	//home page for company is /company ->index.jsp
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

	@PostMapping("/company/movie/create") //create+update in insertMovieModal.jsp
	public String cCreate(@RequestParam Map<String, String> req) {
		try {
			if(req.get("formType").equals("create")) movDAO.add(req);
			else movDAO.update(req, Integer.parseInt(req.get("id")));
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
	
	
	@RequestMapping("/movie/{movie_id}/{type}/{schedule_id}/{user_id}/seatBooking")
	public ModelAndView seatBooking(@PathVariable("movie_id") int movie_id, @PathVariable("type") String type, @PathVariable("schedule_id") int schedule_id, @PathVariable("user_id") int user_id, HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
		
		ModelAndView mv = new ModelAndView("movie_seat_booking");				
		String sql = "select * from movie where movie_id = ?";
		String sql2 = "select * from movie inner join prices on movie.movie_id = prices.movie_id where movie.movie_id = ? AND prices.type = ?;";
		String sql3 = "select * from schedule where movie_id = ? AND schedule_id = ?";
		String sql4 = "select * from hall where hall_id = ?";
		
		String seat = request.getParameter("seatHidden");
		
		HttpSession session = request.getSession(true);
		
		Movie movie = new Movie();
		Connection con = DBConnect.openconnection();
		String movieName = "";
		
		double price = 0;
		
		try {
			//get movie name based on movie ID
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, movie_id);
			System.out.println(movie_id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				//movieName = rs.getString("name");
				movieName = "Black Panther: Wakanda Forever";
				movie.setName(movieName);
				System.out.println(movieName);
			}
			session.setAttribute("movieBean", movie);
			
			//get movie price based on movie ID and movie type
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.setInt(1, movie_id);
			ps2.setString(2, type);
			
			System.out.println(type);
			
			rs = ps2.executeQuery();
			
			while(rs.next()) {
				price = rs.getDouble("movie_price");
				movie.setMovie_price(price);
				System.out.println(price);
			}
			
			//get seatSold based on movie ID and schedule ID
			PreparedStatement ps3 = con.prepareStatement(sql3);
			ps3.setInt(1, movie_id);
			ps3.setInt(2, schedule_id);
			rs = ps3.executeQuery();
			
			String seatSoldList = "", aircon = "", soundSystem = "", hallType = "";
			int hallID = 0;
			Hall hall = new Hall();
			Blob hallPhoto = null;
			
			while(rs.next()) {
				seatSoldList = rs.getString("seatSold");
				hallID = rs.getInt("hall_id");
				
				System.out.print("hall id: " + hallID);
			}
			
			ServletContext context = request.getServletContext();
			context.setAttribute("seatSold", seatSoldList);
			session.setAttribute("movieBean", movie);
			
			//get hall id based on movie ID and schedule ID
			PreparedStatement ps4 = con.prepareStatement(sql4);
			ps4.setInt(1, hallID);
			rs = ps4.executeQuery();
						
			while(rs.next()) {
				aircon = rs.getString("air_cond");
				soundSystem = rs.getString("sound_sys");
				hallType = rs.getString("hall_type");
				hallPhoto = rs.getBlob("image");
				
				hall.setAir_cond(aircon);
				hall.setSound_sys(soundSystem);
				hall.setHall_type(hallType);
				hall.setPhoto(hallPhoto);
			}
			session.setAttribute("hallBean", hall);
			InputStream image2 = hallPhoto.getBinaryStream();
    		mv.addObject("image2", image2);
    		
    		
    		String sql5 = "insert into ticket(`movie_id`, `user_id`, `hall_id`, `seat`) values(?,?,?,?)";
    		PreparedStatement ps5 = con.prepareStatement(sql5);
    		String seat5 = "A05,A06,A07,A08,A09";
    		ps5.setInt(1, movie_id);
    		ps5.setInt(2, user_id);
    		ps5.setInt(3, hallID);
    		ps5.setString(4, seat5);
    		
    		ps5.executeUpdate();
    		System.out.print("insert ticket success");
		}
		catch(SQLException ex) {
			ex.printStackTrace();
		}
		
		return mv;
	}
}