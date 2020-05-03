package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Person;

@Repository
public class PersonDAOImpl implements PersonDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(PersonDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	
	public void placeOrderManagement(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		System.out.println("CHECKING ");

		try {
			//session.beginTransaction();
		//session.save(p);
			
			String sql = "insert into PRODUCT (ProductId, name, Description) values (?, ?, ?)";
			//session.createQuery(sql);
			
			Query query = session.createQuery(sql);
			query.setParameter(0, p.getProductId());
			query.setParameter(1, p.getName());
			query.setParameter(2, p.getDescription());
			//session.save(p);
			query.executeUpdate();
			
		//session.getTransaction().commit();
		//session.close();
		}catch (Exception exp) {
			exp.printStackTrace();
			exp.getMessage();
		}
		logger.info("Person saved successfully, Person Details="+p);
	}

	
	public void updatePerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Person updated successfully, Person Details="+p);
	}

	@SuppressWarnings("unchecked")
	public List<Person> listPersons() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Person> personsList = session.createQuery("from Person").list();
		System.out.println("@@@ personsList.size(): " + personsList.size());
		for(Person p : personsList){
			logger.info("Person List::"+p);
			System.out.println("Person List::"+p);
		}
		return personsList;
	}

	public Person getPersonById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		//Person p = (Person) session.load(Person.class, new Integer(id));
		Person p = new Person();
		Query query = session.createSQLQuery("select ProductId, name, Description from Product");
		List<Object[]> rows = query.list();
		for(Object[] row : rows){
			
			p.setProductId(Integer.parseInt(row[0].toString()));
			p.setName(row[1].toString());
			p.setDescription(row[2].toString());
			System.out.println(p);
		}
		
		return p;
	}

	public void placeOrder(Person p) {
		Session session = this.sessionFactory.getCurrentSession();

		try {
			session.save(p);
		}catch (Exception exp) {
			exp.printStackTrace();
			exp.getMessage();
		}
		logger.info("Person saved successfully, Person Details="+p);
	}
	
	public void removePerson(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person p = (Person) session.load(Person.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Person deleted successfully, person details="+p);
	}

}
