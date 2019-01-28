package controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class NoHandlerFoundControllerAdvice {

	@ExceptionHandler(NoHandlerFoundException.class)
	public String handleNoHandlerFoundException(Exception ex) {

		return "redirect:/error/error.jsp";
	}
//	 @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	  @ExceptionHandler(Exception.class)
	  public String notFoundHandler() {
		 return "redirect:/error/error.jsp";
		 
	  }
}

