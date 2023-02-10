package controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.SalesReportDAO;
import model.SalesReport;

@Controller
@RequestMapping("/salesReport")
public class SalesReportController {

	SalesReportDAO sReportDAO = new SalesReportDAO();
	
	@RequestMapping("/day")
	@ResponseBody()
	protected String day(@RequestParam Map<String, String> req) {
		
		SalesReport sReport = new SalesReport();
		
		String Branch_id = req.get("branch_id");
		sReport.setBranch_name(Branch_id);
		String dispMode = req.get("filter");
		sReport.setDispMode(dispMode);
		
		List<SalesReport> ticketSubTList = sReportDAO.getTicketSubT();
		List<SalesReport> SnkBvgSubTList = sReportDAO.getSnackBeverageT()();
		for(int i=0; i<ticketSubTList.size(); i++) {
			String ticketSubT += ticketSubTList.get(i);
			return ticketSubT;
		}
		
		for(int i=0; i<SnkBvgSubTList.size(); i++) {
			String snackBSubTL += SnkBvgSubTList.get(i);
			return snackBSubT;
		}		
	}
	
	@RequestMapping("/month")
	@ResponseBody()
	protected String month(@RequestParam Map<String, String> req) {
		
		SalesReport sReport = new SalesReport();
		
		String Branch_id = req.get("branch_id");
		sReport.setBranch_name(Branch_id);
		String dispMode = req.get("filter");
		sReport.setDispMode(dispMode);
		
		List<SalesReport> ticketSubTList = sReportDAO.getTicketSubT();
		List<SalesReport> SnkBvgSubTList = sReportDAO.getSnackBeverageT()();
		for(int i=0; i<ticketSubTList.size(); i++) {
			String ticketSubT += ticketSubTList.get(i);
			return ticketSubT;
		}
		
		for(int i=0; i<SnkBvgSubTList.size(); i++) {
			String snackBSubTL += SnkBvgSubTList.get(i);
			return snackBSubT;
		}
				
	}
	
	@RequestMapping("/year")
	@ResponseBody()
	protected String year(@RequestParam Map<String, String> req) {
		
		SalesReport sReport = new SalesReport();
		
		String Branch_id = req.get("branch_id");
		sReport.setBranch_name(Branch_id);
		String dispMode = req.get("filter");
		sReport.setDispMode(dispMode);
		
		List<SalesReport> ticketSubTList = sReportDAO.getTicketSubT();
		List<SalesReport> SnkBvgSubTList = sReportDAO.getSnackBeverageT()();
		for(int i=0; i<ticketSubTList.size(); i++) {
			String ticketSubT += ticketSubTList.get(i);
			return ticketSubT;
		}
		
		for(int i=0; i<SnkBvgSubTList.size(); i++) {
			String snackBSubTL += SnkBvgSubTList.get(i);
			return snackBSubT;
		}
				
	}

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("salesReport");
		List<SalesReport> sReportList = sReportDAO.getDay();
		model.addObject(sReportList);
		return model;
	}
	
}
