package com.linkcode.in.springMVC.Service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linkcode.in.springMVC.POJO.AdminPOJO;
import com.linkcode.in.springMVC.Repository.AdminRepository;


@Service
public class AdminService {

	@Autowired
	AdminRepository repository;

	public AdminPOJO addAdmin(String user, String pass) {
		
		return repository.addAdmin(user,pass);
	}
	
	

	
	public AdminPOJO findAdmin(String user,String pass) {
		return repository.findAdmin(user,pass);
	}
}
