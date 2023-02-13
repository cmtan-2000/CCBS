package bdUtil;

import java.util.List;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import model.SalesReport;;

public class SalesReportDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());
	
	public SalesReport getBranchName(HttpServletRequest req) {
		int id = Integer.parseInt(req.getParameter("branch_id"));
		String sql = "select brch_name from branch where id=?";
		SalesReport sReport = jdbct.queryForObject(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class), id);
		return sReport;
	}
	
	public String getType(HttpServletRequest req) {
		String type = req.getParameter("filter");
		return type;
	}
	
	public SalesReport getTicketD() {
		String tp = "movie ticket";
		
		//getDate
//		LocalDate dateObj = LocalDate.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		String Date = dateObj.format(formatter);
		String Date = "2023-01-13";
		
		String sql = "select total from record where type=" + tp + "and date= " + Date;
		SalesReport sReport = jdbct.queryForObject(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class));
		return sReport;
	}
	
	public SalesReport getTicketM() {
		String tp = "movie ticket";
		
		//getDate
//		LocalDate dateObj = LocalDate.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		String Date = dateObj.format(formatter);
		String Date = "2023-2-13";
		String Date1 = "2023-2-1";
		
		String sql = "select total from record where type=" + tp + "and date between " + Date + " and " + Date1;
		SalesReport sReport = jdbct.queryForObject(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class));
		return sReport;
	}
	
	public SalesReport getTicketY() {
		String tp = "movie ticket";
		
		//getDate
//		LocalDate dateObj = LocalDate.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		String Date = dateObj.format(formatter);
		String Date = "2023-2-13";
		String Date1 = "2023-1-1";
				
		String sql = "select total from record where type=" + tp + "and date between " + Date + " and " + Date1;
		SalesReport sReport = jdbct.queryForObject(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class));
		return sReport;
	}
	
	public SalesReport getSnackBD() {
		String tp = "snack n beverage";
		
		//getDate
//		LocalDate dateObj = LocalDate.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		String Date = dateObj.format(formatter);
		String Date = "2023-2-13";
		
		String sql = "select total from record where type=" + tp + "and date= " + Date;
		SalesReport sReport = jdbct.queryForObject(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class));
		return sReport;
	}
	
	public SalesReport getSnackBM() {
		String tp = "snack n beverage";
		
		//getDate
//		LocalDate dateObj = LocalDate.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		String Date = dateObj.format(formatter);
		String Date = "2023-2-13";
		String Date1 = "2023-2-1";
		
		String sql = "select total from record where type=" + tp + "and date between " + Date + " and " + Date1;
		SalesReport sReport = jdbct.queryForObject(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class));
		return sReport;
	}
	
	public SalesReport getSnackBY() {
		String tp = "snack n beverage";
		
		//getDate
//		LocalDate dateObj = LocalDate.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		String Date = dateObj.format(formatter);
		String Date = "2023-2-13";
		String Date1 = "2023-1-1";
		
		String sql = "select total from record where type=" + tp + "and date between " + Date + " and " + Date1;
		SalesReport sReport = jdbct.queryForObject(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class));
		return sReport;
	}

	public DataSource getDataSource() {
		DataSource ds = null;
		String dbURL = "jdbc:mysql://localhost:3307/ccbs";
		String username = "root";
		String password = "";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		ds = new DriverManagerDataSource(dbURL, username, password);
		return ds;
	}
}
