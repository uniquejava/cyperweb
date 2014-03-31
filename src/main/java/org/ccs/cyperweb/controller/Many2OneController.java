package org.ccs.cyperweb.controller;

import java.util.List;

import org.ccs.cyperweb.model.Employee;
import org.ccs.cyperweb.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/m2o")
public class Many2OneController {
	@Autowired
	private EmployeeService employeeService;
	
	
	@RequestMapping(value = "")
	public String index(Model model) {
		List<Employee> list = employeeService.findAllEmployees();
		
		model.addAttribute("employees", list);
		return "m2o/m2o_index";
	}
	
}
