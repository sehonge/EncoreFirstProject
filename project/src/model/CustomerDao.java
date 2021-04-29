package model;

import java.sql.SQLException;

public interface CustomerDao {
	
	Customer signIn(String id, String password) throws SQLException;
	boolean SignUp(String id, String password, String name, String address, String phoneNumber, String email) throws SQLException;
	String findId(String custEmail) throws SQLException; // email(or ?��?��?��번호, ?���?)?���? ?��?��?�� 찾기
	String findPw(String custId) throws SQLException; // id(or ?���?, email, ?��?��?��번호)�? ?��?��?��?�� 찾기
	Customer showCustomer(String custId) throws SQLException; // id?�� ?��?��?��?�� customer 반환
	boolean updateInfo(Customer cust) throws SQLException; // ?��?��값으�? 받�? customer 값으�? �??��
	boolean isExist(String id) throws SQLException;
	boolean idCheck(String id) throws SQLException; 
	boolean emailCheck(String email) throws SQLException;
	
}
