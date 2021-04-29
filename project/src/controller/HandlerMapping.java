package controller;

public class HandlerMapping {
	private static HandlerMapping factory = new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return factory;
	}
	
	// �닔�젙�븘�슂
	public  Controller  createController(String command) {
		Controller controller = null;
		if(command.equals("findId.do")) {
			controller = new FindIdController();
		}else if(command.equals("findPw.do")) {
			controller = new FindPwController();
		}else if(command.equals("showCustomer.do")) {
			controller = new ShowCustomerController();
		}else if(command.equals("updateInfo.do")) {
			controller = new UpdateInfoController();
		}else if(command.equals("spendMoney.do")) {
			controller = new SpendMoneyController();
		}else if(command.equals("makeOrder.do")) {
			controller = new MakeOrderController();
		}else if(command.equals("login.do")) {
			controller = new LoginController();
		}else if(command.equals("loginCheck.do")) {
			controller = new LoginCheckController();
		}else if(command.equals("pizzaMenu.do")) {
			controller = new PizzaMenuController();
		}else if(command.equals("sideMenu.do")) {
			controller = new SideMenuController();
		}else if(command.equals("pizzaDisc.do")) {
			controller = new PizzaDiscController();
		}else if(command.equals("idCheck.do")) {
			controller = new IdCheckController();
		}else if(command.equals("emailCheck.do")) {
			controller = new EmailCheckController();
		}else if(command.equals("pickUpAddress.do")) {
			controller = new PickUpAddressController();
		}
		
		
		return controller;
	}
	
}
