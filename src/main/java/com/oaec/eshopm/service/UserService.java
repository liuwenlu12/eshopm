package com.oaec.eshopm.service;

import java.util.Map;

public interface UserService {

    /**
     * 登陆
     * @param username
     * @param password
     * @return
     */
    Map<String, Object> login(String username, String password);
    /**
     * 注册
     * @param username
     * @param password
     * @return
     */
    Map<String, Object> register(String username, String password,String telNumber);



    Map<String, Object> updatePassWord(Integer userId,String password,String telNumber,String newPassword);


    Boolean getUserName(String username);

    Boolean	getTelNumber(String username,String telNumber);

    Boolean forgetPassWord(String username,String password);

    Boolean UpdateUserAccountPicture(Integer userId,String img_url);

    Map<String, Object> getUserAccountPicture(Integer userId);

}
