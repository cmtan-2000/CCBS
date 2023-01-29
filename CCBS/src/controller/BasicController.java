package controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.DBConnect;

@Controller
public class BasicController {
	Connection conn = DBConnect.openconnection();

	@RequestMapping("/login")
	protected ModelAndView getloginForm() {
//Example on how to get data from database (refer)
		try {
			String sql = "select * from company";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				System.out.println("userId: " + rs.getInt(1));
				System.out.println("Username: " + rs.getString(2));
				System.out.println("Password: " + rs.getString(3));
				System.out.println("company: " + rs.getString(4));
				System.out.println("");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//	---------------------------------------------------
		ModelAndView model = new ModelAndView("login");
		return model;
	}
	
	@RequestMapping("/register")
	protected ModelAndView getRegiterForm(@RequestParam Map<String, String> req) {
		
		String username = req.get("username");
		String password = req.get("password");
		
		System.out.print(username + password);
		
		ModelAndView model = new ModelAndView("");
		model.addObject("YourDATA", "yourValue");
		return model;
	}
}