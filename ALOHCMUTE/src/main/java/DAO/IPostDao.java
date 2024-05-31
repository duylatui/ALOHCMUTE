package DAO;

import java.util.List;

import entity.Comment;
import entity.Post;
import entity.User;

public interface IPostDao {
	void insert(Post post);
	void update(Post post);
	void delete(int postid) throws Exception;
	List<Post> findAll();
	Post findByID(int postID);
	List<Comment> getCommentsForPost(int postID);
	List<Post> findbyuserid(int userid);
	int count();
	List<Post> findPostsByUserCommented(int userid);
}
