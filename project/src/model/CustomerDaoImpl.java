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
	
	public static CustomerDaoImpl getInstance() {
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
	public boolean matchIdPassword(String id, String password) throws SQLException {
		boolean ret = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String query = "SELECT * FROM customer WHERE CUST_ID=? AND CUST_PW=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			if(rs.next()) ret = true;
			
		} finally {
			closeAll(rs, ps, conn);
		}
		
		return ret;
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
			System.out.println("PreparedStatement 생성.. SignUp");
			
			ps.setString(1, id);
			ps.setString(2, password);
			ps.setString(3, name);
			ps.setString(4, address);
			ps.setString(5, phoneNumber);
			ps.setString(6, email);
			ps.setInt(7, 0);
			
			ps.executeUpdate();
			
			ret = true;
		} finally {
			closeAll(ps, conn);
		}
		
		return ret;
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
		String ret = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String query = "SELECT CUST_PW FROM customer WHERE CUST_ID=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, custId);
			
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
	public Customer showCustomer(String custId) throws SQLException {
		
		Customer ret = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String query = "SELECT * FROM customer WHERE CUST_ID=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, custId);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				ret = new Customer(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getInt(7)
						);
			}
			
		} finally {
			closeAll(rs, ps, conn);
		}
		
		return ret;
	}

	@Override
	public boolean updateInfo(String custId, String custAddr, String custContact) throws SQLException {
		boolean ret = false;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = getConnection();
			String query = "UPDATE customer SET CUST_ADDR=?, CUST_CONTACT=? WHERE CUST_ID=?";
			ps = conn.prepareStatement(query);
			System.out.println("PreparedStatement 생성.. updateInfo");
			
			ps.setString(1, custAddr);
			ps.setString(2, custContact);
			ps.setString(3, custId);
			
			ps.executeUpdate();
			ret = true;
		} finally {
			closeAll(ps, conn);
		}
		
		return ret;
	}

	/*
	public static void main(String[] args) throws SQLException {
		
		CustomerDaoImpl test = new CustomerDaoImpl();
		System.out.println(test.findId("encore@gmail.com"));
		
		System.out.println(test.SignUp("sehonge1602", "1234", "임세홍", "서울시", "01052341230", "h@naver.com"));
		
		System.out.println(test.matchIdPassword("date", "1234"));
		
		System.out.println(test.findPw("encore"));
		
		System.out.println(test.showCustomer("encore"));
		
		System.out.println(test.updateInfo("encore", "경기도", "010-1111-2222"));
		
	}
	*/

}
