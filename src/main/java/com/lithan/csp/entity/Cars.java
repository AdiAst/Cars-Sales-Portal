package com.lithan.csp.entity;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Transient;

@Entity
public class Cars {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String make;
	private String model;
	 @Column(nullable = true, length = 64)
	private String image;
	private int year;
	private int price;
	
    private String postedBy;
	
	private LocalDate biddingDate;
	
	@OneToMany(mappedBy = "car")
    private List<Bid> bids;
	
	 public Cars() {
			
		}
	 
    public Cars(int id,String make, String model, int year, int price) {
		super();
		this.id = id;
		this.make = make;
		this.model = model;
		this.year = year;
		this.price = price;
	}

	public Cars(int id, String name, String make, String model, String image, int year, int price, String postedBy,
			LocalDate biddingDate, List<Bid> bids) {
		super();
		this.id = id;
		this.name = name;
		this.make = make;
		this.model = model;
		this.image = image;
		this.year = year;
		this.price = price;
		this.postedBy = postedBy;
		this.biddingDate = biddingDate;
		this.bids = bids;
	}

	@Transient
    public String getPhotosImagePath() {
        if (image == null || id == 0) return null;
         
        return "/cars-img/" + id + "/" + image;
    }
    
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
	public String getPostedBy() {
		return postedBy;
	}
	public void setPostedBy(String postedby) {
		this.postedBy = postedby;
	}
	public LocalDate getBiddingDate() {
		return biddingDate;
	}
	public void setBiddingDate(LocalDate biddingDate) {
		this.biddingDate = biddingDate;
	}
	public List<Bid> getBids() {
		return bids;
	}
	public void setBids(List<Bid> bids) {
		this.bids = bids;
	}

	@Override
	public String toString() {
		return "Cars [id=" + id + ", name=" + name + ", make=" + make + ", model=" + model + ", image=" + image
				+ ", year=" + year + ", price=" + price + ", postedBy=" + postedBy + ", biddingDate=" + biddingDate
				+ ", bids=" + bids + "]";
	}
	
}
