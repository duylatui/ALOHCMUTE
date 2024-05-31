package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import entity.Comment;
import entity.Post;
import entity.User;

public class CommentDAOImpl implements IComment {

	@Override
	public void delete(int commentID) throws Exception {
		EntityManager enma = JPAConfig.getEntityManager();

		EntityTransaction trans = enma.getTransaction();

		try {

			trans.begin();

			Comment cmt = enma.find(Comment.class, commentID);

			if (cmt != null) {

				enma.remove(cmt);

			} else {

				throw new Exception("Không tìm thấy");

			}

			trans.commit();

		} catch (Exception e) {

			e.printStackTrace();

			trans.rollback();

			throw e;

		} finally {

			enma.close();

		}

	}

	public List<Comment> findAll() {

		EntityManager enma = JPAConfig.getEntityManager();

		TypedQuery<Comment> query = enma.createNamedQuery("Comment.findAll", Comment.class);

		return query.getResultList();

	}

	@Override
	public List<Comment> findByID(int postID) {
		EntityManager enma = JPAConfig.getEntityManager();

		TypedQuery<Comment> query = enma.createNamedQuery("Comment.findByPostID", Comment.class);
		query.setParameter("postID", postID);
		return query.getResultList();
	}

	@Override
	public List<Comment> getCommentsForPost(int postID) {
		EntityManager enma = JPAConfig.getEntityManager();

		TypedQuery<Comment> query = enma.createNamedQuery("Comment.findByPostID", Comment.class);

		return query.getResultList();

	}

	@Override
	public void insert(Comment comment) {
		// TODO Auto-generated method stub
		EntityManager enma = JPAConfig.getEntityManager();

		EntityTransaction trans = enma.getTransaction();

		try {
			trans.begin();

			enma.persist(comment);

			trans.commit();

		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();

			throw e;

		} finally {
			enma.close();
		}
		
	}

	@Override
	public void update(Comment comment) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
			EntityManager enma = JPAConfig.getEntityManager();

			EntityTransaction trans = enma.getTransaction();

			try {

				trans.begin();

				enma.merge(comment); // merger là update

				trans.commit();

			} catch (Exception e) {

				e.printStackTrace();

				trans.rollback();

				throw e;

			} finally {

				enma.close();

			}
		
	}

}
