package org.ccs.cyperweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ccs.cyperweb.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	@PersistenceContext
	private EntityManager em;

	public void saveUser(User user) {
		em.persist(user);
	}

	public void updateUser(User user) {
		em.merge(user);
	}

	public void removeUser(User user) {
		em.remove(user);
	}

	public void batchRemove(String username) {
		em.createQuery("DELETE FROM User u  WHERE u.username = ?1").setParameter(1, username).executeUpdate();
	}

	public User findUserById(Long id) {
		User user = em.find(User.class, id);
		return user;
	}

	public User getReference(Long id) {
		User user = em.getReference(User.class, id);
		return user;
	}

	public List<User> findUsersByName(String username) {
		List<User> result = em.createQuery("select u from User u where u.username = :name", User.class)
				.setParameter("name",username).setFirstResult(1).setMaxResults(3).getResultList();
		return result;
	}

	public List<Long> findUsersByName2(String username) {
		List<Long> result = em.createQuery("select u.id from User u where u.username = ?1", Long.class)
				.setParameter(1, username).getResultList();
		return result;

	}

	public List<Object[]> findUsersByName3(String username) {
		List<Object[]> result = em
				.createQuery("select u.id,u.username,u.password from User u where u.username = ?1", Object[].class)
				.setParameter(1, username).getResultList();
		return result;

	}

	public List<User> findUsersByName4(String username) {
		List<User> result = em
				.createQuery("select NEW User(u.id,u.username,u.password) from User u where u.username = ?1",
						User.class).setParameter(1, username).getResultList();
		return result;

	}
}
