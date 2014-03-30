package org.ccs.cyperweb.service;

import java.util.List;

import org.ccs.cyperweb.dao.UserDao;
import org.ccs.cyperweb.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;

	@Transactional
	public void saveUser(User user) {
		userDao.saveUser(user);
	}

	@Transactional
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Transactional
	public void removeUser(Long id) {
		User user = userDao.findUserById(id);
		if (user != null) {
			userDao.removeUser(user);
		}
	}

	@Transactional
	public void batchRemove(String username) {
		userDao.batchRemove(username);
	}

	public User findUserById(Long id) {
		return userDao.findUserById(id);

	}

	public List<User> findUsersByName(String username) {
		return userDao.findUsersByName(username);
	}

	public List<Long> findUsersByName2(String username) {
		return userDao.findUsersByName2(username);

	}

	public List<Object[]> findUsersByName3(String username) {
		return userDao.findUsersByName3(username);

	}

	public List<User> findUsersByName4(String username) {
		return userDao.findUsersByName4(username);

	}
}
