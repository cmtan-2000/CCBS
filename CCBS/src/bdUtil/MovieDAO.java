package bdUtil;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.ui.Model;

import model.Movie;

public class MovieDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	public List<Movie> getAll() {
		String sql = "select * from movie";
		List<Movie> movieList = jdbct.query(sql, new BeanPropertyRowMapper<Movie>(Movie.class));
		return movieList; 
	}

	public Movie findById(int id) {
		String sql = "select * from movie where movie_id=?";
		Movie inst = jdbct.queryForObject(sql, new BeanPropertyRowMapper<Movie>(Movie.class), id);
		return inst; 
	}

	public int add(Map<String, String> req) {
		String movSql = "insert into `movie`(`movie_id`, `user_id`, `name`, `description`, `director`, `casts`, `duration`,`price_id`, `movie_type`, `tags_id`, `story_by`, `year`, `poster`) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//		String priceSql = "insert into `prices` (`price_id`, `moviePrice`) values (?,?)";
		Object args[] = { req.get("name"), req.get("tags"), req.get("formFile"), req.get("deluxePrice")};

//		jdbct.update(priceSql, args);
		int rowAffected = jdbct.update(movSql, args);
		return rowAffected;
	}

	public int update(Movie inst, int id) {
		String sql = "update `movie` set name=?, gender=?, specialty=? where id=?";
		int rowAffected = jdbct.update(sql, inst.getName(), id);
		return rowAffected;
	}

	public int delete(int id) {
		String movSql = "delete from `movie` where movie_id = ?";
		String priceSql = "delete from `prices` where price_id = ?";
		jdbct.update(priceSql);
		int rowAffected = jdbct.update(movSql);
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
