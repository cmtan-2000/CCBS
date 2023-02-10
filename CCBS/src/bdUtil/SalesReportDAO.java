package bdUtil;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import model.SalesReport;;

public class SalesReportDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());
	
	public SalesReport findById(int id) {
		String sql = "select * from branch where branch_id=?";
		SalesReport sReportBranch = jdbct.queryForObject(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class), id);
		return sReportBranch; 
	}
	
	// waiting for the payment part
	public List<SalesReport> getTicketSubT() {
		String sql = "select * from ?";
		List<SalesReport> ticketSubT = jdbct.query(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class));
		return ticketSubT; 
	}

	public List<SalesReport> getSnackBeverageT() {
		String sql = "select * from ?";
		List<SalesReport> snackBeverageT = jdbct.query(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class));
		return snackBeverageT; 
	}

	public DataSource getDataSource() {
		DataSource ds = null;
		String dbURL = "jdbc:mysql://localhost:3306/ccbs";
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
