package model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface AddressDao {
	
	boolean addAddress(String address, String custId) throws SQLException;
	boolean deleteAddress(String address, String custId) throws SQLException;
	ArrayList<String> showAllAddress(String custId) throws SQLException;

}
