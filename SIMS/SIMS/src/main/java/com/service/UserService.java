package com.service;

import com.model.User;
import com.model.Visitor;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
/**
 * Created by lv on 17/7/17.
 */

public interface UserService {

    //用户登录
    User login(String userAccount, String Password);

    //用户注册
    void registered(String userAccount,String userPassword, String userName,String userPhone,String userEmail,
                    String userLocat,String userNum);

    //待处理人数
    Integer pending(String host);

    //查询总申请人数
    Integer countAll(String host);

    //查询来访人数
    Integer visitedNum(String host);

    //查询拒绝人数
    Integer refused(String host);

    //查询同意人数
    Integer pass(String host);

    //通过申请
    Integer agree(String visitorName, String host, String visitTime);

    //拒绝申请
    Integer disagree(String visitorName, String host, String visitTime);

    //根据是否同意获取列表
    List<Visitor> queryAgree(String host);

    //获取还未处理的申请
    List<Visitor> getPending(String host);

    //根据彩码查找访客，输出姓名
    List<String> queryByCC(String[] colorCode);

//    //添加彩码
//    Integer addCC(String visitorName, String visitTime, String host);

    //来访后修改访问状态
    Integer addVisited(int colorCode);




//    //根据访客的访问目标查找是否有此人
//    User checkHost(String userName);

    //修改密码，暂时不写
//    User resetPassword(String userAccount,String userPassword);


//    List<User> getAllUser();
//
//    User getUserByPhoneOrEmail(String emailOrPhone, Short state);
//
//    User getUserById(int userId);
//
//
//
//    User studentLogin(String Username, String Password);
//
//    int selectRoleMenu(String ID, String Url);
}
