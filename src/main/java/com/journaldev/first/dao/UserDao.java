package com.journaldev.first.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.journaldev.first.entity.User;
import com.journaldev.first.util.HibernateUtil;

public class UserDao {

	public void saveUser(User user) {
		Transaction transaction = null;
		try {
			Session session = HibernateUtil.getSessionFactory().openSession();
			// start a transaction
			transaction = session.beginTransaction();
			// save the user object
			session.save(user);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {

			if (transaction != null) {
				transaction.rollback();
			}

			e.printStackTrace();
		}
	}

	public boolean validate(String userName, String password) {

		Transaction transaction = null;
		User user = null;
		try {
			Session session = HibernateUtil.getSessionFactory().openSession();
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (User) session.createQuery("FROM User U WHERE U.username = :userName")
					.setParameter("userName", userName).uniqueResult();

			if (user != null && user.getPassword().equals(password)) {
				return true;
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return false;
	}

	public boolean checkUsernameOrEmail(String userName, String email) {

		Transaction transaction = null;
		User user = null;
		try {
			Session session = HibernateUtil.getSessionFactory().openSession();
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (User) session.createQuery("FROM User U WHERE U.username = :userName")
					.setParameter("userName", userName).uniqueResult();

			if (user != null && user.getEmail().equals(email)) {
				return true;
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return false;
	}
	
	public User findUser(String userName) {
		Transaction transaction = null;
		User user = null;
		try {
			Session session = HibernateUtil.getSessionFactory().openSession();
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (User) session.createQuery("FROM User U WHERE U.username = :userName")
					.setParameter("userName", userName).uniqueResult();

			if (user != null && user.getUsername().equals(userName)) {
				return user;
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return null;
	}

}