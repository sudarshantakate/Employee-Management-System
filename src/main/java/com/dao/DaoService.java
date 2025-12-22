package com.dao;

import java.util.List;

import com.entity.Employee;

public interface DaoService {

	public void registerEmployeeInDao(Employee emp);
	
	public List<Employee>  logInDao(String uname,String password);
	
	public Employee getSingleEmpInDao(int empId);
	
	public List<Employee> updateEmployeeInDao(Employee employee);

	public List<Employee> deleteEmpInDao(int empId);
}
