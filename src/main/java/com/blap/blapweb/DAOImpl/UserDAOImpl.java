package com.blap.blapweb.DAOImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blap.blapweb.DAO.UserDAO;
import com.blap.blapweb.DTO.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO{
	@Autowired
	SqlSession sqlSession;
	
	public int insertUser(UserDTO dto) {
		int result = sqlSession.insert("User.insertUser", dto);
		return result;
	}
	
	//세션에 등록
	public UserDTO getUser(UserDTO dto) {
		return  sqlSession.selectOne("User.getUser", dto);
	}
	
	//signup의 닉네임 중복확인
	public int loginLookup( UserDTO dto ) {
		System.out.println("기능 처리");
		int result = sqlSession.selectOne("User.loginLookup", dto);
		return result;
	}
	
	//회원 비번 닉네임 가져오기
	public UserDTO loginOkNick( UserDTO dto ) {
		UserDTO dtoo = sqlSession.selectOne("User.login_ok_nick", dto);
		return dtoo;
	}
}
