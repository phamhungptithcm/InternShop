package com.fsoft.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Review")
public class Review {
	@Id
	String review;
	Integer ratting;
	
	@ManyToOne
	@JoinColumn(name="customerId")
	Customer customer;
	
	@ManyToOne
	@JoinColumn(name="productId")
	Product product;

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Integer getRatting() {
		return ratting;
	}

	public void setRatting(Integer ratting) {
		this.ratting = ratting;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	
}
