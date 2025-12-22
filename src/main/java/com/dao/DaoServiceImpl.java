package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.Employee;

@Repository
public class DaoServiceImpl implements DaoService {

	@Autowired(required = true)
	private SessionFactory sf;

	@Override
	public List<Employee> logInDao(String uname, String password) {
		// TODO Auto-generated method stub
		Session session = sf.openSession();
		Query query = session.createQuery("from Employee");
		List<Employee> allEmp = query.getResultList();
		session.close();
		return allEmp;
	}

	@Override
	public void registerEmployeeInDao(Employee emp) {
		// TODO Auto-generated method stub
		System.out.println("Dao Layer" + emp);
		Session session = sf.openSession();
		session.save(emp);
		session.beginTransaction().commit();
	}

	@Override
	public Employee getSingleEmpInDao(int empId) {
		System.out.println("Dao Layer");
		Session session = sf.openSession();

		Employee employee = session.get(Employee.class, empId);
		session.close();
		return employee;
	}

	@Override
	public List<Employee> updateEmployeeInDao(Employee employee) {
		Session session = sf.openSession();
		session.update(employee);
		session.beginTransaction().commit();
		Query query = session.createQuery("from Employee");
		List<Employee> allEmp = query.getResultList();
		System.out.println("Employee Details updated!!");
		return allEmp;

	}

	@Override
	public List<Employee> deleteEmpInDao(int empId) {
		Session session = sf.openSession();
		Employee employee = session.get(Employee.class, empId);
		if(employee!=null) {
			session.delete(employee);
		}else {
			System.out.println("Employee not found");
		}
		session.beginTransaction().commit();
		System.out.println("Selected Employee Delete Successfully!!");
		Query query = session.createQuery("from Employee");
		List<Employee> listOfEmp = query.getResultList();
		return listOfEmp;
	}

}
