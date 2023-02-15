package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.DBConnect;
import model.User;

@Controller
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public ProfileController() {
        super();
    }
    
	@RequestMapping("/profile/{user_id}")
	protected ModelAndView profile(@PathVariable("user_id") int userID, HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
		ModelAndView mv = new ModelAndView("profile");
		Blob photoFile = null;
		String name = "", phoneNo="", address="";
		java.sql.Date dob = null;
		int type = 0;
		
		try {
			Connection con = DBConnect.openconnection();
			HttpSession session = request.getSession(true);
			User user = new User();
			String sql = "select * from profile where user_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userID);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				name = rs.getString("name");
				photoFile = rs.getBlob("photoFile");
				dob = rs.getDate("dob");
				phoneNo = rs.getString("phoneNo");
				address = rs.getString("address");
				type = rs.getInt("type");
			}
			user.setName(name);
			user.setPhotoFile(photoFile);
			user.setDob(dob);
			user.setPhoneNo(phoneNo);
			user.setAddress(address);
			user.setUser_id(userID);
			user.setType(type);
			
			session.setAttribute("user", user);
			
    		InputStream image1 = photoFile.getBinaryStream();
    		mv.addObject("image1", image1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}		
		return mv;
	}
	
	
	@RequestMapping("/wallet/{user_id}")
    protected ModelAndView viewWallet(@PathVariable("user_id") int userID, HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    	ModelAndView mv = new ModelAndView("topUpPage");
    	
    	Double amount = 0.00;
    	
    	try {
    		Connection con = DBConnect.openconnection();
			HttpSession session = request.getSession(true);
			User user = new User();
			String sql = "select * from profile where user_id = ?";
			String sql2 = "update profile set amount = ? where user_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps.setInt(1, userID);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				amount = rs.getDouble("amount");
			}
			System.out.print(amount);
			
			if(Boolean.parseBoolean(request.getParameter("update")))
			{
				amount = amount + Double.parseDouble(request.getParameter("topupAmount"));
				ps2.setDouble(1, amount);
				ps2.setInt(2, userID);
				ps2.executeUpdate();
			}
			
			user.setUser_id(userID);
			user.setAmount(amount);
			
			session.setAttribute("user", user);
    	}
    	catch(SQLException e) {
			e.printStackTrace();
		}
    	return mv;
    }
}
