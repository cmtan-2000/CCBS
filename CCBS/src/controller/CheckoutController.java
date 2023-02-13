package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.DBConnect;
import model.Ticket;

@Controller
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckoutController() {
        super();
    }
	
    //display
    @RequestMapping("/viewcheckout/{ticket_id}")
	protected ModelAndView checkoutPage(@PathVariable("ticket_id") int ticket_id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DBConnect.openconnection();
		HttpSession session = request.getSession(true);
		
		System.out.println("ticketID: " + ticket_id);
    	
    	String movieName = "", ticketType = "", food = "", drink = "", showTimeString = "", seat = "";
    	java.sql.Date showDate = null;
    	java.sql.Time showTime = null;
    	double movie_price = 0, drink_price = 0, food_price = 0, totalPrice = 0;
    	int food_amount = 0, drink_amount = 0, seatCount = 0;
    	Ticket ticket = new Ticket();
    	
    	try {
    		String sql = "SELECT * FROM ticket INNER JOIN movie ON ticket.movie_id = movie.movie_id INNER JOIN prices ON ticket.price_id= prices.price_id INNER JOIN schedule ON ticket.schedule_id= schedule.schedule_id INNER JOIN custfab_ticket ON ticket.ticket_id= custfab_ticket.ticket_id INNER JOIN food ON custfab_ticket.food_id= food.fab_id INNER JOIN drink ON custfab_ticket.drink_id= drink.fab_id where ticket.ticket_id = ?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setInt(1, ticket_id);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			movieName = rs.getString("movie.name");
    			showTime = rs.getTime("showtime_time");
    			showDate = rs.getDate("showtime_date");
    			ticketType = rs.getString("type");
    			movie_price = rs.getDouble("movie_price");
    			food_price = rs.getDouble("food.price");
    			drink_price = rs.getDouble("drink.price");
    			food = rs.getString("food.name");
    			drink = rs.getString("drink.name");
    			food_amount = rs.getInt("food_amount");
    			drink_amount = rs.getInt("drink_amount");
    			seat = rs.getString("seat");
    			
    			DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
    			showTimeString = dateFormat.format(showTime);
    			System.out.print(showTimeString);
    			
    			totalPrice = food_price*food_amount + drink_price*drink_amount;
    			
    		    String[] seatSplitArr = seat.split(",", 0);
    			for(String str:seatSplitArr) {
    				seatCount++;
    			}
    			
    			ticket.setMovieName(movieName);
    			ticket.setShowTime(showTimeString);
    			ticket.setShowDate(showDate);
    			ticket.setTicketType(ticketType);
    			ticket.setMoviePrice(movie_price);
    			ticket.setFoodPrice(food_price);
    			ticket.setDrinkPrice(drink_price);
    			ticket.setFoodName(food);
    			ticket.setDrinkName(drink);
    			ticket.setFoodAmount(food_amount);
    			ticket.setDrinkAmount(drink_amount);
    			ticket.setTotalPrice(totalPrice);
    			ticket.setSeat(seat);
    			ticket.setSeatCount(seatCount);
    			
    			
    			session.setAttribute("ticket", ticket);
    			System.out.println("movie name: " + movieName);
    		}
    		
    	}
    	catch(SQLException ex) {
    		ex.printStackTrace();
    	}
    	ModelAndView mv = new ModelAndView("checkout");
		return mv;
	}
    
    @RequestMapping("/displayFoodDrinks")
    protected ModelAndView viewFoodDrinksPage() throws ServletException, IOException {
    	ModelAndView mv = new ModelAndView("checkoutFoodBeverage");
    	
    	return mv;
    }
    
    @RequestMapping("/paymentSuccess")
    protected ModelAndView checkoutPage() throws ServletException, IOException {
    	ModelAndView mv = new ModelAndView("paymentSuccess");
    	return mv;
    }
    
    @RequestMapping("/checkout/showPayment")
    protected ModelAndView paymentPage() throws ServletException, IOException {
    	ModelAndView mv = new ModelAndView("payment");
    	return mv;
    }
    
    @RequestMapping("/checkout/makePayment/{user_id}")
    protected String makePaymentPage(@PathVariable("user_id") int user_id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(true);
    	String sql = "select * from profile where user_id = ?";
    	double amount = 0, totalPrice = 0, leftoverAmount = 0;
    	int type = 0;
    	Connection con = DBConnect.openconnection();
    	
    	try {
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setInt(1, user_id);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			amount = rs.getDouble("amount");
    			type = rs.getInt("type");
    			
    			//check if is customer and amount is more than 0
    			if(type==3 && amount>=0) {
    				Ticket ticket2 = (Ticket)session.getAttribute("ticket");
    				totalPrice = ticket2.getTotalPrice();
    				leftoverAmount = amount - totalPrice;
    				System.out.println("total price: " + totalPrice);
    				System.out.println("amount: " + amount);
    				System.out.println("leftoverAmount: " + leftoverAmount);
       			}
    		}
    	}
    	catch(SQLException ex) {
    		ex.printStackTrace();
    	}
    	
    	try {
			String sql2 = "update `profile` set amount = ? where user_id = ?";
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.setDouble(1, leftoverAmount);
			ps2.setInt(2, user_id);
			ps2.executeUpdate();
    	}
    	catch(SQLException ex) {
    		ex.printStackTrace();
    	}
    	
    	return "redirect:/paymentSuccess";
    }
}




