package controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class NoHandlerFoundControllerAdvice {

//	@ExceptionHandler(NoHandlerFoundException.class)
//	public String handleNoHandlerFoundException() {
//
//		return "redirect:/error/error.jsp";
//	}
	  @ExceptionHandler(Exception.class)
	  public String notFoundHandler(Exception e) {
		  if(e instanceof NoHandlerFoundException) {
			  return "redirect:/error/error.jsp";
		  }
		 return "redirect:/error/error.jsp";
		 
	  }
}

