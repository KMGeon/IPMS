package com.ipms.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ipms.proj.task.service.TaskService;
import com.ipms.proj.task.vo.TaskVO;
import com.ipms.security.domain.CustomUser;
/**
 * 인터셉터를 설정하기 위해서  servlet-context에 아래를 추가후 진행
 * 클래스에는 HandlerInterceptorAdapter를 상속후
 * preHandle메소드는 접근 전에 체그한다. return true시 통과 시키고 false 페이지 접근을 막는다.
 * 
 * 	<interceptors>
		<interceptor>
           <mapping path="/proj/**"/>  /proj에 접근하는 모든 유저의 정보를 체크한다.
           <beans:bean id="commonInterceptor" class="com.ipms.aop.ProjInterceptor"/>
       </interceptor>
	</interceptors>
 * @author 이준혁
 *
 */
public class ProjInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	TaskService taskservice;
	/**
	 *  /proj 로 들어오는 모는 사용자를 검사
	 */
	@Override
	public boolean preHandle(
			HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {	
		String projId = request.getRequestURI().split("/")[2];
		boolean result = false;
		Authentication auth =  SecurityContextHolder.getContext().getAuthentication();
		
		if(auth.getPrincipal() instanceof CustomUser) {			
			CustomUser user =  (CustomUser) auth.getPrincipal();
			String memCode = user.getMember().getMemCode();
			TaskVO taskVO = new TaskVO();
			taskVO.setProjId(projId);
			taskVO.setMemCode(memCode);
			
			// 들어가는 프로젝트의 권한을 체크
			String[] authCheck = taskservice.authCheck(taskVO);
			
			if(authCheck.length > 0) {	//프로젝트에 참여한 상태
				result = true;
			}else { // 로그인은 했지만 프로젝트에 참여한 상태일때
				response.sendRedirect("/main/page");
				
			}
		}else {	//비로그인 상태일때
			response.sendRedirect("/main/page");
		}
		
		System.out.println("MyInterCeptor - preHandle"+" : "+projId);
		return result;
	}
	
	@Override
	public void postHandle(
			HttpServletRequest request, HttpServletResponse response,
			Object obj, ModelAndView mav)
			throws Exception {
		String projId = request.getRequestURI().split("/")[2];
		String result = "";
		
		Authentication auth =  SecurityContextHolder.getContext().getAuthentication();
		if(auth.getPrincipal() instanceof CustomUser) {			
			CustomUser user = (CustomUser) auth.getPrincipal();
			String memCode = user.getMember().getMemCode();
			TaskVO taskVO = new TaskVO();
			taskVO.setProjId(projId);
			taskVO.setMemCode(memCode);
			String[] authCheck = taskservice.authCheck(taskVO);
			
			//권한이 없을때
			if(authCheck.length < 1) {
				response.sendRedirect("/main/page");
			}
			
			for (String string : authCheck) {
				if(string.equals("ROLE_PROJECT_LEADER")) {
					result = "true";
				}else {
					result ="false";
				}
			}
			//leader 일때와 아닐떼 체크
			if(result.equals("true")) {
				request.setAttribute("leaderCheck", result);
			}else {
				request.setAttribute("leaderCheck", result);
			}
			
		}
		
	}
}
