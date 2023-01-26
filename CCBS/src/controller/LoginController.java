package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.*;

//@WebServlet("/LoginController")
@Controller
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public LoginController() {
        super();
    }
    
    @PostMapping("/login")
	protected ModelAndView login(@RequestParam Map<String, String> request){
    	
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

}
