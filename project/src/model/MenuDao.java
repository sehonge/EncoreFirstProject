package model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface MenuDao {
	
	ArrayList<Menu> getAllPizza() throws SQLException;
	ArrayList<Menu> getAllSide() throws SQLException;
	ArrayList<Menu> getAllTopping() throws SQLException;
	Menu getMenu(String menuId) throws SQLException;

}
