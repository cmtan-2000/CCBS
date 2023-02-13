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

import model.Detail;
import model.Movie;
import model.Price;

public class DetailDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	public List<Detail> getAll() {
		String sql = "select * from schedule";
		List<Detail> detailList = jdbct.query(sql, new BeanPropertyRowMapper<Detail>(Detail.class));
		return detailList;
	}

	public Detail findById(int id) {
		String sql = "select * from schedule where movie_id=?";
		Detail det = jdbct.queryForObject(sql, new BeanPropertyRowMapper<Detail>(Detail.class), id);
		return det;
	}

	public Price getMoviePrices(int movieId) {
		String sql = "select * from prices where movie_id=?";
		List<Map<String, Object>> rows = jdbct.queryForList(sql, movieId);
		Price price = new Price();
		for (Map<String, Object> row : rows) {
			String movType = row.get("type").toString();
			double movPrice = Double.parseDouble(row.get("movie_price").toString());
			switch (movType) {
			case "Deluxe":
				price.setDeluxe(movPrice);
				break;
			case "3D":
				price.setThreeD(movPrice);
				break;
			case "2D":
				price.setTwoD(movPrice);
				break;
			case "Premium":
				price.setPremium(movPrice);
				break;
			case "DualMax":
				price.setDualMax(movPrice);
				break;
			case "Classic":
				price.setClassic(movPrice);
				break;
			}
		}
		return price;
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