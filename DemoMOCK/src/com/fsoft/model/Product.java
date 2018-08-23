package com.fsoft.model;

import java.util.Date;
import java.util.List;

import javax.persistence.*;



@Entity
@Table(name="products")
public class Product {
	@Id
	@GeneratedValue
	Integer id;
	String name;
	Double unitPrice;
	Double discount;
	Integer unitsInStock;
	String image;
	Boolean available;
	@Temporal(TemporalType.DATE)
	Date productDate;
	Integer viewCount;
	String description;
	Boolean viewHome;
	
	@ManyToOne
	@JoinColumn(name="categoryId")
	Category category;
	
	
	@ManyToOne
	@JoinColumn(name="supplierId")
	Supplier supplier;
	
	@ManyToOne
	@JoinColumn(name="technicalParam")
	TechnicalParam technicalParam;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Integer getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(Integer unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Boolean getAvailable() {
		return available;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}

	public Date getProductDate() {
		return productDate;
	}

	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}

	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public TechnicalParam getTechnicalParam() {
		return technicalParam;
	}

	public void setTechnicalParam(TechnicalParam technicalParam) {
		this.technicalParam = technicalParam;
	}

	public Boolean getViewHome() {
		return viewHome;
	}

	public void setViewHome(Boolean viewHome) {
		this.viewHome = viewHome;
	}
	
	
}
