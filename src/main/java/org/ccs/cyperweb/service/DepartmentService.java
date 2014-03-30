package org.ccs.cyperweb.service;

import java.util.List;

import org.ccs.cyperweb.dao.DepartmentDao;
import org.ccs.cyperweb.model.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Used for One2Many, not used in Many2One.
 * 
 * @author cyper.yin
 * 
 */
@Service
public class DepartmentService {
	@Autowired
	private DepartmentDao departmentDao;

	@Transactional
	public void saveDepartment(Department dept) {
		departmentDao.saveDepartment(dept);
	}

	@Transactional
	public void updateDepartment(Department dept) {
		departmentDao.updateDepartment(dept);
	}

	@Transactional
	public void removeDepartment(Long id) {
		Department dept = departmentDao.findDepartmentById(id);
		if (dept != null) {
			departmentDao.removeDepartment(dept);
		}
	}

	@Transactional
	public void batchRemove(String name) {
		departmentDao.batchRemove(name);
	}

	public Department findDepartmentById(Long id) {
		Department dept = departmentDao.findDepartmentById(id);
		if (dept.getEmployees()!=null) {
			System.out.println(dept.getEmployees().size());
		}
		return dept;

	}

	public List<Department> findDepartmentsByName(String name) {
		return departmentDao.findDepartmentsByName(name);
	}

}
