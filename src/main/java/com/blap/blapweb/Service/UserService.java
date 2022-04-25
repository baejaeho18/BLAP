package com.blap.blapweb.Service;

import com.blap.blapweb.DTO.UserDTO;

public interface UserService {
	public int insertUser(UserDTO dto);
	public UserDTO getUser(UserDTO dto) throws Exception;
	public int loginLookup(UserDTO dto);
	public UserDTO loginOkNick(UserDTO dto);
}
