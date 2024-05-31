package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.FriendRequest;
import entity.Friendship;
import entity.User;
import service.FriendRequestServiceImple;
import service.FriendshipServicImple;
import service.IFriendRequestService;
import service.IFriendshipService;
import service.IUserService;
import service.UserServiceImple;

@WebServlet(urlPatterns = {"/home/confirm","/home/addrequest","/home/delete"})
public class FriendRequestController extends HttpServlet{

	/**
	 * 
	 */
	IFriendshipService frishipser = new FriendshipServicImple();
	IFriendRequestService friendrequestservice = new FriendRequestServiceImple();	
	IUserService userservice = new UserServiceImple();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		if(url.contains("confirm"))
		{
			
			User user1 = userservice.findById(Integer.parseInt(req.getParameter("userid")));
			User user2 = userservice.findById((Integer)req.getSession().getAttribute("userID"));
			Friendship f1 = new Friendship();
			f1.setUser1(user1);
			f1.setUser2(user2);

			Friendship f2 = new Friendship();
			f2.setUser1(user2);
			f2.setUser2(user1);


			// Tiếp theo, thực hiện insert
			frishipser.insert(f1);
			frishipser.insert(f2);
			
			FriendRequest fr = new FriendRequest();
			fr.setIsAccepted(1);
			fr.setRequestID(Integer.parseInt(req.getParameter("requestid")));
			fr.setUser1(user1);
			fr.setUser2(user2);
			friendrequestservice.update(fr);
			resp.sendRedirect("/ALOHCMUTE/home");
		}
		if(url.contains("addrequest"))
		{
			FriendRequest fr = new FriendRequest();
			fr.setIsAccepted(0);
			User user1 = userservice.findById((Integer)req.getSession().getAttribute("userID"));
			fr.setUser1(user1);
			User user2 = userservice.findById(Integer.parseInt(req.getParameter("userid")));
			fr.setUser2(user2);
			friendrequestservice.insert(fr);
			resp.sendRedirect("/ALOHCMUTE/home");
		}
		if(url.contains("delete"))
		{
			
			try {
				friendrequestservice.delete(Integer.parseInt(req.getParameter("requestid")));
				resp.sendRedirect("/ALOHCMUTE/home");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
