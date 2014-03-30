package org.ccs.cyperweb.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ccs.cyperweb.dao.EmployeeDao;
import org.ccs.cyperweb.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EmployeeService {
	private static final Log logger = LogFactory.getLog(EmployeeService.class);
	
	@Autowired
	private EmployeeDao employeeDao;

	@Transactional
	public void saveEmployee(Employee user) {
		employeeDao.saveEmployee(user);
	}

	@Transactional
	public void updateEmployee(Employee user) {
		employeeDao.updateEmployee(user);
	}

	@Transactional
	public void removeEmployee(Long id) {
		Employee user = employeeDao.findEmployeeById(id);
		if (user != null) {
			employeeDao.removeEmployee(user);
		}
	}

	@Transactional
	public void batchRemove(String name) {
		employeeDao.batchRemove(name);
	}

	@Transactional
	public Employee findEmployeeById(Long id) {
		Employee ee=  employeeDao.findEmployeeById(id);
		
		logger.debug("name==>" +ee.getName());
		//LAZY
		logger.debug("type==>" +ee.getEmployeeType());
		
		return ee;
	}

	public Employee findEmployeeById2(Long id) {
		return employeeDao.findEmployeeById2(id);

	}

	public List<Employee> findEmployeesByName(String name) {
		return employeeDao.findEmployeesByName(name);
	}

	public List<Employee> findEmployeesByDeptName(String name) {
		return employeeDao.findEmployeesByDeptName(name);
	}

	public List<Employee> findEmployeesByParkingLot(String lot) {
		return employeeDao.findEmployeesByParkingLot(lot);
	}
}
