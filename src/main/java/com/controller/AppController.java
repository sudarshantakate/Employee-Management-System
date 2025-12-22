package com.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Employee;
import com.service.EmployeeService;

@Controller
public class AppController {

	@Autowired
	private EmployeeService service;

	@RequestMapping("/loginForm")
	public String loginAdmin(@RequestParam("username") String uname, @RequestParam("password") String password,
			Model model) {
		List<Employee> allEmp = service.logInService(uname, password);
		if (allEmp != null) {
			System.out.println("Controller All Student: " + allEmp);

			model.addAttribute("data", allEmp);
			return "display";
		} else {
			return "error";
		}
	}

	@RequestMapping("/reg")
	public String registerEmployee(@ModelAttribute Employee emp) {
		System.out.println("Controller Layer" + emp);
		service.registerEmployeInService(emp);
		return "Success";
	}

	@RequestMapping(value = "/updateEmp", method = RequestMethod.POST)
	public String getSingleEmp(@RequestParam("empId") int empId, Model model) {

		System.out.println("Controller Layer");
		System.out.println(empId);

		Employee employee = service.getSingleEmpInService(empId);
		model.addAttribute("emp", employee);

		return "Update";

	}

	@RequestMapping(value = "/updateEmployee")
	public String updateEmployee(@ModelAttribute Employee employee, Model model) {
		List<Employee> allEmp = service.updateEmployeeInServcie(employee);
		model.addAttribute("data", allEmp);
		return "display";
	}

	@RequestMapping(value = "/deleteEmp", method = RequestMethod.POST)
	public String deleteEmp(@RequestParam("empId") int empId, Model model) {
		List<Employee> listOfEmp = service.deleteEmpInService(empId);
		model.addAttribute("data", listOfEmp);
		return "display";

	}
}
