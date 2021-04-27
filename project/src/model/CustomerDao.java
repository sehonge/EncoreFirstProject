package model;

import java.sql.SQLException;

public interface CustomerDao {
	
	boolean matchIdPassword(String id, String password) throws SQLException;
	boolean SignUp(String id, String password, String name, String address, String phoneNumber, String email) throws SQLException;
	String findId(String custEmail) throws SQLException; // email(or 핸드폰번호, 이름)으로 아이디 찾기
	String findPw(String custId) throws SQLException; // id(or 이름, email, 핸드폰번호)로 패스워드 찾기
	Customer showCustomer(String custId) throws SQLException; // id에 해당하는 customer 반환
	boolean updateInfo(String custId, String custAddr, String custContact) throws SQLException; // 인자값으로 받은 customer 값으로 변환
	
	
}
