package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

import model.SalesReport;

@Controller
@RequestMapping("/salesReport")
public class SalesReportController {
	
	SalesReport sReport = new SalesReport();
	
	@RequestMapping("/salesReport")
	public String getRedirect(HttpServletRequest request, HttpServletResponse response){
		String red = request.getParameter("filter");
		if(red == "getDayDetails")
			return "redirect:/getDayDetails";
		else if(red == "getWeekDetails")
			return "redirect/getWeekDetails";
		else if(red == "getMonthDetails")
			return "redirect:/getMonthDetails";
		else return null;
	}
	
	@RequestMapping("/getDayDetails")
	public ModelAndView getDetailD() {
		String dbURL = "hdbc:mysql://localhost:3303/ccbs";
		String username = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(dbURL, username, password);
			
			String sql = "select * from report where day(date)";
			Statement stt = con.createStatement();
			ResultSet rs = stt.executeQuery(sql);
			
			while(rs.next()) {
				double ticket_total = rs.getDouble("ticket_ttl");
				double snackBvg_total = rs.getDouble("snackBeverage_ttl");
				List<Double> dReport = new ArrayList<Double>(20);
				dReport.add(ticket_total);
				dReport.add(snackBvg_total);
			}
			ModelAndView model = new ModelAndView("viewReport");
			model.addObject("detail", dReport);
			return model;
			con.close();
		}
		catch(SQLException ex) {
			ex.printStackTrace();
		}
	}
	
	@RequestMapping("/getWeekDetails")
	public ModelAndView getDetailW() {
		String dbURL = "hdbc:mysql://localhost:3303/ccbs";
		String username = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(dbURL, username, password);
			
			String sql = "select * from report where week(date)=week(now())";
			Statement stt = con.createStatement();
			ResultSet rs = stt.executeQuery(sql);
			
			while(rs.next()) {
				double ticket_total = rs.getDouble("ticket_ttl");
				double snackBvg_total = rs.getDouble("snackBeverage_ttl");
				List<Double> wReport = new ArrayList<Double>(20);
				wReport.add(ticket_total);
				wReport.add(snackBvg_total);
			}
			ModelAndView model = new ModelAndView("viewReport");
			model.addObject("detail", wReport);
			return model;
			con.close();
		}
		catch(SQLException ex) {
			ex.printStackTrace();
		}
	}
	
	@RequestMapping("/getMonthDetails")
	public ModelAndView getDetail() {
		String dbURL = "hdbc:mysql://localhost:3303/ccbs";
		String username = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(dbURL, username, password);
			
			String sql = "select * from report where month(date)";
			Statement stt = con.createStatement();
			ResultSet rs = stt.executeQuery(sql);
			
			while(rs.next()) {
				double ticket_total = rs.getDouble("ticket_ttl");
				double snackBvg_total = rs.getDouble("snackBeverage_ttl");
				List<Double> mReport = new ArrayList<Double>(20);
				mReport.add(ticket_total);
				mReport.add(snackBvg_total);
			}
			ModelAndView model = new ModelAndView("viewReport");
			model.addObject("detail", mReport);
			return model;
			con.close();
		}
		catch(SQLException ex) {
			ex.printStackTrace();
		}
	}
}
