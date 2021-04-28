package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import config.ServerInfo;
import util.DataSourceManager;

public class OrderDaoImpl implements OrderDao {
	
	private DataSource ds;
	
	private static OrderDaoImpl dao = new OrderDaoImpl();
	
	private OrderDaoImpl() {
		
		try {
			Class.forName(ServerInfo.DRIVER_NAME);
			System.out.println("드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			System.out.print("드라이버 로딩 실패 ");
			System.out.println(e);
		}
		
		//ds = DataSourceManager.getInstance().getConnection();
	}
	
	public static OrderDaoImpl getInstance() {
		return dao;
	}
	
	public Connection getConnection() throws SQLException {
		System.out.println("디비연결...");
		
		return DriverManager.getConnection(ServerInfo.URL, ServerInfo.USER, ServerInfo.PASS);
		//return ds.getConnection();
	}
	
	public void closeAll(PreparedStatement ps, Connection conn) throws SQLException{
		if(ps!=null) ps.close();		
		if(conn != null) conn.close();
		return;
	}
	
	public void closeAll(ResultSet rs, PreparedStatement ps, Connection conn) throws SQLException{		
		if(rs != null)	rs.close();
		closeAll(ps, conn);		
		return;
	}
	
	@Override
	public boolean makeOrder(ArrayList<Menu> list, Customer customer, Shop shop) throws SQLException {
		
		boolean flag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		int totalPrice = 0;
		
		try {
			conn = getConnection();
			
			for(Menu menu : list) {
				totalPrice += menu.getMenuPrice();
			}
			
			String query = "INSERT INTO tb_order VALUES(?, ?, ?, ?)";
			ps = conn.prepareStatement(query);
			
			ps.setString(2, customer.getCustId());
			ps.setString(3, shop.getShopId());
			ps.setString(5, customer.getCustAddr());
			ps.setInt(6, totalPrice);
			
			ps.executeUpdate();
			flag = true;
		} finally {
			closeAll(ps, conn);
		}
		
		spendMoney(customer.getCustId(), totalPrice);
		
		return flag;
	}

	@Override
	public boolean spendMoney(String custId, int money) throws SQLException {
		
		boolean ret = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int totalPrice = 0;
		
		try {
			conn = getConnection();
			String query = "SELECT CUST_TOTAL_PRICE FROM customer WHERE CUST_ID=?";
			ps = conn.prepareStatement(query);
			System.out.println("PreparedStatement 생성.. getMoney");
			
			ps.setString(1, custId);
			
			rs = ps.executeQuery();
			if(rs.next()) totalPrice = rs.getInt(1);
						
		} finally {
			closeAll(rs, ps, conn);
		}
		
		try {
			conn = getConnection();
			String query = "UPDATE customer SET CUST_TOTAL_PRICE=? WHERE CUST_ID=?";
			ps = conn.prepareStatement(query);
			System.out.println("PreparedStatement 생성.. addMoney");
			
			ps.setInt(1, totalPrice + money);
			ps.setString(2, custId);
			
			ps.executeUpdate();
			
			ret = true;
		} finally {
			closeAll(ps, conn);
		}
		
		return ret;
	}
		
	
	public static void main(String[] args) {
		
		OrderDaoImpl test = new OrderDaoImpl();
		
		//System.out.println(test.makeOrder(null, null, null));

	}

}
