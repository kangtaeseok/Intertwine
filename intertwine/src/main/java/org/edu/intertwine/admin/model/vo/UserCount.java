package org.edu.intertwine.admin.model.vo;

import javax.servlet.annotation.WebListener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.edu.intertwine.admin.model.service.AdminService;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

@WebListener
public class UserCount implements javax.servlet.http.HttpSessionListener {
	private static int todayVisitCount;

    public static int getTodayVisitCount() {
        return todayVisitCount;
    }

    public static void setTodayVisitCount(int count) {
        todayVisitCount = count;
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
        AdminService adminService = ctx.getBean("adminService", AdminService.class);
        if(session.isNew()){
        	VisitCount visitCount = adminService.selectVisitCount();
            if(visitCount == null) {
            	adminService.insertVisitCount();
                setTodayVisitCount(1);
            } else {
            	adminService.updateVisitCount();
                setTodayVisitCount(visitCount.getVisitCount() + 1);
            }
        }

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
    }
}
