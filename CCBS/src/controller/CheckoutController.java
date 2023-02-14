package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.sql.Date;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import bdUtil.BookingDAO;
import bdUtil.HallDAO;
import bdUtil.MovieDAO;
import model.Movie;

@Controller
public class CheckoutController {

	public String toJson(String[][] arr) {
		Gson gson = new Gson();
		return gson.toJson(arr);
	}

	public String[][] fromJson(String json) {
		Gson gson = new Gson();
		return gson.fromJson(json, String[][].class);
	}

	@RequestMapping("/movie/{movie_id}/{type}/{schedule_id}/{user_id}/seatBooking")
	public ModelAndView seatBooking(@PathVariable("movie_id") int movie_id, @PathVariable("type") String type,
			@PathVariable("schedule_id") int schedule_id, @PathVariable("user_id") int user_id,
			HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		ModelAndView mav = new ModelAndView("movie_seat_booking");

		BookingDAO bDAO = new BookingDAO();
		Map<String, Object> schedule = bDAO.findById(schedule_id).get(0);
		String[][] scArr = fromJson(schedule.get("seats").toString());
		mav.addObject("scArr", scArr);

		MovieDAO movDAO = new MovieDAO();
		mav.addObject("movie", movDAO.findById(movie_id));
		mav.addObject("price", movDAO.getMoviePriceByType(type, movie_id));

		HallDAO hallDAO = new HallDAO();
		int hallId = (int) schedule.get("hall_id");
		mav.addObject("hall", hallDAO.findById(hallId));

		return mav;

//		ModelAndView mv = new ModelAndView("movie_seat_booking");				
//		String sql = "select * from movie where movie_id = ?";
//		String sql2 = "select * from movie inner join prices on movie.movie_id = prices.movie_id where movie.movie_id = ? AND prices.type = ?;";
//		String sql3 = "select * from schedule where movie_id = ? AND schedule_id = ?";
//		String sql4 = "select * from hall where hall_id = ?";
//		
//		String seat = request.getParameter("seatHidden");
//		
//		HttpSession session = request.getSession(true);
//		
//		Movie movie = new Movie();
//		Connection con = DBConnect.openconnection();
//		String movieName = "";
//		
//		double price = 0;
//		
//		try {
//			//get movie name based on movie ID
//			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setInt(1, movie_id);
//			System.out.println(movie_id);
//			ResultSet rs = ps.executeQuery();
//			
//			while(rs.next()) {
//				//movieName = rs.getString("name");
//				movieName = "Black Panther: Wakanda Forever";
//				movie.setName(movieName);
//				System.out.println(movieName);
//			}
//			session.setAttribute("movieBean", movie);
//			
//			//get movie price based on movie ID and movie type
//			PreparedStatement ps2 = con.prepareStatement(sql2);
//			ps2.setInt(1, movie_id);
//			ps2.setString(2, type);
//			
//			System.out.println(type);
//			
//			rs = ps2.executeQuery();
//			
//			while(rs.next()) {
//				price = rs.getDouble("movie_price");
//				movie.setMovie_price(price);
//				System.out.println(price);
//			}
//			
//			//get seatSold based on movie ID and schedule ID
//			PreparedStatement ps3 = con.prepareStatement(sql3);
//			ps3.setInt(1, movie_id);
//			ps3.setInt(2, schedule_id);
//			rs = ps3.executeQuery();
//			
//			String seatSoldList = "", aircon = "", soundSystem = "", hallType = "";
//			int hallID = 0;
//			Hall hall = new Hall();
//			Blob hallPhoto = null;
//			
//			while(rs.next()) {
//				seatSoldList = rs.getString("seatSold");
//				hallID = rs.getInt("hall_id");
//				
//				System.out.print("hall id: " + hallID);
//			}
//			
//			ServletContext context = request.getServletContext();
//			context.setAttribute("seatSold", seatSoldList);
//			session.setAttribute("movieBean", movie);
//			
//			//get hall id based on movie ID and schedule ID
//			PreparedStatement ps4 = con.prepareStatement(sql4);
//			ps4.setInt(1, hallID);
//			rs = ps4.executeQuery();
//						
//			while(rs.next()) {
//				aircon = rs.getString("air_cond");
//				soundSystem = rs.getString("sound_sys");
//				hallType = rs.getString("hall_type");
//				hallPhoto = rs.getBlob("image");
//				
//				hall.setAir_cond(aircon);
//				hall.setSound_sys(soundSystem);
//				hall.setHall_type(hallType);
//				hall.setPhoto(hallPhoto);
//			}
//			session.setAttribute("hallBean", hall);
//			InputStream image2 = hallPhoto.getBinaryStream();
//    		mv.addObject("image2", image2);
//    		
//    		
//    		String sql5 = "insert into ticket(`movie_id`, `user_id`, `hall_id`, `seat`) values(?,?,?,?)";
//    		PreparedStatement ps5 = con.prepareStatement(sql5);
//    		String seat5 = "A05,A06,A07,A08,A09";
//    		ps5.setInt(1, movie_id);
//    		ps5.setInt(2, user_id);
//    		ps5.setInt(3, hallID);
//    		ps5.setString(4, seat5);
//    		
//    		ps5.executeUpdate();
//    		System.out.print("insert ticket success");
//		}
//		catch(SQLException ex) {
//			ex.printStackTrace();
//		}
//		
//		return mv;
	}

	@RequestMapping("/movie/seatBooking/submit")
	public String storeSelectedSeats(@RequestParam Map<String, String> req, HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String selectedSeats = req.get("seat");
		HttpSession session = request.getSession(true);
		session.setAttribute("seatSelected", selectedSeats);
		session.setAttribute("noseatSelected", selectedSeats.split("\\s+").length);
		System.out.println(selectedSeats.replaceFirst("\\s+", "").replaceAll("\\s+", ", "));
		System.out.println(selectedSeats.split("\\s+").length);
		return "";
	}
}
