package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import entity.PrivateMessage;
import entity.User;


public class PrivateMessageDaoImple implements IPrivateMessageDao{

	@Override
	public void insert(PrivateMessage message) {
		// TODO Auto-generated method stub
		EntityManager enma = JPAConfig.getEntityManager();

		EntityTransaction trans = enma.getTransaction(); // chức năng insert có

		try {

			trans.begin();

			enma.persist(message);// persist chính là insert đối tượng category vô

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
	public void update(PrivateMessage message) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int messageid) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PrivateMessage findById(int messageid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PrivateMessage> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();

		TypedQuery<PrivateMessage> query = enma.createNamedQuery("PrivateMessage.findAll", PrivateMessage.class);

		return query.getResultList();
	}

	@Override
	public List<PrivateMessage> findByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PrivateMessage> findAll(int page, int pagesize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PrivateMessage> listMessage(User user1, User user2) {
	    EntityManager entityManager = JPAConfig.getEntityManager();

	    String jpql = "SELECT pm FROM PrivateMessage pm " +
	                  "WHERE (pm.user1 = :user1 AND pm.user2 = :user2) " +
	                  "   OR (pm.user1 = :user2 AND pm.user2 = :user1) " +
	                  "ORDER BY pm.messageID";

	    TypedQuery<PrivateMessage> query = entityManager.createQuery(jpql, PrivateMessage.class);

	    query.setParameter("user1", user1);
	    query.setParameter("user2", user2);

	    return query.getResultList();
	}
	

	
}
