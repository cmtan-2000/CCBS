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

public class MovieDAO {
	// inform joan if you want to change this file***************************
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

	public void add(Map<String, String> req) throws SQLException {
		String movSql = "insert into `movie`(`user_id`, `name`, `description`, `director`, `casts`, `duration`, `genre_id`, `tags_id`, `story_by`, `year`, `poster`) values (?,?,?,?,?,?,?,?,?,?,?)";
		//get tags from checkboxes
		ArrayList<String> tags = new ArrayList<String>();
		for (String tagName : this.getAllMovieTags()) {
			System.out.println(req.get(tagName));
			if (req.get(tagName) != null || req.get(tagName) != "" || req.get(tagName) != "null")
				tags.add(req.getOrDefault(tagName, ""));
		}
		// get tag ids
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(getDataSource());
		MapSqlParameterSource parameters = new MapSqlParameterSource();
		parameters.addValue("tags", tags);
		List<Integer> tagIds = template.queryForList("select tags_id from tags where tag_name in (:tags)", parameters,
				Integer.class);
		System.out.println(tagIds);
		String listString = tagIds.toString().replaceAll(", ", ",");
		System.out.println(listString.substring(1, listString.length()-1));

		// get genre id
		int genreId = jdbct.queryForObject("select genre_id from movie_genre where movie_genre=?", Integer.class,
				req.get("genre")); // insert new movie
		Object movArgs[] = { 1, req.get("name"), req.get("description"), req.get("director"), req.get("cast"),
				req.get("duration"), genreId, listString.substring(1, listString.length()-1), req.get("screenplay"), req.get("year"),
				req.get("poster") };
		jdbct.update(movSql, movArgs);

		int newMovieId = jdbct.queryForObject("select movie_id from movie order by movie_id desc limit 1",
				Integer.class);

		// insert prices by of different movie type
		Object priceArgList[] = { req.get("deluxePrice"), req.get("dualmaxPrice"), req.get("3dPrice"),
				req.get("2dPrice"), req.get("premiumPrice"), req.get("classicPrice") };
		String[] movieTypes = { "Deluxe", "DualMax", "3D", "2D", "Premium", "Classic" };
		int index = 0;
		for (Object priceArgs : priceArgList) {
			if (priceArgs != null || priceArgs != "") {
				String priceSql = "insert into `prices` values (" + newMovieId + ", '" + movieTypes[index] + "',"
						+ priceArgs + ")";
				jdbct.update(priceSql);
			}
			index++;
		}

	}

	public void update(Map<String, String> req, int id) {
		int genreId = jdbct.queryForObject("select genre_id from movie_genre where movie_genre=?", Integer.class,
				req.get("genre"));
		String movSql = "update `movie` set user_id=1, name='" + req.get("name") + "', description='"
				+ req.get("description") + "', director='" + req.get("director") + "', casts='" + req.get("cast")
				+ "', duration='" + req.get("duration") + "', genre_id=" + genreId + ", tags_id='" + req.get("tags")
				+ "', story_by='" + req.get("screenplay") + "', year=" + req.get("year") + ", poster='"
				+ req.get("poster") + "' where movie_id=" + id;
		jdbct.update(movSql);

		// remove original price lists
		String removePriceSql = "delete from `prices` where movie_id =?";
		jdbct.update(removePriceSql, id);

		// insert prices by of different movie type
		Object priceArgList[] = { req.get("deluxePrice"), req.get("dualmaxPrice"), req.get("3dPrice"),
				req.get("2dPrice"), req.get("premiumPrice"), req.get("classicPrice") };
		String[] movieTypes = { "Deluxe", "DualMax", "3D", "2D", "Premium", "Classic" };
		int index = 0;
		for (Object priceArgs : priceArgList) {
			if (priceArgs != null || priceArgs != "") {
				String insertPriceSql = "insert into `prices` values (" + id + ", '" + movieTypes[index] + "',"
						+ priceArgs + ")";
				jdbct.update(insertPriceSql);
			}
			index++;
		}
	}

	public void delete(int id) {
		jdbct.update("delete from `prices` where movie_id =?", id);
		jdbct.update("delete from `movie` where movie_id =?", id);
	}


	public Map<Object, List<Map<String, Object>>> getBranchMovie(int movieId, String company, String city, String state, String date) {
		String sql = "SELECT b.brch_name, b.brch_addr, b.brch_post, b.brch_city, b.state, h.hall_id, h.hall_type, m.name, s.showtime_time, s.showtime_date, m.movie_id, s.schedule_id " + 
				"FROM branch AS b " + 
				"INNER JOIN hall AS h ON h.hall_id  = b.brch_id " + 
				"INNER JOIN schedule AS s ON s.hall_id = h.hall_id " + 
				"INNER JOIN movie AS m ON s.movie_id = m.movie_id ";
		sql = sql + " WHERE b.brch_city='"+city + "' AND b.state='"+state + "' AND m.movie_id='"+movieId;
		if(date!="") sql = sql + "' AND s.showtime_date='"+date;
		sql = sql + "' ORDER BY b.brch_name, s.showtime_time";
		List<Map<String, Object>> rs = jdbct.queryForList(sql);
//		System.out.println(sql);
//		System.out.println(rs);
		/*
		 * for(Map<String, Object> r: rs) { System.out.println(r.get("brch_name")); }
		 */
		Map<Object, List<Map<String, Object>>> branchMovieGrouped =
			    rs.stream().collect(Collectors.groupingBy(w -> w.get("brch_name")));
//		System.out.println(branchMovieGrouped);
		return branchMovieGrouped;
	}

	public String getMovieGenre(int genreId) {
		String sql = "select movie_genre from movie_genre where genre_id=?";
		return jdbct.queryForObject(sql, String.class, genreId);
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

	public List<String> getMovieTags(List<Integer> tagIds) {
		Set<Integer> set = new HashSet<Integer>(tagIds);
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(getDataSource());
		MapSqlParameterSource parameters = new MapSqlParameterSource();
		parameters.addValue("tagIds", set);
		List<String> inst = template.queryForList("select tag_name from tags where tags_id in (:tagIds)", parameters,
				String.class);
		return inst;
	}

	public List<String> getAllMovieTags() {
		String sql = "select tag_name from tags";
		return jdbct.queryForList(sql, String.class);
	}

	public List<String> getAllMovieGenres() {
		String sql = "select movie_genre from movie_genre";
		return jdbct.queryForList(sql, String.class);
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