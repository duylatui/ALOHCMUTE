package service;

import entity.Comment;
import entity.Post;

import java.util.List;

import DAO.IPostDao;
import DAO.PostDaoImple;
public class PostSeviceImpl implements IPostService{
	IPostDao postDao = new PostDaoImple();

	@Override
	public void insert(Post post) {
		// TODO Auto-generated method stub
		postDao.insert(post);
		
	}

	@Override
	public void update(Post post) {
		// TODO Auto-generated method stub
		postDao.update(post);
		
	}

	@Override
	public void delete(int postID) throws Exception {
		// TODO Auto-generated method stub
		postDao.delete(postID);
		
	}

	@Override
	public List<Post> findAll(){
		return postDao.findAll();
	}

	@Override
	public Post findById(int postID) {
	
		return postDao.findByID(postID);
	}

	@Override
	public List<Comment> getCommentsForPost(int postID) {
		
		return postDao.getCommentsForPost(postID);
	}

	@Override
	public List<Post> findbyuserid(int userid) {
		// TODO Auto-generated method stub
		return postDao.findbyuserid(userid);
	}
	@Override
	public int count() {
		return postDao.count();
	}

	@Override
	public List<Post> findPostsByUserCommented(int i) {
		return postDao.findPostsByUserCommented(i);
	}


}
