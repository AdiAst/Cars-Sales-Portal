package com.lithan.csp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.lithan.csp.entity.Bid;

@Repository
public interface BidRepository extends JpaRepository<Bid,Integer>{

}
