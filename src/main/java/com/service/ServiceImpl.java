package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.DaoService;
import com.entity.Employee;

@Service
public class ServiceImpl implements EmployeeService{
 

	@Autowired
	private DaoService dao;
	
	@Override
	public List<Employee>  logInService(String uname,String password) {
		System.out.println("Service Layer");
		
		if(uname.equals("admin")&& password.equals("admin123")) {
			List<Employee> allEmp = dao.logInDao(uname, password);
			return allEmp;
		}else {
			return null;
		}
		
	}
	
	@Override
	public void registerEmployeInService(Employee emp) {
		System.out.println("Service Layer " + emp);
		dao.registerEmployeeInDao(emp);
		
	}

	@Override
	public Employee getSingleEmpInService(int empId) {
		System.out.println("Service layer");
		Employee employee = dao.getSingleEmpInDao(empId);
		return employee;
		
	}

	@Override
	public List<Employee> updateEmployeeInServcie(Employee employee) {
		return dao.updateEmployeeInDao(employee);
		
	}

	@Override
	public List<Employee> deleteEmpInService(int empId) {
		List<Employee> listOfEmp = dao.deleteEmpInDao(empId);
		return listOfEmp;
		
	}

	
	

}
