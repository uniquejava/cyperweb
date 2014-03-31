package org.ccs.cyperweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ccs.cyperweb.model.EmployeeType;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeTypeDao {
	@PersistenceContext
	private EntityManager em;

	public void saveEmployeeType(EmployeeType empType) {
		em.persist(empType);
	}

	public void updateEmployeeType(EmployeeType empType) {
		em.merge(empType);
	}

	public void removeEmployeeType(EmployeeType empType) {
		em.remove(empType);
	}

	public void batchRemove(String empTypename) {
		em.createQuery("DELETE FROM EmployeeType u  WHERE u.name = ?1")
				.setParameter(1, empTypename).executeUpdate();
	}

	public EmployeeType findEmployeeTypeById(Long id) {
		EmployeeType empType = em.find(EmployeeType.class, id);
		return empType;
	}
	
	public EmployeeType getEmployeeTypeReference(Long id) {
		EmployeeType empType = em.getReference(EmployeeType.class, id);
		return empType;
	}

	public List<EmployeeType> findAllEmployeeTypes() {
		em.clear();
		List<EmployeeType> result = em.createQuery("select u from EmployeeType u",
				EmployeeType.class).getResultList();
		return result;

	}

}
