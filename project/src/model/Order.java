package model;

public class Order {
	// Field
	private int orderId;
	private String custId;
	private int shopId;
	private String orderDate;
	private String orderAddr;
	private int orderPrice;
	
	//Constructor
	public Order() {
	}
	
	public Order(int orderId, String custId, int shopId, String orderDate, String orderAddr, int orderPrice) {
		super();
		this.orderId = orderId;
		this.custId = custId;
		this.shopId = shopId;
		this.orderDate = orderDate;
		this.orderAddr = orderAddr;
		this.orderPrice = orderPrice;
	}

	//Getter & Setter
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderAddr() {
		return orderAddr;
	}

	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	// toString
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", custId=" + custId + ", shopId=" + shopId + ", orderDate=" + orderDate
				+ ", orderAddr=" + orderAddr + ", orderPrice=" + orderPrice + "]";
	}
	
	
}
