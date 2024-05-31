package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;

import entity.User;

public class UserDaoImple implements IUserDao{

	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		EntityManager enma = JPAConfig.getEntityManager();

		EntityTransaction trans = enma.getTransaction(); // chức năng insert có

		try {

			trans.begin();

			enma.persist(user);// persist chính là insert đối tượng category vô

			trans.commit();// xác nhận thành công

		} catch (Exception e) {

			e.printStackTrace();

			trans.rollback();

			throw e;

		} finally {

			enma.close();

		}
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		EntityManager enma = JPAConfig.getEntityManager();

		EntityTransaction trans = enma.getTransaction();

		try {

			trans.begin();

			enma.merge(user); // merger là update

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
	public void delete(int userid) throws Exception {
		// TODO Auto-generated method stub
		EntityManager enma = JPAConfig.getEntityManager();

		EntityTransaction trans = enma.getTransaction();

		try {

			trans.begin();

			User user = enma.find(User.class, userid);

			if (user != null) {

				enma.remove(user);

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

	@Override
	public User findById(int userid) {
		EntityManager enma = JPAConfig.getEntityManager();

		User user = enma.find(User.class, userid);

		return user;
	}

	@Override
	public List<User> findAll() {

		EntityManager enma = JPAConfig.getEntityManager();

		TypedQuery<User> query = enma.createNamedQuery("User.findAll", User.class);

		return query.getResultList();

	}

	@Override
	public List<User> findByUsername(String username) {
	    EntityManager entityManager = JPAConfig.getEntityManager();

	    // Replace "username" with "userName" in the query
	    String jpql = "SELECT u FROM User u WHERE u.userName LIKE :userName";

	    TypedQuery<User> query = entityManager.createQuery(jpql, User.class);

	    // Replace "username" with "userName" in the parameter
	    query.setParameter("userName", "%" + username + "%");

	    return query.getResultList();
	}



	@Override
	public List<User> findAll(int page, int pagesize) {
		EntityManager enma = JPAConfig.getEntityManager();

		TypedQuery<User> query = enma.createNamedQuery("Category.findAll", User.class);

		query.setFirstResult(page * pagesize);

		query.setMaxResults(pagesize);

		return query.getResultList();
	}

	@Override
	public int count() {
		EntityManager enma = JPAConfig.getEntityManager();

		String jpql = "SELECT count(c) FROM User c";

		Query query = enma.createQuery(jpql);

		return ((Long) query.getSingleResult()).intValue();

	}


}
