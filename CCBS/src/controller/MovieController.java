package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.ServletContext;
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

//	@RequestMapping("/movie/index")
//	public ModelAndView index() {
//		ModelAndView mav = new ModelAndView("movieGridListView");
//		List<Movie> movieList = movDAO.getAll();
//		mav.addObject("movieList", movieList);
//		return mav;
//	}

	@RequestMapping("/movie/{id}")
	public ModelAndView view(@PathVariable Map<String, String> pathV) {
		ModelAndView mav = new ModelAndView("viewMovie");
		int id = Integer.valueOf(pathV.get("id"));
		Movie movieObject = movDAO.findById(id);
		mav.addObject("movie", movieObject);
		return mav;
	}	
	
	@RequestMapping("/movie/{id}/view")
	public ModelAndView cIndex(@PathVariable Map<String, String> pathV) {
		ModelAndView mav = new ModelAndView("movieHomePage");
		int id = Integer.valueOf(pathV.get("id"));
		Movie movieObject = movDAO.findById(id);
		mav.addObject("movie", movieObject);
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
	
//	@RequestMapping("/movie/{id}/booking")
//	public ModelAndView booking(@PathVariable Map<String, String> pathV) {
//		ModelAndView mav = new ModelAndView("movieHomePage");
//		String sql = "SELECT b.brch_name, b.brch_addr, b.brch_post, b.brch_city, b.state, h.hall_id, h.hall_type, m.name, s.showtime_time, s.showtime_date FROM branch AS b " +
//				"INNER JOIN hall AS h ON h.hall_id  = b.brch_id " +
//				"INNER JOIN schedule AS s ON s.hall_id = h.hall_id " +
//				"INNER JOIN movie AS m ON s.movie_id = m.movie_id " +
//				"order BY s.showtime_time";
//		Connection con = DBConnect.openconnection();
//		
//		try {
//			
//		}
//		catch(SQLException ex) {
//			ex.printStackTrace();
//		}
//		
//		return mav;
//	}
	
	
	@RequestMapping("/movie/{movie_id}/{type}/{schedule_id}/{user_id}/seatBooking")
	public ModelAndView seatBooking(@PathVariable("movie_id") int movie_id, @PathVariable("type") String type, @PathVariable("schedule_id") int schedule_id, @PathVariable("user_id") int user_id, HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
		
		ModelAndView mv = new ModelAndView("movie_seat_booking");				
		String sql = "select * from movie where movie_id = ?";
		String sql2 = "select * from movie inner join prices on movie.movie_id = prices.movie_id where movie.movie_id = ? AND prices.type = ?;";
		String sql3 = "select * from schedule where movie_id = ? AND schedule_id = ?";
		String sql4 = "select * from hall where hall_id = ?";
		String sql5 = "insert into ticket(`movie_id`, `user_id`, `hall_id`, `seat`) values(?,?,?,?)";
		String seat = request.getParameter("seat");
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
				movieName = rs.getString("name");
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
    		
    		
    		System.out.print("Seat: " + seat);
    		PreparedStatement ps5 = con.prepareStatement(sql5);
    		
    		ps5.setInt(1, movie_id);
    		ps5.setInt(2, user_id);
    		ps5.setInt(3, hallID);
    		ps5.setString(4, seat);
    		
    		ps5.executeUpdate();
    		System.out.print("insert ticket success");
		}
		catch(SQLException ex) {
			ex.printStackTrace();
		}
		
		return mv;
	}
}