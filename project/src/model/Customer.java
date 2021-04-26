package model;

public class Customer {
	// Field
	private String custId;
	private String custPw;
	private String custName;
	private String custAddr;
	private String custContact;
	private String custEmail;
	private int custTotalPrice;

	// Constructor
	public Customer() {
	}

	public Customer(String custId, String custPw, String custName, String custAddr, String custContact,
			String custEmail) { 
		super();
		this.custId = custId;
		this.custPw = custPw;
		this.custName = custName;
		this.custAddr = custAddr;
		this.custContact = custContact;
		this.custEmail = custEmail;
		this.custTotalPrice = custTotalPrice;
	}
	
	public Customer(String custId, String custPw, String custName, String custAddr, String custContact,
			String custEmail, int custTotalPrice) {
		super();
		this.custId = custId;
		this.custPw = custPw;
		this.custName = custName;
		this.custAddr = custAddr;
		this.custContact = custContact;
		this.custEmail = custEmail;
		this.custTotalPrice = custTotalPrice;
	}

	//Getter & Setter
	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCustPw() {
		return custPw;
	}

	public void setCustPw(String custPw) {
		this.custPw = custPw;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustAddr() {
		return custAddr;
	}

	public void setCustAddr(String custAddr) {
		this.custAddr = custAddr;
	}

	public String getCustContact() {
		return custContact;
	}

	public void setCustContact(String custContact) {
		this.custContact = custContact;
	}

	public String getCustEmail() {
		return custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}

	public int getCustTotalPrice() {
		return custTotalPrice;
	}

	public void setCustTotalPrice(int custTotalPrice) {
		this.custTotalPrice = custTotalPrice;
	}

	
	//toString
	@Override
	public String toString() {
		return "Customer [custId=" + custId + ", custPw=" + custPw + ", custName=" + custName + ", custAddr=" + custAddr
				+ ", custContact=" + custContact + ", custEmail=" + custEmail + ", custTotalPrice=" + custTotalPrice
				+ "]";
	}
}
