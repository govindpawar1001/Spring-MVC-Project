package com.linkcode.in.springMVC.Repository;

import java.util.List;

import org.hibernate.event.spi.EntityCopyObserverFactory;
import org.springframework.stereotype.Repository;

import com.linkcode.in.springMVC.POJO.AdminPOJO;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;

@Repository
public class AdminRepository {

    @PersistenceContext
    private EntityManager manager;

    @Transactional
    public AdminPOJO addAdmin(String user, String pass) {
        AdminPOJO admin = new AdminPOJO();
        admin.setUsername(user);
        admin.setPassword(pass);
        manager.persist(admin);
        return admin;
    }

    public AdminPOJO findAdmin(String user, String pass) {
        try {
            String jpql = "SELECT a FROM AdminPOJO a WHERE a.username = :user AND a.password = :pass";
            return manager.createQuery(jpql, AdminPOJO.class)
                          .setParameter("user", user)
                          .setParameter("pass", pass)
                          .getSingleResult();
        } catch (Exception e) {
            return null; // Return null if no user found
        }
    }
}