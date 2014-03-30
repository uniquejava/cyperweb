package smartcrud.openjpa.crud;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ccs.cyperweb.model.Employee;
import org.ccs.cyperweb.service.EmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class Many2OneTest {
	private static final Log logger = LogFactory.getLog(Many2OneTest.class);
	@Autowired
	private EmployeeService employeeService;

	@Test
	public void testQuery1() {
		Employee user = employeeService.findEmployeeById(1L);
		logger.debug("name==>" +user.getName());
		//LAZY
		logger.debug("type==>" +user.getEmployeeType());
//		Employee user = employeeService.findEmployeeById2(1L);
	}

	@Test
	public void testQuery2() {
		List<Employee> userList = employeeService.findEmployeesByName("John");
		Assert.isTrue(userList.size() > 0);
		for (Employee u : userList) {
			logger.info(u.getId());
		}

	}
	
	@Test
	public void testQuery3() {
		List<Employee> userList = employeeService.findEmployeesByDeptName("R&D");
		Assert.isTrue(userList.size() > 0);
		for (Employee u : userList) {
			logger.info(u.getName());
		}
		
	}

	@Test
	public void testSave() {
		Employee user = new Employee();
		employeeService.saveEmployee(user);

	}

	@Test
	public void testUpdate() {
		Employee user = employeeService.findEmployeeById(4L);
		employeeService.updateEmployee(user);
	}

	@Test
	public void testRemove() {
		// employeeService.batchRemove("single");
		employeeService.removeEmployee(11L);
	}

	@Test
	public void testOrphan(){
		Employee e = employeeService.findEmployeeById(4L);
//		e.setName("John5");
//		System.out.println(e.getDepartment());
//		e.setDepartment(null);
//		e.setDepartment(departmentService.findDepartmentById(1L));
//		employeeService.updateEmployee(e);
		
	}
}
