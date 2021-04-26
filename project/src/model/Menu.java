package model;

public class Menu {
	// Field
	private String menuId;
	private int menuType; // 1:pizza, 2:sidemenu, 3:topping
	private String menuName;
	private int menuPrice;
	private String menuSize;
	private String menuDesc;
	
	// Constructor
	public Menu() {
	}
	
	public Menu(String menuId, int menuType, String menuName, int menuPrice, String menuDesc) {
		super();
		this.menuId = menuId;
		this.menuType = menuType;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuDesc = menuDesc;
	}
	
	public Menu(String menuId, int menuType, String menuName, int menuPrice, String menuSize, String menuDesc) {
		super();
		this.menuId = menuId;
		this.menuType = menuType;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuSize = menuSize;
		this.menuDesc = menuDesc;
	}

	// Getter&Setter
	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public int getMenuType() {
		return menuType;
	}

	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}

	public String getMenuSize() {
		return menuSize;
	}

	public void setMenuSize(String menuSize) {
		this.menuSize = menuSize;
	}

	public String getMenuDesc() {
		return menuDesc;
	}

	public void setMenuDesc(String menuDesc) {
		this.menuDesc = menuDesc;
	}

	//toString
	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", menuType=" + menuType + ", menuName=" + menuName + ", menuPrice="
				+ menuPrice + ", menuSize=" + menuSize + ", menuDesc=" + menuDesc + "]";
	}	
}
