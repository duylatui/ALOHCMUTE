package controllers;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Post;
import entity.User;
import service.IPostService;
import service.IUserService;
import service.PostSeviceImpl;
import service.UserServiceImple;
@WebServlet(urlPatterns = {"/user-page"})
public class author_profileController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	IPostService postService = new PostSeviceImpl();
	IUserService userService = new UserServiceImple();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		if(url.contains("user-page"))
		{
			
			findAllPost(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("/view/sociala/user-page.jsp");
			rd.forward(req, resp);
		}
	}
	private void findAllPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Post> listPost = postService.findbyuserid(Integer.parseInt(req.getParameter("userid")));
		listPost = listPost.stream().filter(post -> post.getPostTime() != null)
				.sorted(Comparator.comparing(Post::getPostTime).reversed()).collect(Collectors.toList());
		
		User user =  userService.findById(Integer.parseInt(req.getParameter("userid")));
		
		req.setAttribute("user", user);

		req.setAttribute("listpost", listPost);

	}
}
