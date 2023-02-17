package com.lithan.csp.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.lithan.csp.entity.WebUser;
import com.lithan.csp.repository.WebUserRepository;
import com.lithan.csp.security.WebUserDetails;

@Component
public class WebUserDetailsService implements UserDetailsService{
	@Autowired
	private WebUserRepository repo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<WebUser>user= repo.findByName(username);
		System.out.println(user.get().getName());
		return user.map(WebUserDetails::new)
				.orElseThrow(()->new UsernameNotFoundException("User Not Found"+username));
	}

}
