package controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.FABDAO;
import bdUtil.MovieDAO;
import model.FAB;

@Controller
public class FABController {

	FABDAO fabDAO = new FABDAO();

	public FABController() {
		super();
	}
	
	@PostMapping("/company/fab/create")
	public String create(@RequestParam Map<String, String> req) {
		try {
			if(req.get("formType").equals("create")) fabDAO.add(req);
			else if(req.get("formType").equals("edit")) fabDAO.update(req, Integer.parseInt(req.get("id")));
			return "redirect:/company";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "an error occured";
	}
	
	@RequestMapping("/company/fab/edit/{package}/{id}")
	public ModelAndView viewForm(@PathVariable Map<String, String> pathV) {		
		int id = Integer.valueOf(pathV.get("id"));
		String pckg = pathV.get("package");
		ModelAndView mav = new ModelAndView("addSnackModal");
		mav.addObject("fab", fabDAO.findById(pckg, id));
		mav.addObject("fabType", pckg);
		return mav;
	}

	@RequestMapping("/company/fab/delete/{package}/{id}")
	public String cDelete(@PathVariable Map<String, String> pathV) {
		fabDAO.delete(pathV.get("package"), Integer.valueOf(pathV.get("id")));
		return "redirect:/company";
	}
	
	//joan:please move this to related controller, user in checkoutFoodBeverage.jsp
	@RequestMapping("/movie/2/book")
	public ModelAndView book(@PathVariable Map<String, String> pathV) {
		ModelAndView mav = new ModelAndView("checkoutFoodBeverage");
		FABDAO fabDAO = new FABDAO();
		Map<String, List<FAB>> fabList = fabDAO.getAllFAB();
		mav.addObject("FABList", fabList);
		return mav;
	}
}