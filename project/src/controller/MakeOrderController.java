package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;
import model.Menu;
import model.MenuDaoImpl;
import model.Order;
import model.OrderDaoImpl;

public class MakeOrderController implements Controller{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
				String path = "Order/payment.jsp";

				try {
					// 로그인 되어있는 Customer 객체 생성
					request.setCharacterEncoding("UTF-8");
					HttpSession session = request.getSession();
					Customer cust = (Customer) session.getAttribute("rvo");

					// 데이터를 받아옴
					String custId = cust.getCustId();
					String menus = request.getParameter("menuId");
					int	shopId = Integer.valueOf(request.getParameter("shopId"));
					String address = request.getParameter("address");
					
					// ArrayList<Menu> 작성
					ArrayList<Menu> menuList = new ArrayList<Menu>();
					String[] temp = menus.split(",");
					for (int i = 0; i < temp.length; i++) {
						menuList.add(MenuDaoImpl.getInstance().getMenu(temp[i]));
					}

					// MakeOrder 작성			
					int orderId = OrderDaoImpl.getInstance().makeOrder(menuList, custId, address, shopId);
					int totalPrice = OrderDaoImpl.getInstance().getTotalPrice(orderId);
					
					// setAttribute
					Order order = OrderDaoImpl.getInstance().showOrder(orderId);
					request.setAttribute("order", order);
					request.setAttribute("totalPrice", totalPrice);

					path = "Order/paymentResult.jsp";
				} catch (Exception e) {

				}
				return new ModelAndView(path);

			}

		}
