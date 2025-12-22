package com.service;

import java.util.List;

import com.entity.Employee;

public interface EmployeeService {
	
	public void registerEmployeInService(Employee emp);
	
	public List<Employee>  logInService(String uname,String password);
	
	public Employee getSingleEmpInService(int empId);
	
	public List<Employee> updateEmployeeInServcie(Employee employee);

	public List<Employee> deleteEmpInService(int empId);

}
