package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import config.ServerInfo;
import util.DataSourceManager;

public class OrderDescDaoImpl implements OrderDescDao {

private DataSource ds;
	
	private static OrderDescDaoImpl dao = new OrderDescDaoImpl();
	
	private OrderDescDaoImpl() {
		
		try {
			Class.forName(ServerInfo.DRIVER_NAME);
			System.out.println("드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			System.out.print("드라이버 로딩 실패 ");
			System.out.println(e);
		}
		
		//ds = DataSourceManager.getInstance().getConnection();
	}
	
	public static OrderDescDaoImpl getInstance() {
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
	public boolean writeOrderDesc(String orderId, String menuId, int num) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	

}
