package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.SalesReportDAO;
import model.SalesReport;

@Controller
//@RequestMapping("/salesReport")
public class SalesReportController extends HttpServlet {
	
	SalesReport sReport = new SalesReport();
	SalesReportDAO sReportDAO = new SalesReportDAO();
	
	@RequestMapping("/salesReport/{branch_id}")
	public ModelAndView branchName(@PathVariable Map<String, String> pathS) {
		ModelAndView model = new ModelAndView("salesTable");
		int id = Integer.valueOf(pathS.get("branch_id"));
		SalesReport branchName = sReportDAO.findById(id);
		model.addObject("sReportBrch", branchName);
		return model;
	}
	
	@RequestMapping("/salesReport/{branch_id}/{filter}")
	public String dispMode(@PathVariable Map<String, String> pathS) {
		ModelAndView model = new ModelAndView("salesTable");
		String dispMode = String.valueOf(pathS.get("filter"));
		model.addObject("sReportDisp", dispMode);
		
		if(dispMode=="day") 
			return "redirect:/day";
		else if (dispMode=="month") 
			return "redirect:/month";
		else if (dispMode=="year") 
			return "redirect:/year";
		return dispMode;
	}
	
	@RequestMapping("/day")
	@ResponseBody()
	public ModelAndView getDay() {
		ModelAndView model = new ModelAndView("salesTable");
		String date = "2023-2-13";
		SalesReport day = sReportDAO.getDay(date);
		model.addObject("sReportD", day);
		return model;
	}
	
	@RequestMapping("/month")
	@ResponseBody()
	public ModelAndView getMonth() {
		ModelAndView model = new ModelAndView("salesTable");
		String month = "2";
		SalesReport months = sReportDAO.getMonth(month);
		model.addObject("sReportM", months);
		return model;
	}
	
	@RequestMapping("/year")
	@ResponseBody()
	public ModelAndView getYear() {
		ModelAndView model = new ModelAndView("salesTable");
		String year = "2023";
		SalesReport years = sReportDAO.getYear(year);
		model.addObject("sReportY", years);
		return model;
	}
	
//	@RequestMapping("/month/ticket")
//	@ResponseBody()
//	public SalesReport getTicketM(HttpServletRequest req) {
//		SalesReportDAO sReportDAO = new SalesReportDAO();
//		SalesReport total = sReportDAO.getTicketM();
//		return total;
//	}
//	
//	@RequestMapping("/year/ticket")
//	@ResponseBody()
//	public SalesReport getTicketY(HttpServletRequest req) {
//		SalesReportDAO sReportDAO = new SalesReportDAO();
//		SalesReport total = sReportDAO.getTicketY();
//		return total;
//	}
//	
//	@RequestMapping("/day/snackB")
//	@ResponseBody()
//	public SalesReport getSnackBD(HttpServletRequest req) {
//		SalesReportDAO sReportDAO = new SalesReportDAO();
//		SalesReport total = sReportDAO.getSnackBD();
//		return total;
//	}
//	
//	@RequestMapping("/month/snackB")
//	@ResponseBody()
//	public SalesReport getSnackBM(HttpServletRequest req) {
//		SalesReportDAO sReportDAO = new SalesReportDAO();
//		SalesReport total = sReportDAO.getSnackBM();
//		return total;
//	}
//	
//	@RequestMapping("/year/snackB")
//	@ResponseBody()
//	public SalesReport getSnackBY(HttpServletRequest req) {
//		SalesReportDAO sReportDAO = new SalesReportDAO();
//		SalesReport total = sReportDAO.getSnackBY();
//		return total;
//	}
}
