package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import config.ServerInfo;

public class MenuDaoImpl implements MenuDao {

private DataSource ds;
	
	private static MenuDaoImpl dao = new MenuDaoImpl();
	
	private MenuDaoImpl() {
		try {
			Class.forName(ServerInfo.DRIVER_NAME);
			System.out.println("드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			System.out.print("드라이버 로딩 실패 ");
			System.out.println(e);
		}
		//ds = DataSourceManager.getInstance().getConnection();
	}
	
	public static MenuDaoImpl getInstance() {
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
	public ArrayList<Menu> getAllPizza() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Menu> getAllSide() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Menu> getAllTopping() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Menu getPizza(String menuId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
}
