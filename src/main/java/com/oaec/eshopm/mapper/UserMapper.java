package com.oaec.eshopm.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    /**
     * 用户登录
     * @org.apache.ibatis.annotations.@param username 用户名
     * @Param"password@param password 密码
     * @return
     */
    Map<String,Object> queryByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    /**
     * 用户注册
     * @param username 用户名
     * @Param"password@param password 密码
     * @return
     */
    boolean doInsert(@Param("username") String username, @Param("password") String password,@Param("telNumber") String telNumber);

    Map<String,Object> queryByUsername(@Param("username") String username);


    Map<String,Object> queryByTelNumber(@Param("telNumber") String telNumber);

    Map<String,Object> queryByUserId(@Param("userId") Integer userId);

    Map<String,Object> queryTelNumberByUserId(@Param("userId") Integer userId);

    Map<String,Object> queryPassWordByUserId(@Param("userId") Integer userId);

    int updatePassWord(@Param("password") String password,@Param("userId") Integer userId);

    List<Map<String ,Object>> queryAllUserId();

    Map<String,Object>  queryUserName(@Param("username") String username);

    Map<String,Object>  queryTelNumberByUserNameAndTelNumber(@Param("username") String username,@Param("telNumber") String telNumber);

    int forgetUpdatePassWord(@Param("username") String username,@Param("password") String password);


}
