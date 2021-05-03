package model;

public class Basket {
	
	private String menuId;
	private String menuName;
	private int num;
	private int totalPrice;
	
	public Basket(String menuId, String menuName, int num, int totalPrice) {
		super();
		this.menuId = menuId;
		this.menuName = menuName;
		this.num = num;
		this.totalPrice = totalPrice;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Basket [menuId=" + menuId + ", menuName=" + menuName + ", num=" + num + ", totalPrice=" + totalPrice
				+ "]";
	}
	
}
