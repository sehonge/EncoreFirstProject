package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;
import model.CustomerDaoImpl;

public class UpdateInfoController implements Controller{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
<<<<<<< HEAD
		// String id = request.getParameter("id");
		HttpSession session1  = request.getSession();
		// System.out.println(session1.getAttribute("rvo"));
		Customer cs = (Customer) session1.getAttribute("rvo");
		
		String id = cs.getCustId();
		System.out.println("ID는 "+id);
		
=======
		HttpSession session = request.getSession();
		Customer cs = (Customer) session.getAttribute("rvo");

		String id = cs.getCustId();
>>>>>>> upstream/main
		String pw = cs.getCustPw();
		String name = cs.getCustName();
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
<<<<<<< HEAD
		String email =  cs.getCustEmail();
		
		//2.
		Customer pvo = new Customer(id, pw, name, address, contact, email);
		System.out.println("customer 객체 " + pvo);
		String path="updateInfo.jsp"; // 기본 path
		try{			
			// System.out.println("ID는"+id);
			// System.out.println(address);
			CustomerDaoImpl.getInstance().updateInfo(pvo);
			HttpSession session  = request.getSession();
			
			if(session.getAttribute("rvo")!=null) {
				session.setAttribute("rvo", pvo);
=======
		String email = cs.getCustEmail();

		// 2.
		Customer pvo = new Customer(id, pw, name, address, contact, email);

		String path = "updateInfo.jsp"; // 기본 path
		try {
			CustomerDaoImpl.getInstance().updateInfo(pvo);
			session = request.getSession();

			if (session.getAttribute("vo") != null) {
				session.setAttribute("vo", pvo);
>>>>>>> upstream/main
				System.out.println(pvo);
				path = "Mypage.jsp"; // 이동할 path
			}
		} catch (Exception e) {

		}
		return new ModelAndView(path , true);
	}

}
