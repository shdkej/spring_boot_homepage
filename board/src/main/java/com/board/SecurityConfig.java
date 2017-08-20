package com.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

import com.board.service.UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired UserService userService;
	

	
	protected void configure(HttpSecurity http) throws Exception{
		http
			.csrf().disable()
			.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.NEVER)
				.and()
			.authorizeRequests()
				.antMatchers("/","/createmember","/logintemplelet/**","/assets/**","/images/**","/*.html").permitAll()
				.and()
			.authorizeRequests()
				.antMatchers("/login").permitAll()
				.antMatchers("/Member").hasAuthority("ROLE_ADMIN")
				.anyRequest().authenticated()
				.and()
				.formLogin()
				.loginPage("/login")
				.and()
			.logout()
			.logoutSuccessUrl("/");
		
	}
	
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(userService)
			.passwordEncoder(userService.passwordEncoder());
	}

	@Bean
	public AuthenticationManager authenticationManagerBean() throws Exception{
		return super.authenticationManagerBean();
	}

}
	