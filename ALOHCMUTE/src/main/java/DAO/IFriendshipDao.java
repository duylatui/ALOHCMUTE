package DAO;

import java.util.List;

import entity.Friendship;
import entity.User;





public interface IFriendshipDao {
	List<Friendship>findAll();
	Friendship findById (int fsid);
	void insert(Friendship fs);
	void delete(int fsid) throws Exception;
	List<Friendship>findByUsername(int id1,int id2);
	
}
