package model;

import java.sql.SQLException;

import javax.sql.DataSource;

public class CustomerDaoImpl implements CustomerDao{
	
	private DataSource ds;
	
	private static CustomerDaoImpl dao = new CustomerDaoImpl();
	
	private CustomerDaoImpl() {
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean matchIdPassword(String id, String password) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean SignUp(String id, String password, String name, String address, String phoneNumber, String email)
			throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String findId(String custEmail) throws SQLException {
		// TODO Auto-generated method stub
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

}
