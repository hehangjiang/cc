package com.service;

import com.model.User;

import java.util.Date;

/**
 * @Author: hhj
 * @Description:
 * @Date: Created in 2018-02-17
 */
public interface VisitorService {

    Integer application(String visitorName, String visitorPhone, String visitorEmail,
                         String host, String visitTime, String message, String visitorPic);

}
