package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Friendship;
import entity.User;
import service.FriendshipServicImple;
import service.IFriendshipService;
import service.IUserService;
import service.UserServiceImple;

@WebServlet(urlPatterns = { "/listfriend","/deletefriend","/searchfriend"})
public class FriendshipController extends HttpServlet{

	/**
	 * 
	 */
	IUserService userservice = new UserServiceImple();
	IFriendshipService friendshipservice = new FriendshipServicImple();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = req.getRequestURL().toString();
		if(url.contains("listfriend"))
		{
			HttpSession session = req.getSession();

			// Lấy giá trị từ session
			Integer userIDInt = (Integer) session.getAttribute("userID");
			
			List<User> listfriend = new ArrayList<User>();
			
			List<Friendship> list = friendshipservice.findAll();
			for (Friendship friend : list) {
				if (friend.getUser1().getUserID() == userIDInt) {
					listfriend.add(friend.getUser2());
				}
			}

			req.setAttribute("listfriend", listfriend);
			req.getRequestDispatcher("/view/sociala/default-member.jsp").forward(req, resp);
		}
		if(url.contains("deletefriend"))
		{
			User user1 = userservice.findById(Integer.parseInt(req.getParameter("userid")));
			User user2 = userservice.findById((Integer) req.getSession().getAttribute("userID"));


			List<Friendship> list = friendshipservice.findByUsername(user1.getUserID(), user2.getUserID());

			if (list != null) {
			    for (Friendship f : list) {
			        try {
			            friendshipservice.delete(f.getFriendshipID());
			        } catch (Exception e) {
			            e.printStackTrace();
			        }
			    }
			} else {
			    System.out.println("Friendship list is null.");
			}

			resp.sendRedirect("listfriend");

			
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String url = req.getRequestURL().toString();

	        if (url.contains("searchfriend")) {
	            String searchName = req.getParameter("searchName");
	            
	            if (searchName != null && !searchName.isEmpty()) {
	                // Gọi phương thức tìm kiếm theo tên từ UserService
	                List<User> searchResult = userservice.findByUsername(searchName);
	                
	                req.setAttribute("listfriend", searchResult);
	                req.getRequestDispatcher("/view/sociala/default-member.jsp").forward(req, resp);
	            } else {
	                // Nếu không có tên để tìm kiếm, chuyển hướng người dùng đến trang listfriend
	                resp.sendRedirect("listfriend");
	            }
	        } else {
	            // Xử lý các trường hợp khác
	            super.doPost(req, resp);
	        }
	    }
	}
	

