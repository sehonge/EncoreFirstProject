package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import config.ServerInfo;
import util.DataSourceManager;

public class CustomerDaoImpl implements CustomerDao{
	
	private DataSource ds;
	
	private static CustomerDaoImpl dao = new CustomerDaoImpl();
	
	private CustomerDaoImpl() {
		try {
			Class.forName(ServerInfo.DRIVER_NAME);
			System.out.println("드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			System.out.print("드라이버 로딩 실패 ");
			System.out.println(e);
		}
		//ds = DataSourceManager.getInstance().getConnection();
	}
	
	public static CustomerDaoImpl getInstance() {
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
	public boolean matchIdPassword(String id, String password) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}


	
	@Override
	public boolean SignUp(String id, String password, String name, String address, String phoneNumber, String email)
			throws SQLException {
		boolean ret = false;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = getConnection();
			String query = "INSERT INTO customer VALUES(?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			
			ps.setString(1, id);
			ps.setString(2, password);
			ps.setString(3, name);
			ps.setString(4, address);
			ps.setString(5, phoneNumber);
			ps.setString(6, email);
			ps.setInt(7, 0);
			
			
		} finally {
			closeAll(ps, conn);
		}
		
		return false;
	}

	@Override
	public String findId(String custEmail) throws SQLException {
		String ret = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String query = "SELECT * FROM customer WHERE CUST_EMAIL=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, custEmail);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				ret = rs.getString(1);
			}
			
		} finally {
			closeAll(rs, ps, conn);
		}
		
		return ret;
	}

	@Override
	public String findPw(String custId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer showCustomer(String custId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateInfo(Customer cust) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	
	public static void main(String[] args) throws SQLException {
		
		CustomerDaoImpl test = new CustomerDaoImpl();
		System.out.println(test.findId("encore@gmail.com"));

	}

}
