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

public class AddressDaoImpl implements AddressDao {

private DataSource ds;
	
	private static AddressDaoImpl dao = new AddressDaoImpl();
	
	private AddressDaoImpl() {
		/*
		try {
			Class.forName(ServerInfo.DRIVER_NAME);
			System.out.println("DB Loading Success");
		} catch (ClassNotFoundException e) {
			System.out.print("DB Loading Failed");
			System.out.println(e);
		}
		*/
		ds = DataSourceManager.getInstance().getConnection();
	}
	
	public static AddressDaoImpl getInstance() {
		return dao;
	}	

	public Connection getConnection() throws SQLException {
		System.out.println("connecting...");
		
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
	public boolean addAddress(String address, String custId) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		boolean ret = false;
		
		try {
			conn = getConnection();
			String query = "INSERT INTO address VALUES(?,?)";
			ps = conn.prepareStatement(query);
			System.out.println("PreparedStatement addAddress()");
			
			ps.setString(1, address);
			ps.setString(2, custId);
			
			ps.executeUpdate();
			ret = true;
			
		} finally {
			closeAll(ps, conn);
		}
		
		return ret;
	}

	@Override
	public boolean deleteAddress(String address, String custId) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		boolean ret = false;
		
		try {
			conn = getConnection();
			String query = "DELETE FROM address WHERE ORDER_ADDR=? AND CUST_ID=?";
			ps = conn.prepareStatement(query);
			System.out.println("PreparedStatement addAddress()");
			
			ps.setString(1, address);
			ps.setString(2, custId);
			
			ps.executeUpdate();
			ret = true;
			
		} finally {
			closeAll(ps, conn);
		}
		
		return ret;
		}

	@Override
	public ArrayList<String> showAllAddress(String custId) throws SQLException {
		
		ArrayList<String> ret = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ret = new ArrayList<String>();
			conn = getConnection();
			String query = "SELECT * FROM address WHERE CUST_ID=?";
			ps = conn.prepareStatement(query);
			
			ps.setString(1, custId);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				ret.add(rs.getString(1));
			}
			
		} finally {
			closeAll(rs, ps, conn);
		}
		
		return ret;
	}
	
	/*
	public static void main(String[] args) throws SQLException {
		AddressDaoImpl test = new AddressDaoImpl();
		
		//System.out.println(test.addAddress("서울시 마포구", "encore"));

		//System.out.println(test.deleteAddress("서울시 마포구", "encore"));
		
		
		//System.out.println(test.addAddress("서울시 마포구 독막로3길", "encore"));
		//System.out.println(test.addAddress("서울시 마포구 서강대학교", "encore"));
		//for(String str : test.showAllAddress("encore"))
		//	System.out.println(str);
			
	}
	*/
}
