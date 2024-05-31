package service;

import java.util.List;

import entity.Comment;
import entity.Post;


public interface ICommentService {
	void insert(Comment comment);

	void update(Comment comment);

	void delete(int commentID) throws Exception;

	List<Comment> findAll();

	List<Comment> findByID(int postID);

	List<Comment> getCommentsForPost(int postID);

}
