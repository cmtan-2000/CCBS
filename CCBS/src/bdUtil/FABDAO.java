package bdUtil;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.bind.annotation.RequestMapping;

import model.FAB;

public class FABDAO {

	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

	public Map<String, List<FAB>> getAllFAB() {
		Map<String, List<FAB>> fabs = new HashMap<>();

		List<FAB> foodList = jdbct.query("select * from food", new BeanPropertyRowMapper<FAB>(FAB.class));
		List<FAB> comboList = jdbct.query("select * from combo", new BeanPropertyRowMapper<FAB>(FAB.class));
		List<FAB> drinkList = jdbct.query("select * from drink", new BeanPropertyRowMapper<FAB>(FAB.class));

		fabs.put("food", foodList);
		fabs.put("combo", comboList);
		fabs.put("drink", drinkList);
		return fabs;
	}

	public FAB findById(String pckg, int id) {
		System.out.println(jdbct.queryForObject("select * from " + pckg + " where fab_id=" + id,
				new BeanPropertyRowMapper<FAB>(FAB.class)));
		return jdbct.queryForObject("select * from " + pckg + " where fab_id=" + id,
				new BeanPropertyRowMapper<FAB>(FAB.class));
	}

	public void add(Map<String, String> req) throws SQLException {
		String fabSql = "insert into `" + req.get("package")
				+ "`(`user_id`, `name`, `price`, `stock_quantity`) values (?,?,?,?)";
		System.out.println(fabSql);
		Object fabArgs[] = { 1, req.get("name"), Double.parseDouble(req.get("price")),
				Integer.parseInt(req.get("quantity")) };
		jdbct.update(fabSql, fabArgs);
	}

	public void update(Map<String, String> req, int id) throws SQLException {
		String fabSql = "update `" + req.get("package") + "` set user_id=1, name='" + req.get("name") + "', price="
				+ req.get("price") + ", stock_quantity=" + req.get("quantity") + " where fab_id=" + id;
		jdbct.update(fabSql);
	}

	public void delete(String pckg, int id) {
		jdbct.update("delete from `" + pckg + "` where fab_id =" + id);
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