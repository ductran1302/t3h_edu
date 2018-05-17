package t3h.edu.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import t3h.edu.model.Product;
import t3h.edu.model.User;
import t3h.edu.util.DbUtil;

public class ProductDao {
	private Connection con;

	public ProductDao() {
		super();
		con = DbUtil.getConnection();
	}
	
	public String addProduct(Product product) {
		try {
			CallableStatement prepared = con.prepareCall("{call new_product(?,?,?,?,?,?,?,?)}");
			// Parameters start with 1
			prepared.setString(1, product.getProductName());
			prepared.setString(2, product.getOldPrice());
			prepared.setString(3, product.getNewPrice());
			prepared.setString(4, product.getProductMahang());
			prepared.setString(5, product.getProductSumary());
			prepared.setString(6, product.getProductLink());
			prepared.setString(7, product.getProductDescription());
			prepared.setString(8, product.getProductAvatar());
			prepared.executeUpdate();
			return "1";
		} catch (SQLException e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	public String deleteProduct(String productId) {
		try {
			PreparedStatement preparedStatement = con.prepareStatement("delete from product where product_id=?");
			// Parameters start with 1
			preparedStatement.setString(1, productId);
			preparedStatement.executeUpdate();
			return "1";
		} catch (SQLException e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	public List<Object> getAllProducts(String productId, String productName, String productMaHang, String rec_per_page,
			String page) {
		List<Object> list = new ArrayList<Object>();
		try {
			// Statement statement = con.createStatement();
			// ResultSet rs = statement.executeQuery(
			// "select * from users limit " + (page * rec_per_page -
			// rec_per_page) + "," + rec_per_page);
			CallableStatement statement = con.prepareCall("{call search_product(?,?,?,?,?)}");
			statement.setString(1, productId);
			statement.setString(2, productName);
			statement.setString(3, productMaHang);
			statement.setString(4, rec_per_page);
			statement.setString(5, page);
			ResultSet rs = statement.executeQuery();
			if (page.equals("-1")) {
				rs.next();
				list.add(rs.getString(1));
				list.add(rs.getString(2));
			} else {
				while (rs.next()) {
					Product product = new Product();
					product.setProductId(rs.getString("product_id"));
					product.setProductName(rs.getString("product_name"));
					product.setProductMahang(rs.getString("product_mahang"));
					product.setOldPrice(rs.getString("old_price"));
					product.setNewPrice(rs.getString("new_price"));
					product.setProductSumary(rs.getString("product_sumary"));
					product.setProductLink(rs.getString("product_link"));
					product.setProductAvatar(rs.getString("product_avatar"));
					product.setProductDescription(rs.getString("product_description"));
					product.setProductStatus(rs.getString("product_status"));
					list.add(product);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public List<String> countAllProduct(String piREC_PER_PAGE) {
		List<String> countAll = new ArrayList<String>();
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement
					.executeQuery("select ceil(count(*)/" + piREC_PER_PAGE + ") NOP, count(1) NOR  from product");
			rs.next();
			countAll.add(rs.getString(1));
			countAll.add(rs.getString(2));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return countAll;
	}
}
