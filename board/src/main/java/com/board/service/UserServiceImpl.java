package com.board.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.board.domain.User;
import com.board.mapper.UserMapper;


@Service
public class UserServiceImpl implements UserService {

	
	@Autowired 
	UserMapper userMapper;
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		User user = userMapper.readUser1(username);
		user.setAuthorities(getAuthorities(username));
		return user;
	}

	@Override
	public Collection<GrantedAuthority> getAuthorities(String username) {
		Collection<GrantedAuthority> authorities = userMapper.readAuthority(username);
		return authorities;
	}

	public User readUser(String username) {
		User user = userMapper.readUser(username);
		user.setAuthorities(getAuthorities(username));
		return user;
	}

	public void createUser(User user) {
		String rawPassword = user.getPassword();
		String encodedPassword = new BCryptPasswordEncoder().encode(rawPassword);
		user.setPassword(encodedPassword);
		userMapper.createUser(user);
		userMapper.createAuthority(user);
		
	}

	public void deleteUser(String username) {
		userMapper.deleteUser(username);
		userMapper.deleteAuthority(username);
	}

	public PasswordEncoder passwordEncoder() {
		return this.passwordEncoder;
	}


	
	

}
