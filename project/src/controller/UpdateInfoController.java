package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;
import model.CustomerDaoImpl;

public class UpdateInfoController implements Controller{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Customer cs = (Customer) session.getAttribute("rvo");

		String id = cs.getCustId();
		String pw = cs.getCustPw();
		String name = cs.getCustName();
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		String email = cs.getCustEmail();

		// 2.
		Customer pvo = new Customer(id, pw, name, address, contact, email);

		String path = "updateInfo.jsp"; // 기본 path
		try {
			CustomerDaoImpl.getInstance().updateInfo(pvo);
			session = request.getSession();

			if (session.getAttribute("vo") != null) {
				session.setAttribute("vo", pvo);
				System.out.println(pvo);
				path = "Mypage.jsp"; // 이동할 path
			}
		} catch (Exception e) {

		}
		return new ModelAndView(path);
	}

}
