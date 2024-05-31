package service;

import java.util.List;

import entity.FriendRequest;

public interface IFriendRequestService {
	List<FriendRequest>findAll();
	void update(FriendRequest fr);
	void insert(FriendRequest fr);
	void delete(int frid) throws Exception;
}	
