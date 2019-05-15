package cn.train.aop;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
 

//@Aspect
//@Component
public class SysLogWithOutAnn {
	private static Logger logger = Logger.getLogger(ApiMonitor.class);
 
 
	@Pointcut("execution(* cn.train.controller.*.*(..))") 
	public void searchControllerCall() {
	}

	@Around("searchControllerCall()")
    public Object test(ProceedingJoinPoint jp) throws Throwable{
		
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        HttpServletRequest request = sra.getRequest();
        
        HttpServletResponse response = sra.getResponse();
        
        String path = request.getContextPath();    
        String basePath = request.getScheme() + "://" + request.getServerName()    
                + ":" + request.getServerPort() + path + "/";    
        response.sendRedirect(basePath + "index.html");   
        
        // 验证失败
//        Map<String,String> returnMap = new HashMap<String,String>();
//        returnMap.put("errorCode", errorCode);
//        returnMap.put("errorMsg", errorMsg);
//        response.setContentType("text/html; charset=utf-8");  
//        PrintWriter out = response.getWriter();   
//        out.write(JSONUtils.write(returnMap));
//        out.flush();
//        out.close();
        return null;
    }
	
 
}
