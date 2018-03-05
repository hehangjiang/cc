package com.dao;

import com.model.User;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.Object;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lv on 17/7/3.
 */
@Repository
public interface UserDao {

    //登录,也可以确认用户密码是否正确，在修改密码时先确认
    User queryByAcc(@Param("userAccount") String Username, @Param("userPassword") String Password);

    //确认host里面是否有这个用户
    Integer selectHost(@Param("userNum") String userNum,@Param("userName") String userName);

    //用户注册
    Integer registered(@Param("userAccount") String userAccount,@Param("userPassword") String userPassword,
               @Param("userName") String userName,@Param("userPhone") String userPhone,@Param("userEmail") String userEmail,
               @Param("userLocat") String userLocat,@Param("userNum") String userNum);

    //访客来访时检查是否存在住户
    Integer checkHost(@Param("userName") String userName);

    //修改密码
//    User resetPassword(@Param("userAccount") String userAccount,@Param("userPassword") String userPassword);


//    User selectUserById(@Param("userId") int userId);
//
//    User selectUserByPhoneOrEmail(@Param("emailOrPhone") String emailOrPhone, @Param("state") Short state);
//
//    List<User> selectAllUser();
//
//
//
//    User studentLogin(@Param("Username") String Username, @Param("Password") String Password);
//
//    int selectRoleMenu(@Param("ID") String ID, @Param("url") String Url);

}
