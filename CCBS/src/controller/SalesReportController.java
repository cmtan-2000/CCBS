package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.SalesReportDAO;
import model.SalesReport;

@Controller
public class SalesReportController {
	
	
	@RequestMapping("/admin/salesReport")
	public ModelAndView viewReport() {
		ModelAndView mav = new ModelAndView("salesReportTable");
		SalesReportDAO srDAO = new SalesReportDAO();
		mav.addObject("ticket", srDAO.getAll());
		return mav;
	}
	
	SalesReport sReport = new SalesReport();
	
	@RequestMapping("/day/ticket")
	@ResponseBody()
	public SalesReport getTicketD(HttpServletRequest req) {
		SalesReportDAO sReportDAO = new SalesReportDAO();
		SalesReport total = sReportDAO.getTicketD();
		return total;
	}
	
	@RequestMapping("/month/ticket")
	@ResponseBody()
	public SalesReport getTicketM(HttpServletRequest req) {
		SalesReportDAO sReportDAO = new SalesReportDAO();
		SalesReport total = sReportDAO.getTicketM();
		return total;
	}
	
	@RequestMapping("/year/ticket")
	@ResponseBody()
	public SalesReport getTicketY(HttpServletRequest req) {
		SalesReportDAO sReportDAO = new SalesReportDAO();
		SalesReport total = sReportDAO.getTicketY();
		return total;
	}
	
	@RequestMapping("/day/snackB")
	@ResponseBody()
	public SalesReport getSnackBD(HttpServletRequest req) {
		SalesReportDAO sReportDAO = new SalesReportDAO();
		SalesReport total = sReportDAO.getSnackBD();
		return total;
	}
	
	@RequestMapping("/month/snackB")
	@ResponseBody()
	public SalesReport getSnackBM(HttpServletRequest req) {
		SalesReportDAO sReportDAO = new SalesReportDAO();
		SalesReport total = sReportDAO.getSnackBM();
		return total;
	}
	
	@RequestMapping("/year/snackB")
	@ResponseBody()
	public SalesReport getSnackBY(HttpServletRequest req) {
		SalesReportDAO sReportDAO = new SalesReportDAO();
		SalesReport total = sReportDAO.getSnackBY();
		return total;
	}
}
