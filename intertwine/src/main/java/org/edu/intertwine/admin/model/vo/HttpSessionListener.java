package org.edu.intertwine.admin.model.vo;

import java.util.EventListener;

import javax.servlet.http.HttpSessionEvent;

public interface HttpSessionListener extends EventListener {
	    public void sessionCreated(HttpSessionEvent se);

	    public void sessionDestroyed(HttpSessionEvent se);
}
