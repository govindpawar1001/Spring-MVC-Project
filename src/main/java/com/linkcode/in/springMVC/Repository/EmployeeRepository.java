package com.linkcode.in.springMVC.Repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.linkcode.in.springMVC.POJO.EmployeePOJO;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;

@Repository
public class EmployeeRepository {

	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;
	
	public static void openConnection() {
		factory=Persistence.createEntityManagerFactory("employeeManagement");
		manager=factory.createEntityManager();
		transaction=manager.getTransaction();
	}
	
	public static void closeConnection(){
		if(factory!=null) {
			factory.close();
			
		}
		if(manager!=null) {
			manager.close();
		}
		if(transaction.isActive()) {
			transaction.rollback();
		}
	}
	
	
	
	
	public EmployeePOJO addEmployee(String name,String email,String dept,double salary) {
		
		openConnection();
		transaction.begin();
		EmployeePOJO pojo =new EmployeePOJO();
		pojo.setName(name);
		pojo.setEmail(email);
		pojo.setDepartment(dept);
		pojo.setSalary(salary);
		
		manager.persist(pojo);
		transaction.commit();
		closeConnection();
		
		return pojo;

	}

	public EmployeePOJO searchEmployee(int id) {
		openConnection();
		transaction.begin();
		EmployeePOJO emp=manager.find(EmployeePOJO.class, id);
		transaction.commit();
		closeConnection();
		return emp;
	}
	
	
	
	public EmployeePOJO removeEmployee(int id) {
		openConnection();
		transaction.begin();
		EmployeePOJO emp=manager.find(EmployeePOJO.class, id);
		if(emp!=null) {
			manager.remove(emp);
			transaction.commit();
			closeConnection();
			return emp;
		}
		transaction.commit();
		closeConnection();
		return null;
		}

	public List<EmployeePOJO> searchAllEmployees() {
		openConnection();
		transaction.begin();
		
		String q="from EmployeePOJO";
		
		Query query=manager.createQuery(q);
		List<EmployeePOJO> emps=query.getResultList();
		
		transaction.commit();
		closeConnection();
		return emps;
	}

	@Transactional
    public void update(EmployeePOJO updatedEmp) {
        openConnection();
        transaction.begin();
        manager.merge(updatedEmp);
        transaction.commit();
        closeConnection();
    }
	
	
	
	
	
	}
	

