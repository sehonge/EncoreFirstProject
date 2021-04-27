package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import util.DataSourceManager;

public class CustomerDaoImpl implements CustomerDao{
	
	private DataSource ds;
	
	private static CustomerDaoImpl dao = new CustomerDaoImpl();
	
	private CustomerDaoImpl() {
		ds = DataSourceManager.getInstance().getConnection();
	}
	
	public static CustomerDaoImpl getInstance() {
		return dao;
	}	

	@Override
	public boolean matchIdPassword(String id, String password) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	public Connection getConnection() throws SQLException {
		System.out.println("디비연결...");
		
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
	public boolean SignUp(String id, String password, String name, String address, String phoneNumber, String email)
			throws SQLException {
		
		
		return false;
	}

	@Override
	public String findId(String custEmail) throws SQLException {
		
		return null;
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
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
