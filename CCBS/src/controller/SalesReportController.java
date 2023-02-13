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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.SalesReportDAO;
import model.SalesReport;

@Controller
public class SalesReportController {
	
	SalesReportDAO sReportDAO = new SalesReportDAO();
	
	@RequestMapping("/salesReport/{brch_name}/{cpy_name}")
	public String getRedirect(HttpServletRequest request, HttpServletResponse response){
		String red = request.getParameter("filter");
		String brch_name = request.getParameter("brch_name");
		String cpy_name = request.getParameter("cpy_name");
		if(red == "getDayDetails")
			return "redirect:/getDayDetails/{" + brch_name + "}/{" + cpy_name + "}";
		else if(red == "getWeekDetails")
			return "redirect/getWeekDetails/{" + brch_name + "}/{" + cpy_name + "}";
		else if(red == "getMonthDetails")
			return "redirect:/getMonthDetails/{" + brch_name + "}/{" + cpy_name + "}";
		else return null;
	}
	
	@RequestMapping("/getDayDetails/{brch_name}/{cpy_name}")
	public ModelAndView getDetailD(@PathVariable Map<String, String> pathD) {
		ModelAndView model = new ModelAndView("viewReport");
		String date = "2023-02-14";
		String branch_name = String.valueOf(pathD.get("brch_name"));
		String company_name = String.valueOf(pathD.get("cpy_name"));
		SalesReport reportObject = sReportDAO.findByDay(date);
		model.addObject("day", reportObject);
		model.addObject("branchName", branch_name);
		model.addObject("companyName", company_name);
		return model;
	}
	
	@RequestMapping("/getWeekDetails/{brch_name}/{cpy_name}")
	public ModelAndView getDetailW(@PathVariable Map<String, String> pathD) {
		ModelAndView model = new ModelAndView("viewReport");
		String date = "2023-02-14";
		String branch_name = String.valueOf(pathD.get("brch_name"));
		String company_name = String.valueOf(pathD.get("cpy_name"));
		SalesReport reportObject = sReportDAO.findByWeek(date);
		model.addObject("week", reportObject);
		model.addObject("branchName", branch_name);
		model.addObject("companyName", company_name);
		return model;
	}
	
	@RequestMapping("/getMonthDetails/{brch_name}/{cpy_name}")
	public ModelAndView getDetailM(@PathVariable Map<String, String> pathD) {
		ModelAndView model = new ModelAndView("viewReport");
		String date = "2023-02-14";
		String branch_name = String.valueOf(pathD.get("brch_name"));
		String company_name = String.valueOf(pathD.get("cpy_name"));
		SalesReport reportObject = sReportDAO.findByMonth(date);
		model.addObject("month", reportObject);
		model.addObject("branchName", branch_name);
		model.addObject("companyName", company_name);
		return model;
	}
}
