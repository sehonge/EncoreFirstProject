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

public class ShopDaoImpl implements ShopDao {
	
	private DataSource ds;
	
	private static ShopDaoImpl dao = new ShopDaoImpl();
	
	private ShopDaoImpl() {
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
	
	public static ShopDaoImpl getInstance() {
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
	public ArrayList<Shop> getAllShop() throws SQLException {
		
		ArrayList<Shop> list = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			list = new ArrayList<Shop>();
			conn = getConnection();
			String query = "SELECT * FROM shop";
			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Shop(
						rs.getInt(1), 
						rs.getString(2), 
						rs.getString(3), 
						rs.getString(4)
						));
			}
			
		} finally {
			closeAll(rs, ps, conn);
		}
		
		return list;
	}

	@Override
	public Shop showShop(int shop_id) throws SQLException {
		
		Shop ret = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String query = "SELECT * FROM shop WHERE SHOP_ID=?";
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, shop_id);
			
			rs = ps.executeQuery();
			if(rs.next()) 
				ret = new Shop(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4)
						);
			
		} finally {
			closeAll(rs, ps, conn);
		}
		
		return ret;
	}
	
	/*
	public static void main(String[] args) throws SQLException {
		
		ShopDaoImpl test = new ShopDaoImpl();
		
		for(Shop shop : test.getAllShop())
			System.out.println(shop);
		
		System.out.println(test.showShop(1));

	}
	*/
}
