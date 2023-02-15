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

public class BookingDAO {
	// inform joan if you want to change this file***************************
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	public List<Map<String, Object>> findById(int scheduleId) {
		String sql = "select * from schedule where schedule_id=?";
		List<Map<String, Object>> inst = jdbct.queryForList(sql, scheduleId);
		return inst;
	}
	
	public Map<String, Object> getHallById(int scheduleId) {
		String sql = "SELECT * FROM hall " + 
				"INNER JOIN schedule on hall.hall_id = schedule.hall_id " + 
				"WHERE schedule.schedule_id = ?";
		return jdbct.queryForList(sql, scheduleId).get(0);
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