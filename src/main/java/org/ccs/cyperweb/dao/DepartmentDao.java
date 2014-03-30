package org.ccs.cyperweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ccs.cyperweb.model.Department;
import org.springframework.stereotype.Repository;
/**
 * Used for One2Many, not used in Many2One.
 * @author cyper.yin
 *
 */
@Repository
public class DepartmentDao {
	@PersistenceContext
	private EntityManager em;

	public void saveDepartment(Department department) {
		em.persist(department);
	}

	public void updateDepartment(Department department) {
		em.merge(department);
	}

	public void removeDepartment(Department department) {
		em.remove(department);
	}

	public void batchRemove(String name) {
		em.createQuery("DELETE FROM Department u  WHERE u.name = ?1").setParameter(1, name).executeUpdate();
	}

	public Department findDepartmentById(Long id) {
		Department department = em.find(Department.class, id);
		return department;
	}

	public Department getReference(Long id) {
		Department department = em.getReference(Department.class, id);
		return department;
	}

	public List<Department> findDepartmentsByName(String name) {
		List<Department> result = em.createQuery("select u from Department u where u.name = ?1", Department.class)
				.setParameter(1, name).getResultList();
		return result;
	}

}
