package com.infohub.project.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDAOImpl dao;
	
	@Override
	public List<Object> listAll() {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public LoginDTO getUserById(String userId) {
		// TODO Auto-generated method stub
		return dao.getUserById(userId);
	}

	@Override
	public LoginDTO getUserByname(String name) {
		// TODO Auto-generated method stub
		return dao.getUserByname(name);
	}

	@Override
	public boolean checkuserIdDuplicate(String userId) {
		// TODO Auto-generated method stub
		return dao.checkuserIdDuplicate(userId) > 0;
	}

	@Override
	public boolean checkNameDuplicate(String name) {
		// TODO Auto-generated method stub
		return dao.checkNameDuplicate(name) > 0;
	}

	@Override
	public int insertUser(LoginDTO dto) {
		// TODO Auto-generated method stub
		return dao.insertUser(dto);
	}

	@Override
	public int updateUser(LoginDTO dto) {
		// TODO Auto-generated method stub
		return dao.updateUser(dto);
	}

	@Override
	public int deleteUser(String userId) {
		// TODO Auto-generated method stub
		return dao.deleteUser(userId);
	}

	@Override
	public LoginDTO login(LoginRequest req) {
		// TODO Auto-generated method stub
		return dao.login(req);
	}

	@Override
	public String findid(String name, String email, String phone) {
		// TODO Auto-generated method stub
		return dao.findid(name, email, phone);
	}

	@Override
	public int findpassword(String userId, String email, String phone) {
		// TODO Auto-generated method stub
		return dao.findpassword(userId, email, phone);
	}

	@Override
	public int updatepassword(String password, String userId) {
		// TODO Auto-generated method stub
		return dao.updatepassword(password, userId);
	}

	@Override
	public String checkPasswordById(String userId) {
		// TODO Auto-generated method stub
		return dao.checkPasswordById(userId);
	}

	@Override
	public int updateKeywords(String userId, String keywords) {
		// TODO Auto-generated method stub
		return dao.updateKeywords(userId, keywords);
	}
	
	public String formatPhoneNumber(String phone) {
		if(phone.contains("-")) {
			return phone;
		}
		if(phone.length() == 11) {
			return phone.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
		}else if(phone.length() == 10) {
			return phone.replaceAll("(\\d{2})(\\d{4})(\\d{4})", "$1-$2-$3");
		}
		return phone;
	}

	@Override
	public void saveIfNotExist(LoginDTO kakaoUser) {
		// TODO Auto-generated method stub
		LoginDTO dto = dao.findByKakaoId(kakaoUser.getKakaoId());
        if (dto == null) {
        	 dto = new LoginDTO();
        	 dto.setUserId("kakao_" + kakaoUser.getKakaoId()); 
             dto.setPassword("12345");
             dto.setName("kakao_" + kakaoUser.getKakaoId()); 
             dto.setEmail(kakaoUser.getEmail() != null ? kakaoUser.getEmail() : "");
             dto.setKakaoId(kakaoUser.getKakaoId());
             dto.setKakaoEmail(kakaoUser.getKakaoEmail() != null ? kakaoUser.getKakaoEmail() : "");
             dto.setGender("N");
             dto.setKeywords("");
             
            dao.insert(dto);
        }
    }

	@Override
	public LoginDTO findByKakaoId(Long kakaoId) {
		// TODO Auto-generated method stub
		return dao.findByKakaoId(kakaoId);
	}
	
}
