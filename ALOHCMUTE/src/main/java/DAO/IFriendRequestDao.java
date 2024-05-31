package DAO;

import java.util.List;

import entity.FriendRequest;
import entity.User;



public interface IFriendRequestDao {
	List<FriendRequest>findAll();
	void update(FriendRequest fr);
	void insert(FriendRequest fr);
	void delete(int frid) throws Exception;
}
