package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import service.IUserService;
import service.UserServiceImple;

@WebServlet(urlPatterns = { "/admin-listUser", "/admin-deleteUser" })

public class Admin_UserController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	IUserService userSer = new UserServiceImple();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if(url.contains("admin-listUser")){
			findAll(req, resp);
		}
		else if(url.contains("admin-deleteUser")) {
				delete(req,resp);
	}

}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			userSer.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("message", "Xóa user thành công");
		RequestDispatcher rd = req.getRequestDispatcher("admin-listUser");
		rd.forward(req, resp);
		
	}

	private void findAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<User> listuser = userSer.findAll();
		req.setAttribute("listuser", listuser);
		RequestDispatcher rd = req.getRequestDispatcher("/view/sociala/listuser.jsp");
		rd.forward(req, resp);
		
	}
}
