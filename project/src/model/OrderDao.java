package model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface OrderDao {
	
	boolean makeOrder(ArrayList<Menu> list, String customerId, String address, int shopId) throws SQLException; // 바인딩 된 메뉴정보들을 TB_ORDER에 저장
	boolean spendMoney(String custId, int money) throws SQLException; // 결제 금액을 custTotalPrice에 넣음
	// 장바구니에서 선택제품삭제 누를때 작동되는 method 필요
	boolean order_desc(String menuId, int num, int orderId) throws SQLException;
	
}
