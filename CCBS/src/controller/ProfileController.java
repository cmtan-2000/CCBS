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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.DBConnect;
import model.User;

@Controller
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public ProfileController() {
        super();
    }
    
	@RequestMapping("/profile/editProfile")
	public ModelAndView editProfile(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		ModelAndView mv = new ModelAndView("editProfile");		
		return mv;
	}
	
	@RequestMapping("profile/editProfile/success")
	public String editProfileSuccess(@RequestParam("photoFile") MultipartFile photoFile, HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String name = request.getParameter("name");
		java.sql.Date dob = Date.valueOf(request.getParameter("dob"));
		String phoneNo = request.getParameter("phoneNo");
		String address = request.getParameter("address");
		String state = request.getParameter("stateSelect");
    	String town = request.getParameter("townSelect");
    	InputStream fileContent = photoFile.getInputStream();
    	int user_id = 0;
    	String completeAddress = address + " ," + town + " ," + state;
    	
    	try {
    		HttpSession session = request.getSession(true);
    		User user = (User)session.getAttribute("user"); 
    		user_id = user.getUser_id();
    		
    		Connection con = DBConnect.openconnection();
    		String sql = "update profile set name = ?, phoneNo = ?, address = ?, photoFile = ?, dob = ? where user_id = ?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setString(1, name);
    		ps.setString(2, phoneNo);
    		ps.setString(3, completeAddress);
    		ps.setBlob(4, fileContent);
    		ps.setDate(5, dob);
    		ps.setInt(6, user_id);
    		
    		ps.executeUpdate();
    		System.out.println("update profile success");
    	}
    	catch(SQLException ex) {
    		ex.printStackTrace();
    	}
		
		return "redirect:/profile/" + user_id;
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
			
			
    		InputStream image1 = photoFile.getBinaryStream();
    		mv.addObject("image1", image1);
    		
    		session.setAttribute("image3", image1); //to display at edit profile
    		session.setAttribute("user", user);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}		
		return mv;
	}	
	
	@RequestMapping("/wallet/{user_id}")
    protected ModelAndView viewWallet(@PathVariable("user_id") int userID, HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    	ModelAndView mv = new ModelAndView("topUpPage");
    	
    	double amount = 0.00;
    	
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
