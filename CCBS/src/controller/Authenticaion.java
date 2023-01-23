package controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.User;

@Controller
@RequestMapping("/auth")
public class Authenticaion {

	@PostMapping("/login")
//	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody()
	protected ModelAndView login(@RequestParam Map<String, String> request) {
//		TODO: Check the account does it existed in db
		ModelAndView model = null;
		
		String username = request.get("username");
		String password = request.get("password");
		
		User user = new User();
		user.setUserName(username);
		user.setPassword(password);
		
		if(username.equals("admin") && password.equals("admin")) {
			model = new ModelAndView("adminDashboard");
		}else if(username.equals("company") && password.equals("company")) {
			model = new ModelAndView("index");
		}else if(username.equals("user") && password.equals("user")) {
			model = new ModelAndView("viewMovie");
		}else {
			model = new ModelAndView("errorLogin");
		}
		return model;
	}
	
	@RequestMapping("/register")
	protected ModelAndView getRegiterForm(@RequestParam Map<String, String> req) {
//		TODO: Register user account in db
		String username = req.get("username");
		String password = req.get("password");
		
		System.out.print(username + password);
		
		ModelAndView model = new ModelAndView("");
		model.addObject("YourDATA", "yourValue");
		return model;
	}
	
	
	public boolean match(String userName, String password) {
//		TODO: match the username and password from the database
		
		boolean match;
		if((userName.equals("admin")) && (password.equals("admin"))) {
			return match = true;
		}
		else if((userName == "user") && (password == "user")) {
			return match = true;
		}
		else if((userName == "company") && (password == "company")) {
			return match = true;
		}
		else {
			return match = false;
		}
	}
}
