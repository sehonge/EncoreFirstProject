package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.sql.DataSource;

import config.ServerInfo;
import util.DataSourceManager;

public class OrderDaoImpl implements OrderDao {
	
	private DataSource ds;
	
	private static OrderDaoImpl dao = new OrderDaoImpl();
	
	private OrderDaoImpl() {
		/*
		try {
			Class.forName(ServerInfo.DRIVER_NAME);
			System.out.println("드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			System.out.print("드라이버 로딩 실패 ");
			System.out.println(e);
		}
		*/
		ds = DataSourceManager.getInstance().getConnection();
	}
	
	public static OrderDaoImpl getInstance() {
		return dao;
	}
	
	public Connection getConnection() throws SQLException {
		System.out.println("디비연결...");
		
		//return DriverManager.getConnection(ServerInfo.URL, ServerInfo.USER, ServerInfo.PASS);
		return ds.getConnection();
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
		HashMap<String, Integer> orderList = new HashMap<String, Integer>();
		int orderIndex = -1;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			for(Menu menu : list) {
				totalPrice += menu.getMenuPrice();
				String menuId = menu.getMenuId();
				if(orderList.containsKey(menuId))
					orderList.replace(menuId, orderList.get(menuId) + 1);
				else orderList.put(menuId, 1);
			}
			
			String query = "INSERT INTO tb_order (CUST_ID, SHOP_ID, ORDER_ADDR, ORDER_PRICE) VALUES(?, ?, ?, ?)";
			ps = conn.prepareStatement(query);
			
			ps.setString(1, customer.getCustId());
			ps.setInt(2, shop.getShopId());
			ps.setString(3, customer.getCustAddr());
			ps.setInt(4, totalPrice);
			
			ps.executeUpdate();
			
			flag = true;
		} finally {
			closeAll(ps, conn);
		}
		
		try {
			conn = getConnection();
			
			String query = "SELECT COUNT(*) FROM tb_order";
			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			
			if(rs.next()) orderIndex = rs.getInt(1);
			
		} finally {
			closeAll(rs, ps, conn);
		}
		
		Iterator<String> iter = orderList.keySet().iterator();
		while(iter.hasNext()) {
			String key = iter.next();
			order_desc(key, orderList.get(key), orderIndex);
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
	
	@Override
	public boolean order_desc(String menuId, int num, int orderId) throws SQLException {
		
		boolean flag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = getConnection();
			
			String query = "INSERT INTO order_desc VALUES(?, ?, ?)";
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, orderId);
			ps.setString(2, menuId);
			ps.setInt(3, num);
			
			ps.executeUpdate();
			
			flag = true;
		} finally {
			closeAll(ps, conn);
		}
		
		return flag;
	}	
		
	/*
	public static void main(String[] args) throws SQLException {
		
		OrderDaoImpl test = new OrderDaoImpl();
		
		ArrayList<Menu> arr = new ArrayList<Menu>();
		arr.add(MenuDaoImpl.getInstance().getPizza("P001-L"));
		arr.add(MenuDaoImpl.getInstance().getPizza("P002-R"));
		arr.add(MenuDaoImpl.getInstance().getPizza("P002-R"));
		
		System.out.println(test.makeOrder(
				arr, 
				CustomerDaoImpl.getInstance().showCustomer("encore"), 
				ShopDaoImpl.getInstance().showShop(2)));

	}

	*/
	
}
