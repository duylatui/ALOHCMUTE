package DAO;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import entity.Comment;
import entity.Post;
import entity.User;

public class PostDaoImple implements IPostDao {

	@Override
	public void insert(Post post) {
		EntityManager enma = JPAConfig.getEntityManager();

		EntityTransaction trans = enma.getTransaction();

		try {
			trans.begin();

			enma.persist(post);

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
	public void update(Post post) {
		// TODO Auto-generated method stub
		EntityManager enma = JPAConfig.getEntityManager();

		EntityTransaction trans = enma.getTransaction();

		try {

			trans.begin();

			enma.merge(post); // merger là update

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
	public void delete(int postid) throws Exception {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			Post post = enma.find(Post.class, postid);
			if (post !=null) {
				enma.remove(post);
			}
			else {
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

	public List<Post> findAll() {

		EntityManager enma = JPAConfig.getEntityManager();

		TypedQuery<Post> query = enma.createNamedQuery("Post.findAll", Post.class);

		return query.getResultList();

	}

	@Override
	public Post findByID(int postID) {
		EntityManager enma = JPAConfig.getEntityManager();

		TypedQuery<Post> query = enma.createNamedQuery("Post.findById", Post.class);
		query.setParameter("postID", postID);
		return query.getSingleResult();
	}

	@Override
	public List<Comment> getCommentsForPost(int postID) {
		EntityManager enma = JPAConfig.getEntityManager();

		TypedQuery<Comment> query = enma.createNamedQuery("Comment.findByPostID", Comment.class);

		return query.getResultList();

	}

	@Override
	public List<Post> findbyuserid(int userId) {
		EntityManager enma = JPAConfig.getEntityManager();
	    try {
	        // Sử dụng EntityManager để tạo truy vấn
	        TypedQuery<Post> query = enma.createQuery(
	                "SELECT p FROM Post p WHERE p.user.userID = :userId", Post.class);
	        
	        // Thiết lập tham số cho truy vấn
	        query.setParameter("userId", userId);
	        
	        // Thực hiện truy vấn và trả về kết quả
	        return query.getResultList();
	    } finally {
	    	enma.close();
	    }
	}

	@Override
	public int count() {
		EntityManager enma = JPAConfig.getEntityManager();

		String jpql = "SELECT count(c) FROM Post c";

		Query query = enma.createQuery(jpql);

		return ((Long) query.getSingleResult()).intValue();
	}
	
	public int countByMonth(int month) {
		EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT COUNT(p) FROM Post p WHERE MONTH(p.postTime) = :month";

        Query query = enma.createQuery(jpql);
        query.setParameter("month", month);

        return ((Number) query.getSingleResult()).intValue();
    }
	public List<Integer> countPostsPerHourLast6Hours() {
	    EntityManager entityManager = JPAConfig.getEntityManager();

	    // Calculate the timestamp for 24 hours ago
	    Timestamp last6Hours = new Timestamp(System.currentTimeMillis() - (6 * 60 * 60 * 1000));

	    List<Integer> postCountsPerHour = new ArrayList<>();

	    // Iterate through each hour in the last 24 hours
	    for (int hour = 0; hour < 6; hour++) {
	        // Calculate the timestamp for the current hour
	        Timestamp currentHour = new Timestamp(last6Hours.getTime() + (hour * 60 * 60 * 1000));

	        // Count the number of posts for the current hour
	        String jpql = "SELECT COUNT(p) FROM Post p WHERE p.postTime >= :startHour AND p.postTime < :endHour";
	        Query query = entityManager.createQuery(jpql);
	        query.setParameter("startHour", currentHour);
	        query.setParameter("endHour", new Timestamp(currentHour.getTime() + (60 * 60 * 1000)));

	        int postCount = ((Number) query.getSingleResult()).intValue();
	        postCountsPerHour.add(postCount);
	    }

	    return postCountsPerHour;
	}
	public List<Post> findPostsByUserCommented(int userId) {
		EntityManager enma = JPAConfig.getEntityManager();

	    String jpql = "SELECT DISTINCT p FROM Post p JOIN p.commentsSet c WHERE c.user.userID = :userId";

	    TypedQuery<Post> query = enma.createQuery(jpql, Post.class);
	    query.setParameter("userId", userId);

	    return query.getResultList();
	}
	

}
