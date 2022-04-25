package com.blap.blapweb.DAO;

import com.blap.blapweb.DTO.UserDTO;

public interface UserDAO {
	public int insertUser(UserDTO dto);
	//세션에 등록
	public UserDTO getUser(UserDTO dto) throws Exception;
	public int loginLookup(UserDTO dto);
	public UserDTO loginOkNick(UserDTO dto);
}
