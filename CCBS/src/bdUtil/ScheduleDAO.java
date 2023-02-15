package bdUtil;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import model.Schedule;

public class ScheduleDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	public void add() {
		String sql = "INSERT INTO `schedule`(`schedule_id`, `hall_id`, `movie_id`, `showtime_time`, `showtime_date`, `seatSold`, `seats`) VALUES (?,?,?,?,?,?,?)";
	}

	private DataSource getDataSource() {
		// TODO Auto-generated method stub
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

	public int add(Schedule schedule) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO `schedule`(`hall_id`, `movie_id`, `showtime_time`, `showtime_date`) VALUES (?,?,?,?,'?,')";
		
		Object args[] = {schedule.getHall_id(), schedule.getMovie_id(), schedule.getShowtime_time(), schedule.getShowtime_date(), schedule.getSeatSold()};
		int rowAffected = jdbct.update(sql, args);
		return rowAffected;
	}
}
