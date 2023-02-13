package bdUtil;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import model.Seat;

public class SeatDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	public List<Seat> getAll() {
		String sql = "select * from seat";
		List<Seat> seatList = jdbct.query(sql, new BeanPropertyRowMapper<Seat>(Seat.class));
		return seatList; 
	}

	public int defaultData(Seat seat) {
		String sql = "insert into `seat`(`seat_detail`,`hall_id`) values (" + seat.getSeatJson() + "," + seat.getHall_id() + ")";
		Object args[] = {seat.getSeatJson(), seat.getHall_id()};
		int rowAffected = jdbct.update(sql, args);
		return rowAffected; 
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
