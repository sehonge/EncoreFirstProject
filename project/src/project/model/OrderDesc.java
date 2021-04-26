package project.model;

public class OrderDesc {
	// Field
	private String orderId;
	private String menuId;
	private int num;
	
	// Constructor
	public OrderDesc() {
	}
	
	public OrderDesc(String orderId, String menuId, int num) {
		super();
		this.orderId = orderId;
		this.menuId = menuId;
		this.num = num;
	}

	// Getter & Setter
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	// toString
	@Override
	public String toString() {
		return "OrderDesc [orderId=" + orderId + ", menuId=" + menuId + ", num=" + num + "]";
	}
}
