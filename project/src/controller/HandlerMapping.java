package controller;

public class HandlerMapping {
	private static HandlerMapping factory = new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return factory;
	}
	
	// 수정필요
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
		}else if(command.equals("pizzaMenu.do")) {
			controller = new PizzaMenuController();
		}
		
		
		return controller;
	}
	
}
