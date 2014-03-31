package org.ccs.cyperweb.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ccs.cyperweb.dao.EmployeeTypeDao;
import org.ccs.cyperweb.model.EmployeeType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EmployeeTypeService {
	private static final Log logger = LogFactory.getLog(EmployeeTypeService.class);

	@Autowired
	private EmployeeTypeDao employeeTypeDao;

	@Transactional
	public void saveEmployeeType(EmployeeType user) {
		employeeTypeDao.saveEmployeeType(user);
	}

	@Transactional
	public void updateEmployeeType(EmployeeType user) {
		employeeTypeDao.updateEmployeeType(user);
	}

	@Transactional
	public void removeEmployeeType(Long id) {
		EmployeeType user = employeeTypeDao.findEmployeeTypeById(id);
		if (user != null) {
			employeeTypeDao.removeEmployeeType(user);
		}
	}

	@Transactional
	public void batchRemove(String name) {
		employeeTypeDao.batchRemove(name);
	}

	// ------below are for web -----
	public List<EmployeeType> findAllEmployeeTypes() {
		return employeeTypeDao.findAllEmployeeTypes();
	}
	
	public EmployeeType getEmployeeTypeReference(Long id){
		return employeeTypeDao.getEmployeeTypeReference(id);
	}
}
