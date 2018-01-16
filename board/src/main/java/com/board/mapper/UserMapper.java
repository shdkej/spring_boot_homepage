package com.board.mapper;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;

import com.board.domain.User;
import com.board.support.DB2;

@DB2
public interface UserMapper {
	public List<User> userlist();
	public User readUser(String username);
	public List<GrantedAuthority> readAuthority(String username);
	public void createUser(User user);
	public void createAuthority(User user);
	public void deleteUser(String username);
	public void deleteAuthority(String username);
	public void updateAdminMember(User user) throws Exception;
	public void updateMember(User user) throws Exception;
	public List<User> findSignMember(String username) throws Exception;
	public int checkId(User user) throws Exception;
	public void updateAnnual() throws Exception;

}
