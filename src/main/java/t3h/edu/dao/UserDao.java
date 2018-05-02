package t3h.edu.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.shiro.authc.credential.Md5CredentialsMatcher;

import t3h.edu.model.User;
import t3h.edu.util.DbUtil;

public class UserDao {

	private Connection con;

	public UserDao() {
		con = DbUtil.getConnection();
	}

	public String addUser(User user) {
		try {
			PreparedStatement prepared = con.prepareStatement(
					"insert into cms.users(user_name,first_name,last_name,user_pass,user_email,user_phone) values (?, ?, ?, md5(?), ?, ? )");
			// Parameters start with 1
			prepared.setString(1, user.getUserName());
			prepared.setString(2, user.getFirstName());
			prepared.setString(3, user.getLastName());
			prepared.setString(4, user.getPassword());
			prepared.setString(5, user.getEmail());
			prepared.setString(6, user.getUserPhone());
			prepared.executeUpdate();
			return "1";
		} catch (SQLException e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}

	public String deleteUser(String username) {
		try {
			PreparedStatement preparedStatement = con.prepareStatement("delete from users where user_name=?");
			// Parameters start with 1
			preparedStatement.setString(1, username);
			preparedStatement.executeUpdate();
			return "1";
		} catch (SQLException e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}

	public String updateUser(User user) {
		try {
			PreparedStatement preparedStatement = con.prepareStatement(
					"update users set first_name=?, last_name=?, user_email=?, user_phone=?" + "where user_name=?");
			// Parameters start with 1
			preparedStatement.setString(1, user.getFirstName());
			preparedStatement.setString(2, user.getLastName());
			// preparedStatement.setString(3, user.getPassword());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getUserPhone());
			preparedStatement.setString(5, user.getUserName());
			preparedStatement.executeUpdate();
			return "1";

		} catch (SQLException e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}

	public List<Object> getAllUsers(String username, String firstName, String lastName, String rec_per_page,
			String page) {
		List<Object> list = new ArrayList<Object>();
		try {
			// Statement statement = con.createStatement();
			// ResultSet rs = statement.executeQuery(
			// "select * from users limit " + (page * rec_per_page -
			// rec_per_page) + "," + rec_per_page);
			CallableStatement statement = con.prepareCall("{call search_users(?,?,?,?,?)}");
			statement.setString(1, username);
			statement.setString(2, firstName);
			statement.setString(3, lastName);
			statement.setString(4, rec_per_page);
			statement.setString(5, page);
			ResultSet rs = statement.executeQuery();
			if (page.equals("-1")) {
				rs.next();
				list.add(rs.getString(1));
				list.add(rs.getString(2));
			} else {
				while (rs.next()) {
					User user = new User();
					user.setUserName(rs.getString("user_name"));
					user.setFirstName(rs.getString("first_name"));
					user.setLastName(rs.getString("last_name"));
					user.setEmail(rs.getString("user_email"));
					user.setUserPhone(rs.getString("user_phone"));
					list.add(user);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<String> countAllUsers(String piREC_PER_PAGE) {
		List<String> countAll = new ArrayList<String>();
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement
					.executeQuery("select ceil(count(*)/" + piREC_PER_PAGE + ") NOP, count(1) NOR  from users");
			rs.next();
			countAll.add(rs.getString(1));
			countAll.add(rs.getString(2));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return countAll;
	}

	public User getUserById(String userId) {
		User user = new User();
		try {
			PreparedStatement preparedStatement = con.prepareStatement("select * from users where user_name=?");
			preparedStatement.setString(1, userId);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				user.setUserName(rs.getString("user_name"));
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setEmail(rs.getString("user_email"));
				user.setUserPhone(rs.getString("user_phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}
}
