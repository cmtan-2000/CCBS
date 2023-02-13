package bdUtil;

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.ui.Model;

import model.Movie;
import model.Price;
import model.SalesReport;

public class SalesReportDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	public List<SalesReport> getAll() {
		String sql = "select * from report";
		List<SalesReport> reportList = jdbct.query(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class));
		return reportList;
	}

	public SalesReport findByDay(String date) {
		String sql = "select * from report where date=?";
		SalesReport sReport = jdbct.queryForObject(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class), date);
		return sReport;
	}
	
	public SalesReport findByWeek(String date) {
		String sql = "select * from report where week(date)";
		SalesReport sReport = jdbct.queryForObject(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class), date);
		return sReport;
	}
	
	public SalesReport findByMonth(String date) {
		String sql = "select * from report where month(date)";
		SalesReport sReport = jdbct.queryForObject(sql, new BeanPropertyRowMapper<SalesReport>(SalesReport.class), date);
		return sReport;
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