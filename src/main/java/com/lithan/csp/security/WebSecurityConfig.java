package com.lithan.csp.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import com.lithan.csp.service.WebUserDetailsService;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class WebSecurityConfig {
	@Bean
	public UserDetailsService userDetailService() {
//		UserDetails admin = User.withUsername("Athe").password(passEncoder.encode("123")).roles("ADMIN").build();
//		UserDetails user = User.withUsername("Uthe").password(passEncoder.encode("123")).roles("USER").build();
//		return new InMemoryUserDetailsManager(admin,user);
		return new WebUserDetailsService();
	}
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		return http
				.csrf().disable()
				.authorizeHttpRequests()
				.requestMatchers(
						"/profile",
						"/store",
						"/list-of-user",
						"/sale-car",
						"/sale-bid-car",
						"/bid"
						).authenticated()
				.and()
				.authorizeHttpRequests()
				.requestMatchers("/**").permitAll()
				.and()
				.formLogin().loginPage("/login").permitAll()
				.and().build();
	}
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public AuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
		authenticationProvider.setUserDetailsService(userDetailService());
		authenticationProvider.setPasswordEncoder(passwordEncoder());
		return authenticationProvider;
	}
}
