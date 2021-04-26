package model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ShopDao {
	
	ArrayList<Shop> getAllShop(String address) throws SQLException;

}
