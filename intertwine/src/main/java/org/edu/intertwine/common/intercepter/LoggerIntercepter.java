package org.edu.intertwine.common.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@SuppressWarnings("deprecation")
public class LoggerIntercepter extends HandlerInterceptorAdapter {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		//DispatcherServlet 에서 Controller 가기 전에 구동됨
		
		if(logger.isDebugEnabled()) {
			logger.info("======== START ========");
			logger.info(request.getRequestURI());
			logger.info("======== END =======");
		}
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler, ModelAndView modelAndView) throws Exception {
		//Controller 에서 리턴되어 뷰리졸버로 가기 전에 구동됨
		super.postHandle(request, response, handler, modelAndView);
		
		if(logger.isDebugEnabled()) {
			logger.info("======== View ========");
		}
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
			Object handler, Exception ex) throws Exception {
		//뷰리졸버가 뷰를 찾아서 내보내고 난 다음에 구동됨
		if(logger.isDebugEnabled()) {
			logger.info("======== END ========");
		}
		
		super.afterCompletion(request, response, handler, ex);
	}
}













