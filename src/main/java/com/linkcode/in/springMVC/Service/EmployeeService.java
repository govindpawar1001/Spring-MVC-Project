package com.linkcode.in.springMVC.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linkcode.in.springMVC.POJO.EmployeePOJO;
import com.linkcode.in.springMVC.Repository.EmployeeRepository;

import jakarta.transaction.Transactional;

@Service
public class EmployeeService {

	@Autowired
	EmployeeRepository repo;

	public EmployeePOJO addEmployee(String name,String email,String dept,double salary) {

		return repo.addEmployee(name, email, dept, salary);

	}

	public EmployeePOJO searchEmployee(int id) {

		return repo.searchEmployee(id);
	}

	public EmployeePOJO removeEmployee(int id) {
		return repo.removeEmployee(id);	
	}

	public List<EmployeePOJO> searchAllEmployee() {
		return repo.searchAllEmployees();
	}


	
	
	
	
	@Transactional
    public void updateEmployee(int id, String name, String email, String designation, double salary) {
        EmployeePOJO emp = repo.searchEmployee(id);
        if (emp != null) {
            emp.setName(name);
            emp.setEmail(email);
            emp.setDepartment(designation);
            emp.setSalary(salary);
            repo.update(emp);
        }
    }
	
}
