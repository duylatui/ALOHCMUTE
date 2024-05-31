package service;

import java.util.List;

import DAO.IPrivateMessageDao;
import DAO.PrivateMessageDaoImple;
import entity.PrivateMessage;
import entity.User;


public class PrivateMessageServiceImple implements IPrivateMessageService{

	IPrivateMessageDao messageDao = new PrivateMessageDaoImple();
	@Override
	public void insert(PrivateMessage message) {
		// TODO Auto-generated method stub
		messageDao.insert(message);
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
		// TODO Auto-generated method stub
		return messageDao.findAll();
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
		// TODO Auto-generated method stub
		return messageDao.listMessage(user1, user2);
	}

}
