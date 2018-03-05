package com.service.impl;

import com.dao.UserDao;
import com.dao.VisitorDao;
import com.model.User;
import com.model.Visitor;
import com.service.UserService;
import org.omg.CORBA.Object;
import org.springframework.stereotype.Service;
import org.apache.log4j.Logger;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by lv on 17/7/3.
 */
@Service
//@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {
//    private Logger log = Logger.getLogger(UserServiceImpl.class);

    @Resource
    private UserDao userDao;

    @Resource
    private VisitorDao visitorDao;

    public User login(String Username, String Password) {
        return userDao.queryByAcc(Username,Password);
    }

    public void registered(String userAccount, String userPassword, String userName,
                           String userPhone, String userEmail, String userLocat, String userNum) {
        int i = userDao.selectHost(userNum,userName);
        if (i != 0){
            userDao.registered(userAccount,userPassword,userName,userPhone,userEmail,userLocat,userNum);
        }

    }

    //////查询数量
    //查询待处理数，agree=0
    public Integer pending(String host) {
        int agree = 0;
        return visitorDao.countByAgree(host,agree);
    }

    //查询拒绝，agree=-1
    public Integer refused(String host) {
        int agree = -1;
        return visitorDao.countByAgree(host,agree);
    }

    //查询同意的
    @Override
    public Integer pass(String host) {
        int agree = 1;
        return visitorDao.countByAgree(host,agree);
    }

    //查询所有来访申请数，
    public Integer countAll(String host) {
        return (pending(host) + pass(host) + refused(host));
    }

    //查询已经来访的人次
    public Integer visitedNum(String host) {
        int agree = 1;
        return visitorDao.countByAgree(host,agree);
    }


    //对来访的申请进行操作
    //通过申请，修改agree的值为1,自动添加彩码，并告知用户
    public Integer agree(String visitorName, String host, String visitTime) {
        int agree = 1;
        int maxCC = visitorDao.maxCC();
        System.out.println(maxCC);
        int colorCode = maxCC + 1;
        int check = visitorDao.agree(visitorName,host,visitTime,agree,colorCode);
        if (check != 0){
            return colorCode;
        }else {
            return 0;
        }
////        return visitorDao.agree(visitorName,host,visitTime,agree,0);
//        return maxCC;
    }

    @Override
    //拒绝申请，修改agree的值为-1
    public Integer disagree(String visitorName, String host, String visitTime) {
        int agree = -1;
        return visitorDao.disagree(visitorName,host,visitTime,agree);
    }

    //查询同意的人员信息
    public List<Visitor> queryAgree(String host){
        int agree = 1;
        return visitorDao.queryByAgree(host,agree);
    }

    @Override
    public List<Visitor> getPending(String host) {
        int agree = 0;
        return visitorDao.queryByAgree(host,agree);
    }

    @Override
    public List<String> queryByCC(String[] colorCode) {
        List<String> visitorNameList = new ArrayList<String>();
        if (colorCode != null){
            for (int j=0; j<colorCode.length;j++){
                String cc = colorCode[j];
                Visitor visitor = visitorDao.queryByCC(cc);
                visitorDao.addVisited(cc);
                String visitorName = visitor.getVisitorName();
                visitorNameList.add(visitorName);
            }
        }
        return visitorNameList;
    }

//    @Override
//    public Integer addCC(String visitorName, String visitTime, String host) {
//        int maxCC = visitorDao.maxCC();
//        int colorCode = maxCC + 1;
//        Integer flag = visitorDao.addCC(visitorName, visitTime, host, colorCode);
//        if (flag != 0){
//            return colorCode;
//        }else {
//            return flag;
//        }
//    }

    @Override
    public Integer addVisited(int colorCode) {
        return null;
    }
}
