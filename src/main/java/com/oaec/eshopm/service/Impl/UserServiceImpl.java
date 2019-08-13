package com.oaec.eshopm.service.Impl;

import com.alibaba.fastjson.JSON;
import com.oaec.eshopm.mapper.UserMapper;
import com.oaec.eshopm.mapper.UserPictureMapper;
import com.oaec.eshopm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserPictureMapper userPictureMapper;

    @Override
    public Map<String, Object> login(String username, String password) {
        Map<String, Object> map = userMapper.queryByUsername(username);
        if(map==null){
            map = new HashMap<>();
            map.put("error", "用户名不存在");
        }else{
            if(map.get("password").equals(password)){
                map.put("user",map);
                return map;
            }else{
                map.clear();
                map.put("error", "密码错误");
            }
        }
        return map;
    }

    @Override
    public Map<String, Object> register(String username, String password, String telNumber) {


        Map<String, Object> map = userMapper.queryByUsername(username);
        Map<String, Object> telMap = userMapper.queryByTelNumber(telNumber);
        if(map!=null){
            map.put("error", "用户名已存在");


        }else if(telMap!=null){

            map = new HashMap<>();
            map.put("error", "电话号码已存在");

        }else{
            map = new HashMap<>();
            boolean doInsert = userMapper.doInsert(username, password,telNumber);
            map.put("success", doInsert);
        }
        return map;
    }

    @Override
    public Map<String, Object> updatePassWord(Integer userId, String password, String telNumber, String newPassword) {
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> passMap = userMapper.queryPassWordByUserId(userId);
        Map<String, Object> telMap = userMapper.queryTelNumberByUserId(userId);
        if(!passMap.get("password").equals(password)){
            map.put("error","输入原密码不正确");
            return map;
        }else if(!telMap.get("tel_number").equals(telNumber)){
            map.put("error","输入号码不正确");
            return map;
        }else{

            int i = userMapper.updatePassWord(newPassword, userId);
            if(i==1){
                map.put("success", "成功");
            }else{
                map.put("error","修改失败");
            }
        }

        return map;
    }

    @Override
    public Boolean getUserName(String username) {
        if(userMapper.queryUserName(username)!=null){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public Boolean getTelNumber(String username, String telNumber) {
        Map<String, Object> map = userMapper.queryTelNumberByUserNameAndTelNumber(username, telNumber);
        if(map!=null){
            String tel_number = map.get("tel_number").toString();
            if(tel_number.equals(telNumber)){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    @Override
    public Boolean forgetPassWord(String username, String password) {

        return userMapper.forgetUpdatePassWord(username,password)==1;

    }

    @Override
    public Boolean UpdateUserAccountPicture(Integer userId, String img_url) {
        Map<String, Object> param = new HashMap<>();
        param.put("userId",userId);
        param.put("img_url",img_url);
        Map<String, Object> userMap = userPictureMapper.queryByUserId(userId);
        Boolean result ;
        if(userMap!=null){
            result =  userPictureMapper.doUpdate(param);
        }else{
            result =  userPictureMapper.doInsert(param);
        }
        return result;
    }

    @Override
    public Map<String, Object> getUserAccountPicture(Integer userId) {
        return userPictureMapper.queryByUserId(userId);
    }
}
