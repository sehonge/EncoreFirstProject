package model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ShopDao {
	
	ArrayList<Shop> getAllShop() throws SQLException;
	Shop showShop(int shop_id) throws SQLException;

}
