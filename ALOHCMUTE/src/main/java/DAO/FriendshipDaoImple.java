package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import entity.Friendship;
import entity.User;

public class FriendshipDaoImple implements IFriendshipDao{

	@Override
	public List<Friendship> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();

		TypedQuery<Friendship> query = enma.createNamedQuery("Friendship.findAll", Friendship.class);

		return query.getResultList();
	}

	@Override
	public Friendship findById(int fsid) {
		EntityManager enma = JPAConfig.getEntityManager();

		Friendship f = enma.find(Friendship.class, fsid);

		return f;
	}

	@Override
	public void insert(Friendship fs) {
		// TODO Auto-generated method stub
		EntityManager enma = JPAConfig.getEntityManager();

		EntityTransaction trans = enma.getTransaction(); // chức năng insert có

		try {

			trans.begin();

			enma.persist(fs);// persist chính là insert đối tượng category vô

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
	public void delete(int fsid) throws Exception {
		// TODO Auto-generated method stub
		EntityManager enma = JPAConfig.getEntityManager();

		EntityTransaction trans = enma.getTransaction();

		try {

			trans.begin();

			Friendship fs = enma.find(Friendship.class, fsid);

			if (fs != null) {

				enma.remove(fs);

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
	public List<Friendship> findByUsername(int id1,int id2) {
	    EntityManager entityManager = JPAConfig.getEntityManager();

	    String jpql = "SELECT f FROM Friendship f WHERE (f.user1.userID = :id1 AND f.user2.userID = :id2) OR (f.user1.userID = :id2 AND f.user2.userID = :id1)";

	    TypedQuery<Friendship> query = entityManager.createQuery(jpql, Friendship.class);

	    query.setParameter("id1", id1);
	    query.setParameter("id2", id2);

	    return query.getResultList();
	}


	
	
}
