package com.lithan.csp.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lithan.csp.entity.WebUser;

import jakarta.transaction.Transactional;

public interface WebUserRepository extends JpaRepository<WebUser,Integer>{

	Optional<WebUser> findByName(String username);
	
	@Modifying
	@Transactional
	@Query(value="update web_user set role='ROLE_ADMIN' where name = :name",nativeQuery = true)
	public void grandAuth(@Param("name")String name);
}
