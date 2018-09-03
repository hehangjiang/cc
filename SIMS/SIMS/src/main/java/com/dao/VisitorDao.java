package com.dao;

import com.model.Visitor;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @Author: hhj
 * @Description:
 * @Date: Created in 2018-02-17
 */

@Repository
public interface VisitorDao {

    Integer application(@Param("visitorName") String visitorName, @Param("visitorPhone") String visitorPhone,
                        @Param("visitorEmail") String visitorEmail, @Param("host") String host,
                        @Param("visitTime") String visitTime, @Param("message") String message,
                        @Param("agree") int agree, @Param("colorCode") int colorCode, @Param("visited") int visited, @Param("visitorPic") String visitorPic);

    Integer countByAgree(@Param("host") String host, @Param("agree") Integer agree);

    Visitor countByTime(@Param("host") String host, @Param("visitorTime") String visitTime);

    Integer agree(@Param("visitorName") String visitorName, @Param("host") String host,
                  @Param("visitTime") String visitTime, @Param("agree") int agree, @Param("colorCode") int colorCode);

    Integer disagree(@Param("visitorName") String visitorName, @Param("host") String host,
                  @Param("visitTime") String visitTime, @Param("agree") int agree);

    List<Visitor> queryByAgree(@Param("host") String host, @Param("agree") int agree);

    Visitor queryByCC(@Param("colorCode") String colorCode);

//    Integer addCC(@Param("visitorName") String visitorName, @Param("visitTime") String visitTime,
//                  @Param("host") String host, @Param("colorCode") int colorCode);

    Integer addVisited(@Param("colorCode") String colorCode);

    int maxCC();
}
