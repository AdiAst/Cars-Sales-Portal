package com.lithan.csp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.lithan.csp.entity.Bid;
import com.lithan.csp.entity.Cars;
import com.lithan.csp.entity.WebUser;
import com.lithan.csp.repository.BidRepository;
import com.lithan.csp.repository.CarsRepository;
import com.lithan.csp.repository.WebUserRepository;

@Service
public class WebService {
	@Autowired
	private WebUserRepository userRepo;
	@Autowired
	private CarsRepository carsRepo;
	@Autowired
	private BidRepository bidRepo;
	
	@Autowired
	private PasswordEncoder passEncoder;
	
	public WebService(WebUserRepository userRepo, CarsRepository carsRepo, BidRepository bidRepo) {
		super();
		this.userRepo = userRepo;
		this.carsRepo = carsRepo;
		this.bidRepo = bidRepo;
	}

	public boolean addUser(WebUser webUser) {
		passEncoder = new BCryptPasswordEncoder();
		String encoded = passEncoder.encode(webUser.getPassword());
		webUser.setPassword(encoded);
		userRepo.save(webUser);
		return true;
	}
	
	public Optional<WebUser> getSingleUser(String username) {
		return userRepo.findByName(username);
	}
	public List<WebUser> getAllUsers(){
		return userRepo.findAll();
	}
	
	public void grandAuth(String name) {
		userRepo.grandAuth(name);
	}
	
	public Cars addCar(Cars car) {
		
		return carsRepo.save(car);
	}
	public List<Cars> getAllCars(){
		return carsRepo.findAll();
	}
	public List<Cars> getAllNormalCars(){
		return carsRepo.findAllByBiddingDateIsNull();
	}
	public List<Cars> getAllBidCars(){
		return carsRepo.findAllByBiddingDateIsNotNull();
	}
	public List<Cars> getAllCarsFormSingleUser(String name){
		return carsRepo.findByUserName(name);
	}
	public int getLatestCarId() {
		return carsRepo.findLatestCarId();
	}
	public List<Cars> search(String keyword){
		return carsRepo.findByKeyword(keyword);
	}
	
	public Optional<Cars> getSingleCar(int id){
		return carsRepo.findById(id);
	}
	
	public void addBid(Bid bid) {
		bidRepo.save(bid);
	}
	
	public void deleteUser(int id) {
		userRepo.deleteById(id);
	}
	public void deleteCar(int id) {
		carsRepo.deleteById(id);
	}

}
