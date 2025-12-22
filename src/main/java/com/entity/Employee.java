package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//import lombok.Getter;
//import lombok.Setter;
//import lombok.ToString;
//
//
//@Getter
//@Setter
//@ToString
@Entity
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int empId;

	private String empname;

	private String empUserName;

	private String empPassword;

	private String empMail;

	private String empAddress;

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public String getEmpUserName() {
		return empUserName;
	}

	public void setEmpUserName(String empUserName) {
		this.empUserName = empUserName;
	}

	public String getEmpPassword() {
		return empPassword;
	}

	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}

	public String getEmpMail() {
		return empMail;
	}

	public void setEmpMail(String empMail) {
		this.empMail = empMail;
	}

	public String getEmpAddress() {
		return empAddress;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", empname=" + empname + ", empUserName=" + empUserName + ", empPassword="
				+ empPassword + ", empMail=" + empMail + ", empAddress=" + empAddress + "]";
	}
	
	
}
