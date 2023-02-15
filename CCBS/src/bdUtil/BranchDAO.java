package bdUtil;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.ui.Model;

import model.Branch;

public class BranchDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	public List<Branch> getAll() {
		String sql = "select * from branch";
		List<Branch> movieList = jdbct.query(sql, new BeanPropertyRowMapper<Branch>(Branch.class));
		return movieList; 
	}

	public Branch findById(int id) {
		String sql = "select * from branch where brch_id=?";
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
	
	public List<Map<String, Object>> getBranchHall() {
		String sql = "SELECT hall.hall_id, hall.brch_id, profile.user_id, profile.name, branch.brch_name FROM profile " + 
				"INNER JOIN branch on profile.user_id = branch.user_id " + 
				"INNER JOIN hall ON branch.brch_id = hall.brch_id";
		return jdbct.queryForList(sql);
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
