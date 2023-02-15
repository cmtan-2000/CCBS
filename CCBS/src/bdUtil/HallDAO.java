package bdUtil;

import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import model.Branch;
import model.Hall;

public class HallDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());
	
	public Hall findById(int id) {
		String sql = "select * from hall where hall_id=?";
		Hall brch = jdbct.queryForObject(sql, new BeanPropertyRowMapper<Hall>(Hall.class), id);
		return brch; 
	}
	
	public List<Hall> getAll() {
		String sql = "select * from hall";
		List<Hall> hallList = jdbct.query(sql, new BeanPropertyRowMapper<Hall>(Hall.class));
		return hallList; 
	}
	
	public List<Hall> getBranchHall(int brchid){
		String sql = "select * from hall where brch_id= ?";
		System.out.print("Invoke here");
		List<Hall> results =  jdbct.query(sql,new Object[] {brchid},  new RowMapper<Hall>() {

			@Override
			public Hall mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				Hall hall = new Hall();
				hall.setAir_cond(rs.getString("air_cond"));
				hall.setBrch_id(rs.getInt("brch_id"));
				hall.setHall_id(rs.getInt("hall_id"));
				hall.setHall_type(rs.getString("hall_type"));
				hall.setSeat_type(rs.getString("seat_type"));
				hall.setSound_sys(rs.getString("sound_sys"));
				hall.setHall_condition(rs.getString("hall_condition"));
				hall.setSeat_type(rs.getString("seat_type"));
				hall.setHall_status(rs.getString("hall_status"));
				hall.setImage(rs.getBlob("image"));
				return hall;
			}
			
		});
		System.out.println(results);
		return results;
	}
	
	public int add (Hall hall, InputStream pic) {
	
		String hallSql = "insert into `hall` (`brch_id`, `hall_type`, `seat_type`, `air_cond`, `sound_sys`, `image`, `hall_condition`, `hall_status` ) values (?,?,?,?,?,?,?,?,)";
		Object args[] =  {	hall.getBrch_id(),	hall.getHall_type(), hall.getSeat_type(), hall.getAir_cond(), hall.getSound_sys(), hall.getImage(), hall.getHall_condition(), hall.getHall_status()};
		
		int rowAffected = jdbct.update(hallSql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setInt(1, hall.getBrch_id());
				ps.setString(2, hall.getHall_type());
				ps.setString(3, hall.getSeat_type());
				ps.setString(4, hall.getAir_cond());
				ps.setString(5, hall.getSound_sys());
				ps.setBlob(6, pic);
				ps.setString(7, hall.getHall_condition());
				ps.setString(8, hall.getHall_status());
			}
		});
		System.out.println(rowAffected);
		return rowAffected;
	}
	
	public int delete(int id) {
		String hallSql = "delete from `hall` where hall_id = ? ";
		int rowAffected = jdbct.update(hallSql, id);
		return rowAffected;
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