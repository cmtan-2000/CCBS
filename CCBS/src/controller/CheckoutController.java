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
import java.util.ArrayList;
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
import bdUtil.DBConnect;
import bdUtil.FABDAO;
import bdUtil.HallDAO;
import bdUtil.MovieDAO;
import model.FAB;
import model.Movie;
import model.Ticket;

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
		mav.addObject("movieId", movie_id);
		mav.addObject("userId", user_id);
		mav.addObject("scheduleId", schedule_id);
		mav.addObject("priceId", movDAO.getMoviePriceIdByType(type, movie_id));

		return mav;
	}

	@RequestMapping("/movie/seatBooking/submit")
	public String storeSelectedSeats(@RequestParam Map<String, String> req, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, IOException {
		String selectedSeats = req.get("seat");
		int movieId = Integer.parseInt(req.get("movieId"));
		int userId = Integer.parseInt(req.get("userId"));
		int scheduleId = Integer.parseInt(req.get("scheduleId"));
		int priceId = Integer.parseInt(req.get("priceId"));

		HttpSession session = request.getSession(true);
		session.setAttribute("seatSelected", selectedSeats);
		session.setAttribute("movieId", movieId);
		session.setAttribute("userId", userId);
		session.setAttribute("scheduleId", scheduleId);
		session.setAttribute("priceId", priceId);
		session.setAttribute("noseatSelected", selectedSeats.split("\\s+").length);
		System.out.println(selectedSeats.replaceFirst("\\s+", "").replaceAll("\\s+", ", "));
		System.out.println(selectedSeats.split("\\s+").length);
		return "redirect:/displayFoodDrinks";
	}

	@RequestMapping("/viewcheckout/{ticket_id}")
		protected ModelAndView checkoutPage(@PathVariable("ticket_id") int ticket_id, HttpServletRequest request, HttpServletResponse response) throws IOException {
			Connection con = DBConnect.openconnection();
			HttpSession session = request.getSession(true);
			
			System.out.println("ticketID: " + ticket_id);
	    	
			String movieName = "", ticketType = "", food = "", drink = "", showTimeString = "", seat = "", comboName = "";
	    	java.sql.Date showDate = null;
	    	java.sql.Time showTime = null;
	    	double movie_price = 0, drink_price = 0, food_price = 0, combo_price = 0,totalPrice = 0;
	    	int food_amount = 0, drink_amount = 0, combo_amount = 0,seatCount = 0, sesfoodID = 0, sesDrinkID = 0, sesComboID = 0;
	    	Ticket ticket = new Ticket();
	    	
	    	try {
	    		
	    		sesfoodID = (Integer)session.getAttribute("session_foodID");
	    		sesDrinkID = (Integer)session.getAttribute("session_drinkID");
	    		sesComboID = (Integer)session.getAttribute("session_comboID");
	    		
	    		if(sesfoodID>0 && sesDrinkID>0 && sesComboID>0) {
	    			//if order all fab
	    			String sql = "SELECT * FROM ticket INNER JOIN movie ON ticket.movie_id = movie.movie_id INNER JOIN prices ON ticket.price_id= prices.price_id INNER JOIN schedule ON ticket.schedule_id= schedule.schedule_id INNER JOIN custfab_ticket ON ticket.ticket_id= custfab_ticket.ticket_id INNER JOIN food ON custfab_ticket.food_id= food.fab_id INNER JOIN drink ON custfab_ticket.drink_id= drink.fab_id INNER JOIN combo ON custfab_ticket.combo_id= combo.fab_id where ticket.ticket_id = ?";
	    			PreparedStatement ps = con.prepareStatement(sql);
		    		ps.setInt(1, ticket_id);
		    		ResultSet rs = ps.executeQuery();
		    		
		    		while(rs.next()) {
		    			movieName = rs.getString("movie.name");
		    			showTime = rs.getTime("showtime_time");
		    			showDate = rs.getDate("showtime_date");
		    			ticketType = rs.getString("type");
		    			seat = rs.getString("seat");
		    			movie_price = rs.getDouble("movie_price");
		    			
		    			System.out.println("movieName: " + movieName);
		    			System.out.println("showTime: " + showTime);
		    			System.out.println("showDate: " + showDate);
		    			
		    			System.out.println("food ID: " + sesfoodID);
		    			System.out.println("drink ID: " + sesDrinkID);
		    			System.out.println("combo ID: " + sesComboID);
		    			
		    			
		    			food_price = rs.getDouble("food.price");
		    			food = rs.getString("food.name");
		    			food_amount = rs.getInt("food_amount");
		    				
		    			drink_price = rs.getDouble("drink.price");
		    			drink = rs.getString("drink.name");
		    			drink_amount = rs.getInt("drink_amount");
		    			
		    			combo_price = rs.getDouble("combo.price");
		    			comboName = rs.getString("combo.name");
			    		combo_amount = rs.getInt("combo_amount");
			    		
			    		ticket.setFoodPrice(food_price);
		    			ticket.setFoodName(food);
		    			ticket.setFoodAmount(food_amount);
			    		ticket.setDrinkPrice(drink_price);
		    			ticket.setDrinkName(drink);
		    			ticket.setDrinkAmount(drink_amount);
			    		ticket.setComboName(comboName);
			    		ticket.setComboPrice(combo_price);
			    		ticket.setComboAmount(combo_amount);
		    		}
	    		}
	    		else {
	    			//if no order fab at all
		    		String sql1 = "SELECT * FROM ticket INNER JOIN movie ON ticket.movie_id = movie.movie_id INNER JOIN prices ON ticket.price_id= prices.price_id INNER JOIN schedule ON ticket.schedule_id= schedule.schedule_id where ticket.ticket_id = ?";
		    		PreparedStatement ps2 = con.prepareStatement(sql1);
		    		ps2.setInt(1, ticket_id);
		    		ResultSet rs = ps2.executeQuery();
		    		
		    		while(rs.next()) {
		    			movieName = rs.getString("movie.name");
		    			showTime = rs.getTime("showtime_time");
		    			showDate = rs.getDate("showtime_date");
		    			ticketType = rs.getString("type");
		    			seat = rs.getString("seat");
		    			movie_price = rs.getDouble("movie_price");
		    			
		    			System.out.println("movieName: " + movieName);
		    			System.out.println("showTime: " + showTime);
		    			System.out.println("showDate: " + showDate);
		    			System.out.println("food ID: " + sesfoodID);
		    			System.out.println("drink ID: " + sesDrinkID);
		    			System.out.println("combo ID: " + sesComboID);
		    			System.out.println("no order fab");
		    		}
	    		}
	    		DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
	    		showTimeString = dateFormat.format(showTime);
	    		System.out.print(showTimeString);
	    			
	    		String[] seatSplitArr = seat.split(",", 0);
	    			for(String str:seatSplitArr) {
	    				seatCount++;
	    			}
	    			
	    		totalPrice =  movie_price*seatCount + food_price*food_amount + drink_price*drink_amount + combo_price*combo_amount;    			
	    			
	    		ticket.setMovieName(movieName);
	    		ticket.setShowTime(showTimeString);
	    		ticket.setShowDate(showDate);
	    		ticket.setTicketType(ticketType);
	    		ticket.setMoviePrice(movie_price);
	    		ticket.setSeat(seat);
	    		ticket.setSeatCount(seatCount);
	    		ticket.setFoodID(sesfoodID);
	    		ticket.setDrinkID(sesDrinkID);
	    		ticket.setComboID(sesComboID);
	    			
	    		ticket.setTotalPrice(totalPrice);
	    			
	    		session.setAttribute("ticket", ticket);
	    		System.out.println("movie name: " + movieName);
	    	
	 }
	 catch(SQLException ex)
	{
	    ex.printStackTrace();
	}
	ModelAndView mv = new ModelAndView("checkout");return mv;
	}

	@RequestMapping("/displayFoodDrinks")
	protected ModelAndView viewFoodDrinksPage() throws IOException {
		ModelAndView mv = new ModelAndView("checkoutFoodBeverage");
		FABDAO fabDAO = new FABDAO();
		Map<String, List<FAB>> fabList = fabDAO.getAllFAB();
		mv.addObject("FABList", fabList);
		return mv;
	}

	@RequestMapping("/displayFoodDrinks/insertTicket")
	protected String insertTicket(@RequestParam Map<String, String> req, HttpServletRequest request)
			throws IOException {

		int ticket_id = 0;

//			HttpSession session = request.getSession(true);
//			String seat = (String)session.getAttribute("seatSelected");
//			int movie_id= (Integer) session.getAttribute("movieId");
//			int user_id = (Integer) session.getAttribute("userId");
//			int schedule_id = (Integer) session.getAttribute("scheduleId");
//			int price_id = (Integer) session.getAttribute("priceId");   	

		FABDAO fabDAO = new FABDAO();
		Map<String, List<FAB>> fabList = fabDAO.getAllFAB();
		int drinkLength = fabList.get("drink").size();
		int comboLength = fabList.get("combo").size();
		int foodLength = fabList.get("food").size();

		int drink_id = 0, drink_amount = 0, food_id = 0, food_amount = 0, combo_id = 0, combo_amount = 0;

		ArrayList<Integer> drinkInput = new ArrayList<Integer>();
		ArrayList<Integer> foodInput = new ArrayList<Integer>();
		ArrayList<Integer> comboInput = new ArrayList<Integer>();

		for (int i = 1; i <= drinkLength; i++) {
			drinkInput.add(Integer.parseInt(req.get("drink_amount" + i)));
		}

		for (int i = 1; i <= foodLength; i++) {
			foodInput.add(Integer.parseInt(req.get("food_amount" + i)));
		}

		for (int i = 1; i <= comboLength; i++) {
			comboInput.add(Integer.parseInt(req.get("combo_amount" + i)));
		}

		for (int i = 0; i < drinkLength; i++) {
			if (drinkInput.get(i) > 0) {
				System.out.print(i + 1);
				System.out.print(drinkInput.get(i));
				drink_id = i + 1;
				drink_amount = drinkInput.get(i);
				break;
			}
			drink_id = 0;
			drink_amount = 0;
		}

		for (int i = 0; i < foodLength; i++) {
			if (foodInput.get(i) > 0) {
				System.out.print(i + 1);
				System.out.print(foodInput.get(i));
				food_id = i + 1;
				food_amount = foodInput.get(i);
				break;
			}
			food_id = 0;
			food_amount = 0;
		}

		for (int i = 0; i < comboLength; i++) {
			if (comboInput.get(i) > 0) {
				System.out.print(i + 1);
				System.out.print(comboInput.get(i));
				combo_id = i + 1;
				combo_amount = comboInput.get(i);
				break;
			}
			combo_id = 0;
			combo_amount = 0;
		}

		Connection con = DBConnect.openconnection();

		int movie_id = 1;
		int user_id = 13;
		int schedule_id = 4;
		String seat = "A01,A02,A03";
		int price_id = 2;

		System.out.println("food ID in insertTicket: " + food_id);
		System.out.println("drink ID in insertTicket: " + drink_id);
		System.out.println("combo ID in insertTicket: " + combo_id);

		try {
			// insert ticket first
			String sql = "insert into ticket(`movie_id`, `user_id`, `schedule_id`, `seat`, `price_id`) VALUES (?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, movie_id);
			ps.setInt(2, user_id);
			ps.setInt(3, schedule_id);
			ps.setString(4, seat);
			ps.setInt(5, price_id);
			ps.executeUpdate();

			System.out.println("Insert ticket successful");
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		try {
			// get the ticket_id
			String sql2 = "select ticket_id from ticket where movie_id = ? AND user_id = ? AND schedule_id = ? AND price_id = ?";

			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.setInt(1, movie_id);
			ps2.setInt(2, user_id);
			ps2.setInt(3, schedule_id);
			ps2.setInt(4, price_id);

			ResultSet rs = ps2.executeQuery();
			while (rs.next()) {
				ticket_id = rs.getInt("ticket_id");
			}
			System.out.println("Get ticket_id successful");
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		// insert new row into custfab_ticket
		try {
			String sql3 = "insert into custfab_ticket(`food_id`, `drink_id`, `combo_id`, `food_amount`, `drink_amount`, `combo_amount`, `cust_id`, `ticket_id`) VALUES (?,?,?,?,?,?,?,?)";
			PreparedStatement ps3 = con.prepareStatement(sql3);
			ps3.setInt(1, food_id);
			ps3.setInt(2, drink_id);
			ps3.setInt(3, combo_id);
			ps3.setInt(4, food_amount);
			ps3.setInt(5, drink_amount);
			ps3.setInt(6, combo_amount);
			ps3.setInt(7, user_id);
			ps3.setInt(8, ticket_id);

			HttpSession session = request.getSession(true);

			session.setAttribute("session_foodID", food_id);
			session.setAttribute("session_drinkID", drink_id);
			session.setAttribute("session_comboID", combo_id);

			ps3.executeUpdate();
			System.out.println("Insert custfab_ticket successful");
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return "redirect:/viewcheckout/" + ticket_id;
	}

	@RequestMapping("/paymentSuccess")
	protected ModelAndView checkoutPage() throws IOException {
		ModelAndView mv = new ModelAndView("paymentSuccess");
		return mv;
	}

	@RequestMapping("/checkout/showPayment")
	protected ModelAndView paymentPage() throws IOException {
		ModelAndView mv = new ModelAndView("payment");
		return mv;
	}

	@RequestMapping("/checkout/makePayment/{user_id}")
	protected String makePaymentPage(@PathVariable("user_id") int user_id, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(true);
		String sql = "select * from profile where user_id = ?";
		double amount = 0, totalPrice = 0, leftoverAmount = 0;
		int type = 0;
		Connection con = DBConnect.openconnection();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				amount = rs.getDouble("amount");
				type = rs.getInt("type");

				// check if is customer and amount is more than 0
				if (type == 3 && amount >= 0) {
					Ticket ticket2 = (Ticket) session.getAttribute("ticket");
					totalPrice = ticket2.getTotalPrice();
					leftoverAmount = amount - totalPrice;
					System.out.println("total price: " + totalPrice);
					System.out.println("amount: " + amount);
					System.out.println("leftoverAmount: " + leftoverAmount);
				}
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		try {
			String sql2 = "update `profile` set amount = ? where user_id = ?";
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.setDouble(1, leftoverAmount);
			ps2.setInt(2, user_id);
			ps2.executeUpdate();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return "redirect:/paymentSuccess";
	}
}
