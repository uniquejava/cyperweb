package org.ccs.cyperweb.controller;

import java.util.List;

import org.ccs.cyperweb.model.Employee;
import org.ccs.cyperweb.model.EmployeeType;
import org.ccs.cyperweb.service.EmployeeService;
import org.ccs.cyperweb.service.EmployeeTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/m2o")
public class Many2OneController {
	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private EmployeeTypeService employeeTypeService;

	@RequestMapping(value = "")
	public String index(Model model) {
		List<Employee> list = employeeService.findAllEmployees();

		model.addAttribute("employees", list);
		model.addAttribute("types", employeeTypeService.findAllEmployeeTypes());
		return "m2o/m2o_index";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public void create(Employee employee, Model model) {

		try {
			// Encountered unmanaged object
			// "org.ccs.cyperweb.model.EmployeeType@3a1e8730" in life cycle
			// state
			// unmanaged while cascading persistence via field
			// "org.ccs.cyperweb.model.Employee.employeeType" during flush.
			// However, this field does not allow cascade persist.
			// You cannot flush unmanaged objects or graphs that have persistent
			// associations to unmanaged objects.
			Long id = employee.getEmployeeType().getId();
			EmployeeType type = employeeTypeService.getEmployeeTypeReference(id);
			employee.setEmployeeType(type);
			// fix end

			employeeService.saveEmployee(employee);

			model.addAttribute("ok", "true");
			model.addAttribute("msg", "create success!");
		} catch (Exception e) {
			model.addAttribute("ok", "false");
			model.addAttribute("msg", e.getMessage());
		}
	}

	@RequestMapping("update/{id}")
	public void update(Model model, @PathVariable("id") Long id) {
		Employee e = employeeService.findEmployeeById(id);
		model.addAttribute("e", e);
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public void update(Employee employee, Model model) {
		try {
			employeeService.updateEmployee(employee);
			model.addAttribute("ok", "true");
			model.addAttribute("msg", "update success!");
		} catch (Exception e) {
			model.addAttribute("ok", "false");
			model.addAttribute("msg", e.getMessage());
		}
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(Model model, @PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		employeeService.removeEmployee(id);
		redirectAttributes.addFlashAttribute("success", "delete success!");
		return "redirect:/m2o";
	}

}
