package com.blap.blapweb.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blap.blapweb.DAO.UserDAO;
import com.blap.blapweb.DTO.UserDTO;
import com.blap.blapweb.Service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService{
	@Autowired
	UserDAO userDAO;
	
	@Override
	public int insertUser(UserDTO dto) {
		return userDAO.insertUser(dto);
	}
	
	@Override
	public UserDTO getUser(UserDTO dto) throws Exception {
		return userDAO.getUser(dto);
	}
	
	@Override
	public int loginLookup(UserDTO dto) {
		return userDAO.loginLookup(dto);
	}
	
	@Override
	public UserDTO loginOkNick(UserDTO dto) {
		return userDAO.loginOkNick(dto);
	}
}