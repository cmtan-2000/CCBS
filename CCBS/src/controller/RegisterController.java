package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.Blob;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.DBConnect;

@Controller
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterController() {
		super();
	}

	@RequestMapping("/register")
	protected ModelAndView register() {
		ModelAndView mv = new ModelAndView("register");
		return mv;
	}

	@PostMapping("/register_submit")
	protected ModelAndView clickRegister(@RequestParam("photoFile") MultipartFile photoFile, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		String phoneNo = request.getParameter("phoneNo");
		String address = request.getParameter("address");
		String state = request.getParameter("stateSelect");
		String town = request.getParameter("townSelect");
		String securityQ = request.getParameter("securityQuestion");
		String securityAns = request.getParameter("securityAns");
		InputStream fileContent = photoFile.getInputStream(); // insert image
		int type = 3; // customer

		java.sql.Date dob = Date.valueOf(request.getParameter("dob")); // convert date into sql date

		String completeAddress = address + " ," + town + " ," + state;

		String sql = "insert into `profile`(`username`, `password`, `name`, `type`, `dob`, `phoneNo`, "
				+ "`address`, `securityQType`, `securityQAns`, `photoFile`) values (?,?,?,?,?,?,?,?,?,?)";
		Connection con = DBConnect.openconnection();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, name);
			ps.setInt(4, type);
			ps.setDate(5, dob);
			ps.setString(6, phoneNo);
			ps.setString(7, completeAddress);
			ps.setString(8, securityQ);
			ps.setString(9, securityAns);
			ps.setBlob(10, fileContent);

			ps.executeUpdate();
			System.out.print("insert success");

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		ModelAndView mv = new ModelAndView("afterRegister");
		return mv;
	}

	@RequestMapping("/forgotPassword")
	protected ModelAndView forgotPassword() {
		ModelAndView mv = new ModelAndView("forgotPassword");
		return mv;
	}

	@PostMapping("/passwordRecovery_success")
	protected ModelAndView forgotPasswordRecovery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("userName");
		String newPassword = request.getParameter("newPassword");
		String securityQ = request.getParameter("securityQuestion");
		String securityAns = request.getParameter("securityAns");

		try {
			String sql = "select * from profile where username=?";
			Connection con = DBConnect.openconnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				System.out.print(rs.getString("username"));

				if (username.equals(rs.getString("username"))) {
					if (securityQ.equals(rs.getString("securityQType"))
							&& securityAns.equals(rs.getString("securityQAns"))) {
						String query = "update profile set password = ? where username = ?";
						ps = con.prepareStatement(query);
						ps.setString(1, newPassword);
						ps.setString(2, username);
						ps.executeUpdate();
					}
				}
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		ModelAndView mv = new ModelAndView("login");
		return mv;
	}
}
