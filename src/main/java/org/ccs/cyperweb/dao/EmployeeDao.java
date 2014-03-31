package org.ccs.cyperweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ccs.cyperweb.model.Employee;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDao {
	@PersistenceContext
	private EntityManager em;

	public void saveEmployee(Employee employee) {
		em.persist(employee);
	}

	public void updateEmployee(Employee employee) {
		em.merge(employee);
	}

	public void removeEmployee(Employee employee) {
		em.remove(employee);
	}

	public void batchRemove(String employeename) {
		em.createQuery("DELETE FROM Employee u  WHERE u.name = ?1")
				.setParameter(1, employeename).executeUpdate();
	}

	public Employee findEmployeeById(Long id) {
		Employee employee = em.find(Employee.class, id);
		return employee;
	}

	public Employee findEmployeeById2(Long id) {
		Employee result = em
				.createQuery(
						"select NEW Employee(t.id,t.name,t.salary) from Employee t where t.id = ?1",
						Employee.class).setParameter(1, id).getSingleResult();
		return result;
	}

	public Employee getReference(Long id) {
		Employee employee = em.getReference(Employee.class, id);
		return employee;
	}

	public List<Employee> findEmployeesByName(String name) {
		List<Employee> result = em
				.createQuery("select u from Employee u where u.name = ?1",
						Employee.class).setParameter(1, name).getResultList();
		return result;
	}

	public List<Employee> findEmployeesByDeptName(String name) {
		List<Employee> result = em
				.createQuery(
						"select u from Employee u where u.department.name = ?1",
						Employee.class).setParameter(1, name).getResultList();
		return result;
	}

	public List<Employee> findEmployeesByParkingLot(String lot) {
		List<Employee> result = em
				.createQuery(
						"select u from Employee u where u.parkingSpace.lot = ?1",
						Employee.class).setParameter(1, lot).getResultList();
		return result;
	}

	
	public List<Employee> findAllEmployees() {
		em.clear();
		List<Employee> result = em.createQuery("select u from Employee u",
				Employee.class).getResultList();
		return result;

	}

}
