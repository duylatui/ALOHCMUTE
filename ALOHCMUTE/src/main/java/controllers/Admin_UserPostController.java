package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Post;
import service.IPostService;
import service.IUserService;
import service.PostSeviceImpl;
import service.UserServiceImple;

@WebServlet(urlPatterns = { "/admin-listPost","/admin-deletePost" })
public class Admin_UserPostController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	IPostService postSer = new PostSeviceImpl();
	IUserService userSer = new UserServiceImple();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if (url.contains("admin-listPost")) {
			findAll(req, resp);
		}
		else if(url.contains("admin-deletePost")) {
			delete(req,resp); 
	}
}
	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			postSer.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("message", "Xóa bài post thành công");
		RequestDispatcher rd = req.getRequestDispatcher("admin-listPost");
		rd.forward(req, resp);
		
	}
	private void findAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Post> listpost = postSer.findAll();
		req.setAttribute("listpost", listpost);
		RequestDispatcher rd = req.getRequestDispatcher("/view/sociala/listpost.jsp");
		rd.forward(req, resp);
		
	}
	
}
