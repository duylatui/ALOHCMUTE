package service;

import java.util.List;

import DAO.IUserDao;
import DAO.UserDaoImple;
import entity.User;

public class UserServiceImple implements IUserService{
	IUserDao userdao = new UserDaoImple();
	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		userdao.insert(user);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userdao.update(user);
	}

	@Override
	public void delete(int userid) throws Exception {
		// TODO Auto-generated method stub
		userdao.delete(userid);
	}

	@Override
	public User findById(int userid) {
		// TODO Auto-generated method stub
		return userdao.findById(userid);
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userdao.findAll();
	}

	@Override
	public List<User> findByUsername(String username) {
		// TODO Auto-generated method stub
		return userdao.findByUsername(username);
	}

	@Override
	public List<User> findAll(int page, int pagesize) {
		// TODO Auto-generated method stub
		return userdao.findAll(page, pagesize);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return userdao.count();
	}
	

}
