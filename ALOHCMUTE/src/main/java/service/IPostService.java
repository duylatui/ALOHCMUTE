package service;

import java.util.List;

import entity.Comment;
import entity.Post;


public interface IPostService {
	void insert(Post post);

	void update(Post post);

	void delete(int postID) throws Exception;

	List<Post> findAll();

	Post findById(int postID);

	List<Comment> getCommentsForPost(int postID);
	List<Post> findbyuserid(int userid);
	int count();

	List<Post> findPostsByUserCommented(int i);
}
