package service;

import entity.Comment;
import entity.Post;

import java.util.List;

import DAO.CommentDAOImpl;
import DAO.*;
import DAO.PostDaoImple;
public class CommentService implements ICommentService{
	IComment commentDao = new CommentDAOImpl();





	@Override
	public void delete(int commentID) throws Exception {
		// TODO Auto-generated method stub
		commentDao.delete(commentID);
		
	}

	@Override
	public List<Comment> findAll(){
		return commentDao.findAll();
	}

	@Override
	public List<Comment> findByID(int postID) {
	
		return commentDao.findByID(postID);
	}

	@Override
	public List<Comment> getCommentsForPost(int postID) {
		
		return commentDao.getCommentsForPost(postID);
	}

	@Override
	public void insert(Comment comment) {
		commentDao.insert(comment);
		
	}

	@Override
	public void update(Comment comment) {
		// TODO Auto-generated method stub
		commentDao.update(comment);
		
	}


}
