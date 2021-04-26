package model;

public class Shop {
	// Field
	private String shopId;
	private String shopName;
	private String shopAddr;
	private String shopContact;

	// Constructor
	public Shop() {
	}
	
	public Shop(String shopId, String shopName, String shopAddr, String shopContact) {
		super();
		this.shopId = shopId;
		this.shopName = shopName;
		this.shopAddr = shopAddr;
		this.shopContact = shopContact;
	}

	// Getter & Setter
	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopAddr() {
		return shopAddr;
	}

	public void setShopAddr(String shopAddr) {
		this.shopAddr = shopAddr;
	}

	public String getShopContact() {
		return shopContact;
	}

	public void setShopContact(String shopContact) {
		this.shopContact = shopContact;
	}

	// toString
	@Override
	public String toString() {
		return "Shop [shopId=" + shopId + ", shopName=" + shopName + ", shopAddr=" + shopAddr + ", shopContact="
				+ shopContact + "]";
	}
}
