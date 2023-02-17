package com.lithan.csp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lithan.csp.entity.Cars;

public interface CarsRepository extends JpaRepository<Cars,Integer>{
	@Query(value = "SELECT id FROM Cars ORDER BY id DESC LIMIT 1", nativeQuery = true)
	public int findLatestCarId();
	
	@Query(value="SELECT * FROM Cars WHERE bidding_date IS NULL", nativeQuery = true)
	public List<Cars> findAllByBiddingDateIsNull();
	
	@Query(value= "SELECT * FROM Cars WHERE bidding_date IS NOT NULL", nativeQuery = true)
	public List<Cars> findAllByBiddingDateIsNotNull();
	
	@Query(value="SELECT * FROM Cars WHERE posted_by = :name",nativeQuery = true)
	public List<Cars> findByUserName(@Param("name") String name);
	
	@Query(value="SELECT * FROM Cars WHERE "
			+ "name like %:keyword% OR "
			+ "make like %:keyword% OR "
			+ "model like %:keyword% OR "
			+ "year like %:keyword%",nativeQuery = true)
	public List<Cars> findByKeyword(@Param("keyword") String keyword);
}
