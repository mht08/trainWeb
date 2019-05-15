package cn.train.aop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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
public class ApiMonitor {

	private static Logger logger = Logger.getLogger(ApiMonitor.class);

	@Pointcut("execution(* cn.train.controller.*.*(..))")
	private void pointCutMethod() {
	}

//	// 声明前置通知
//	@Before("pointCutMethod()")
//	public void doBefore() {
//		logger.info("前置通知");
//	}
//
//	// 声明后置通知
//	@AfterReturning(pointcut = "pointCutMethod()", returning = "result")
//	public void doAfterReturning(String result) {
//		logger.info("后置通知");
//		logger.info("---" + result + "---");
//	}
//
//	// 声明例外通知
//	@AfterThrowing(pointcut = "pointCutMethod()", throwing = "e")
//	public void doAfterThrowing(Exception e) {
//		logger.info("例外通知");
//		logger.info(e.getMessage());
//	}
//
//	// 声明最终通知
//	@After("pointCutMethod()")
//	public void doAfter() {
//		logger.info("最终通知");
//	}

	// 声明环绕通知
	@Around("pointCutMethod()")
	public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
		logger.info("进入方法---环绕通知");
		Object result = null;
		String targetName = pjp.getTarget().getClass().getSimpleName();
		String methodName = pjp.getSignature().getName();
		logger.info("----------------执行方法-----------------");
		logger.info("类名：" + targetName + " 方法名：" + methodName);
		
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		HttpServletRequest request = sra.getRequest();
		HttpServletResponse response = sra.getResponse();
		
		if(!targetName.equals("LoginController") && !methodName.equals("login") && !methodName.equals("index")) {
			
			
			HttpSession session = request.getSession();
			Object userObj = session.getAttribute("user");
			if (userObj != null) {
				result = pjp.proceed();
			} else {
				if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase( "XMLHttpRequest")) {
					// ajax处理
					response.addHeader("sessionstatus", "timeout");
					response.setContentType("utf-8");
					// 解决EasyUi问题
					PrintWriter po  = response.getWriter();
					po.print("{\"rows\":[],\"success\":false,\"total\":0}");
					po.flush();
					po.close();
				} else {
					// http跳转处理
					String path = request.getContextPath();    
			        String basePath = request.getScheme() + "://" + request.getServerName()  + ":" + request.getServerPort() + path + "/";    
			        response.sendRedirect(basePath + "index.html");   
				}
			}
		} else {
			result = pjp.proceed();
		}
		logger.info("退出方法---环绕通知");
		return result;
	}
}