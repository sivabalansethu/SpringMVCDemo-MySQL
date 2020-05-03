package com.journaldev.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
@Entity
@Table(name="PRODUCT")
public class Person implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
public Person() {
	super();
}
	@Id
	@Column(name="ProductId")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int productId;
	
	private String name;
	
	private String description;
	
	@Override
	public String toString() {
		return "Person [productId=" + productId + ", name=" + name + ", Description=" + description + "]";
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
