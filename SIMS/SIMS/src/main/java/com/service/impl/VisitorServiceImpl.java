package com.service.impl;

import com.dao.UserDao;
import com.dao.VisitorDao;
import com.model.Visitor;
import com.service.VisitorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @Author: hhj
 * @Description:
 * @Date: Created in 2018-02-17
 */

@Service
public class VisitorServiceImpl implements VisitorService{

    @Resource
    private VisitorDao visitorDao;

    @Resource
    private UserDao userDao;

    public VisitorServiceImpl() {
        super();
    }

    public Integer application(String visitorName, String visitorPhone, String visitorEmail,
                                String host, String visitTime, String message) {
        int agree = 0;
        int colorCode = 0;
        int visited = 0;
        Integer check = userDao.checkHost(host);
        if (check != 0){
            return visitorDao.application(visitorName,visitorPhone,visitorEmail,host,visitTime, message,
                                            agree,colorCode,visited);
        }else {
            return 0;
        }

    }


}
