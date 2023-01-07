package com.ipms.error;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice
public class ErrorController {
	
	// 배포 단계에서 적용시키기	
//	@ExceptionHandler(Exception.class)
//	public String error(Exception ex, Model model) {
//		log.error("Exception 발생 : {}", ex.getMessage());
//		model.addAttribute("msg","오류가 발생하였습니다.");
//		return "errors/errors";
//	}
//	
//	@ExceptionHandler(NoHandlerFoundException.class)
//	@ResponseStatus(value = HttpStatus.NOT_FOUND)
//	public String handle404(NoHandlerFoundException ex, Model model) {
//		log.error("404 요청 발생", ex.getRequestURL());
//		model.addAttribute("msg", "페이지가 존재하지 않습니다.");
//		return "errors/error404";
//	}
	
}
