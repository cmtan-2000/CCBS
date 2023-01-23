package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.*;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public LoginController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		
		PrintWriter pw = response.getWriter();
		pw.println(userName);
		pw.println(password);
		
		
		User user = new User();
		user.setUserName(userName);
		user.setPassword(password);
		request.setAttribute("user", user);
		
		Auth auth = new Auth();
		auth.setUserName(userName);
		auth.setPassword(password);
		request.setAttribute("auth", auth);
		
		

		/*
		 * try { if((userName.equals("admin")) && (password.equals("admin"))) {
		 * pw.println("RUN ADMIN"); RequestDispatcher adminrd =
		 * request.getRequestDispatcher("/adminDashboard.jsp"); adminrd.forward(request,
		 * response); } else if((userName.equals("user")) && (password.equals("user")))
		 * { pw.println("RUN user"); RequestDispatcher userrd =
		 * request.getRequestDispatcher("/movieGridListView.jsp");
		 * userrd.forward(request, response); } else if((userName.equals("company")) &&
		 * (password.equals("company"))) { pw.println("RUN company"); RequestDispatcher
		 * MBOrd = request.getRequestDispatcher("/index.jsp"); MBOrd.forward(request,
		 * response); }else { pw.println("RUN Error"); } } catch(Exception e) {
		 * pw.println(e); RequestDispatcher errorRd =
		 * request.getRequestDispatcher("/errorLogin.jsp"); errorRd.forward(request,
		 * response); }
		 */
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		
		PrintWriter pw = response.getWriter();
		pw.println(userName);
		pw.println(password);
		
		
		User user = new User();
		user.setUserName(userName);
		user.setPassword(password);
		request.setAttribute("user", user);
		
		Auth auth = new Auth();
		auth.setUserName(userName);
		auth.setPassword(password);
		request.setAttribute("auth", auth);
		
		

		try {
			if((userName.equals("admin")) && (password.equals("admin"))) {
				pw.println("RUN ADMIN");	
				RequestDispatcher adminrd = request.getRequestDispatcher("/adminDashboard.jsp");
				adminrd.forward(request, response);
			}
			else if((userName.equals("user")) && (password.equals("user"))) {
				pw.println("RUN user");
				RequestDispatcher userrd = request.getRequestDispatcher("/movieGridListView.jsp");
				userrd.forward(request, response);
			}
			else if((userName.equals("company")) && (password.equals("company"))) {
				pw.println("RUN company");
				RequestDispatcher MBOrd = request.getRequestDispatcher("/index.jsp");
				MBOrd.forward(request, response);
			}else {
				pw.println("RUN Error");
			}
		}
		catch(Exception e) {
			pw.println(e);
			RequestDispatcher errorRd = request.getRequestDispatcher("errorLogin.jsp");
			errorRd.forward(request, response);
		}
	}

}
