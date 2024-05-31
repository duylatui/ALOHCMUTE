package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import entity.Comment;
import entity.FriendRequest;
import entity.Friendship;
import entity.Post;
import entity.User;
import service.*;
import util.uploadCloud;
import java.sql.Timestamp;

@MultipartConfig
@WebServlet(urlPatterns = { "/home", "/updatePost", "/insertPost", "/deletePost", "/listComment", "/addComment",
		"/deleteComment","/findPostsByUserComment" })
public class PostController extends HttpServlet {

	/**
	 * 
	 */
	IPostService postService = new PostSeviceImpl();
	IUserService userService = new UserServiceImple();
	IFriendshipService friendshipservice = new FriendshipServicImple();
	ICommentService commentService = new CommentService();
	IFriendRequestService friendrequestservice = new FriendRequestServiceImple();
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = req.getRequestURL().toString();
		if (url.contains("home")) {
			// gui danh sach FriendRequest den file jsp,file jsp de duyet qua danh sach de
			// check xem user nao dang gui yeu cau ket ban
			listaddfriend(req, resp);
			// danh sach Confirm Friend hien thi dnah sach nhung nguoi k phai la ban be
			findAllConfirmFriend(req, resp);
			// hien thi danh sach Friend Request
			findAllFriendRequest(req, resp);
			// hien thi dnah sach ban be
			findAllFriend(req, resp);
			// hien thi dnah sach post
			findAllPost(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("/view/sociala/home.jsp");
			rd.forward(req, resp);
		} else if (url.contains("updatePost")) {
			updatePost(req, resp);
		} else if (url.contains("deletePost")) {
			deletePost(req, resp);
		} else if (url.contains("listComment")) {
			try {
				int postID = Integer.parseInt(req.getParameter("postid"));
				System.out.println(postID);
				// Assuming you have a PostService that retrieves comments for a post
				List<Comment> comments = commentService.findByID(postID);
				// req.getSession().setAttribute("comments", comments);
				Collections.sort(comments, Comparator.comparing(Comment::getCommentTime).reversed());
				req.getSession().setAttribute("sortedComments", comments);
				resp.sendRedirect("/ALOHCMUTE/home");

			} catch (Exception e) {
				e.printStackTrace();
				resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching comments");
			}
		} else if (url.contains("deleteComment"))

		{

			try {
				delComment(req, resp);
				int postID = Integer.parseInt(req.getParameter("postid"));
				List<Comment> comments = commentService.findByID(postID);
				// req.getSession().setAttribute("comments", comments);
				Collections.sort(comments, Comparator.comparing(Comment::getCommentTime).reversed());
				req.getSession().setAttribute("sortedComments", comments);
				resp.sendRedirect("/ALOHCMUTE/home");

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		else if (url.contains("findPostsByUserComment"))
		{
			RequestDispatcher rd = req.getRequestDispatcher("/view/sociala/findPostByUserCommented.jsp"); rd.forward(req, resp);
			
		}

	}

	private void listaddfriend(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		List<FriendRequest> listfriendrequest = friendrequestservice.findAll();
		req.setAttribute("listadd", listfriendrequest);

	}

	private void findAllConfirmFriend(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		// Lấy danh sách tất cả người dùng từ dịch vụ userService
		List<User> listuser = userService.findAll();

		// Tạo danh sách mới để lưu trữ người dùng cần xác nhận
		List<User> listConfirm = new ArrayList<User>();

		// ------ Danh sách bạn bè ---------
		HttpSession session = req.getSession();

		// Lấy giá trị ID người dùng từ session
		Integer userIDInt = (Integer) session.getAttribute("userID");

		// Tạo danh sách mới để lưu trữ bạn bè của người dùng
		List<User> listfriend = new ArrayList<User>();

		// Lấy tất cả các mối quan hệ bạn bè từ dịch vụ friendshipservice
		List<Friendship> list = friendshipservice.findAll();

		// Duyệt qua danh sách Friendship để lấy ra danh sách bạn bè của người dùng hiện
		// tại và thêm vào listfriend
		for (Friendship friend : list) {
			if (friend.getUser1().getUserID() == userIDInt) {
				listfriend.add(friend.getUser2());
			}
		}
		// ----------------------------------

		// Duyệt qua danh sách tất cả người dùng
		for (User u : listuser) {
			// Biến kiểm tra xác định xem người dùng có cần xác nhận hay không
			boolean check = true;

			// Duyệt qua danh sách bạn bè để kiểm tra xem người dùng đã là bạn bè hay chưa
			for (User u1 : listfriend) {
				// Nếu người dùng có cùng email với người bạn hoặc là "john@example.com"
				if (u.getEmail().equals(u1.getEmail())||u.getEmail().equals(req.getSession().getAttribute("userEmail"))) {
					// Đặt biến kiểm tra thành false để không thêm vào danh sách xác nhận
					check = false;
				}
			}

			// Nếu biến kiểm tra không bị đặt thành false, thêm người dùng vào danh sách xác
			// nhận
			if (check != false) {
				listConfirm.add(u);

			}
		}

		// Đặt danh sách xác nhận vào thuộc tính của request để sử dụng trong JSP hoặc
		// Servlet khác
		req.setAttribute("listConfirm", listConfirm);
	}

	private void findAllFriendRequest(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		// Lấy tất cả yêu cầu kết bạn từ dịch vụ friendrequestservice
		List<FriendRequest> listfriendrequest = friendrequestservice.findAll();

		// Tạo danh sách mới để lưu trữ các yêu cầu kết bạn chưa được chấp nhận cho
		// người dùng hiện tại
		List<FriendRequest> listofuser = new ArrayList<FriendRequest>();

		// Duyệt qua danh sách yêu cầu kết bạn
		for (FriendRequest f : listfriendrequest) {
			// Kiểm tra nếu người nhận là người dùng hiện tại và yêu cầu chưa được chấp nhận
			// (isAccepted = 0)
			if (f.getUser2().getUserID() == (Integer) req.getSession().getAttribute("userID")
					&& f.getIsAccepted() == 0) {
				// Thêm yêu cầu vào danh sách
				listofuser.add(f);
			}
		}

		// Đặt danh sách yêu cầu vào thuộc tính của request để sử dụng trong JSP hoặc
		// Servlet khác
		req.setAttribute("listfriendrequest", listofuser);

	}

	private void findAllFriend(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
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
		for (User user : listfriend) {
			int id = user.getUserID();
			req.setAttribute("id", id);
			break;
		}
	}

	private void deletePost(HttpServletRequest req, HttpServletResponse resp) {

	}

	private void updatePost(HttpServletRequest req, HttpServletResponse resp) {

	}

	private void insertPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		int userID = (int) session.getAttribute("userID");
		Post post = new Post();
		String content = req.getParameter("content");
		post.setContent(content);
		User user = userService.findById(userID);
		post.setUser(user);
		Part filePart = req.getPart("imageVideoURL");
		String fileName = filePart.getSubmittedFileName();
		// tao bien url chua link anh
		String urlvArtar = uploadCloud.upload(fileName);

		post.setImageVideoURL(urlvArtar);
		Timestamp postTime = new Timestamp(System.currentTimeMillis());
		post.setPostTime(postTime);
		postService.insert(post);

	}

	private void findAllPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Post> listPost = postService.findAll();
		listPost = listPost.stream().filter(post -> post.getPostTime() != null)
				.sorted(Comparator.comparing(Post::getPostTime).reversed()).collect(Collectors.toList());
		req.setAttribute("listpost", listPost);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String url = req.getRequestURL().toString();
		if (url.contains("insertPost")) {

			insertPost(req, resp);
			resp.sendRedirect("/ALOHCMUTE/home");
		} else if (url.contains("updatePost")) {
			// -------------------------------------lay anh tu form--------------
			Part filePart = req.getPart("imageVideoURL");
			String fileName = filePart.getSubmittedFileName();
			// tao bien url chua link anh
			String urlImgPost = uploadCloud.upload(fileName);
			// --------------------------------------------------------

			HttpSession session = req.getSession();
			int userID = (int) session.getAttribute("userID");
			int postID = Integer.parseInt(req.getParameter("postID"));
			System.out.println(postID);
			User user = userService.findById(userID);
			Post post = postService.findById(postID);
			post.setImageVideoURL(urlImgPost);

			post.setContent(req.getParameter("content"));
			post.setImageVideoURL(urlImgPost);
			postService.update(post);
//						PrintWriter out = resp.getWriter();
//						out.println("<p>" + "update thanh cong " + user.getUserName() + "</p>");
			resp.sendRedirect("/ALOHCMUTE/home");
		} else if (url.contains("listComment")) {
			try {
				int postID = Integer.parseInt(req.getParameter("postID"));
				System.out.println(postID);
				// Assuming you have a PostService that retrieves comments for a post
				List<Comment> comments = commentService.findByID(postID);
				// req.getSession().setAttribute("comments", comments);
				Collections.sort(comments, Comparator.comparing(Comment::getCommentTime).reversed());
				req.getSession().setAttribute("sortedComments", comments);
				resp.sendRedirect("/ALOHCMUTE/home");

			} catch (Exception e) {
				e.printStackTrace();
				resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching comments");
			}
		} else if (url.contains("addComment")) {

			addComment(req, resp);
			resp.sendRedirect("/ALOHCMUTE/home");

		}else if(url.contains("findPostsByUserComment"))
		{
			findPostsByUserComment(req,resp);
		}
	}

	private void findPostsByUserComment(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		//Nhan du lieu tu view
		int id = Integer.parseInt(req.getParameter("id"));
		
		//goi phuong thuc findOne trong service
		List<Post> posts = postService.findPostsByUserCommented(id);
		for (Post post : posts) {
			List<Comment> comments = post.getCommentsSet();
			req.setAttribute("comment", comments);
		}
		req.setAttribute("post", posts);
		RequestDispatcher rd = req.getRequestDispatcher("/view/sociala/findPostByUserCommented.jsp");
		rd.forward(req, resp);
		
	}

	private void delComment(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int commentID = Integer.parseInt(req.getParameter("commentID"));
		commentService.delete(commentID);
		resp.getWriter().write("Comment deleted successfully");
		resp.sendRedirect("/ALOHCMUTE/home");

	}

	private void addComment(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		int userID = (int) session.getAttribute("userID");
		Comment cmt = new Comment();
		String content = req.getParameter("content");
		cmt.setContent(content);
		User user = userService.findById(userID);
		cmt.setUser(user);
		int postID = Integer.parseInt(req.getParameter("postID"));
		Post post = postService.findById(postID);
		Timestamp postTime = new Timestamp(System.currentTimeMillis());
		cmt.setCommentTime(postTime);
		cmt.setPost(post);
		commentService.insert(cmt);
		resp.getWriter().write("Comment added successfully");

		List<Comment> comments = commentService.findByID(postID);
		// req.getSession().setAttribute("comments", comments);
		Collections.sort(comments, Comparator.comparing(Comment::getCommentTime).reversed());
		req.getSession().setAttribute("sortedComments", comments);

	}
}