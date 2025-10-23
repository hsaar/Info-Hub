package com.infohub.project.customizedservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohub.project.login.LoginDTO;
import com.infohub.project.login.LoginService;

@Service
public class CustomizedServiceImpl implements CustomizedService {

    @Autowired
    private CustomizedDAO dao;
    
    @Autowired 
    private LoginService loginService;
    
    
    @Override
    public List<CustomizedDTO> getDeadlineAlerts(String userId) throws Exception {
        LoginDTO loginDTO = loginService.getUserById(userId); 
        if (loginDTO == null) {
            throw new Exception("유효하지 않은 사용자 ID입니다.");
        }
        int loginNo = loginDTO.getLoginNo();
        
        return dao.selectDeadlineImminentBenefits(loginNo);
    }
    
}