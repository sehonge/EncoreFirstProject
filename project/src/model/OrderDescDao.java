package model;

import java.sql.SQLException;

public interface OrderDescDao {
	
	boolean writeOrderDesc(String orderId, String menuId, int num) throws SQLException;
}
