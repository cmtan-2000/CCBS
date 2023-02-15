package bdUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Branch;

@Controller
public class BranchDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	@RequestMapping("/test")
	public List<Branch> getCompanyBranch(int userid){
		String sql = "select * from branch where user_id = ?";
		
		List<Branch> results =  jdbct.query(sql,new Object[] {userid},  new RowMapper<Branch>() {

			@Override
			public Branch mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				Branch branch = new Branch();
				branch.setBrch_id(rs.getInt("brch_id"));
				branch.setUser_id(rs.getInt("user_id"));
				branch.setBrch_name(rs.getString("brch_name"));
				branch.setBrch_addr(rs.getString("brch_addr"));
				branch.setBrch_post(rs.getString("brch_post"));
				branch.setBrch_city(rs.getString("brch_city"));
				branch.setState(rs.getString("state"));
				return branch;
			}
			
		});
		System.out.println(results);
		return results;
	}
	
	public List<Branch> getAll() {
		String sql = "select * from branch";
		List<Branch> brchList = jdbct.query(sql, new BeanPropertyRowMapper<Branch>(Branch.class));
		return brchList; 
	}

	public Branch findById(int id) {
		String sql = "select * from branch where user_id=?";
		Branch brch = jdbct.queryForObject(sql, new BeanPropertyRowMapper<Branch>(Branch.class), id);
		return brch; 
	}

	public int add(Branch brch) {
		String branchSql = "insert into `branch`(`user_id`,`brch_name`, `brch_addr`, `brch_post`, `brch_city`, `state`) values (?,?,?,?,?,?)";
//		String priceSql = "insert into `prices` (`price_id`, `moviePrice`) values (?,?)";
		Object args[] = { brch.getUser_id(), brch.getBrch_name(), brch.getBrch_addr(), brch.getBrch_post(), brch.getBrch_city(), brch.getState()};

//		jdbct.update(priceSql, args);
		int rowAffected = jdbct.update(branchSql, args);
		return rowAffected;
	}

	public int update(Branch brch, int id) {
		String sql = "update `branch` set brch_name=?, brch_addr=?, brch_post=? , brch_city=?, state=? where id=?";
		Object args[] = { brch.getUser_id(), brch.getBrch_name(), brch.getBrch_addr(), brch.getBrch_post(), brch.getBrch_city(), brch.getState()};
		int rowAffected = jdbct.update(sql, args, id);
		return rowAffected;
	}

	public int delete(int id) {
		String brchSql = "delete from `branch` where brch_id = ?";
		int rowAffected = jdbct.update(brchSql, id);
		return rowAffected;
	}
	
	public List<Map<String, Object>> getHallMovieByType(int hallId) {
		String sql = "SELECT * FROM movie " + 
				"INNER JOIN prices ON prices.movie_id = movie.movie_id " + 
				"WHERE prices.type IN(SELECT hall.hall_type  FROM hall " + 
				"INNER JOIN branch on hall.brch_id  = branch.brch_id " + 
				"WHERE hall.hall_id = "+hallId+" )";
		return jdbct.queryForList(sql);
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