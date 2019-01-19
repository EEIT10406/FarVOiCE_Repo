package controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class NoHandlerFoundControllerAdvice {

	@ExceptionHandler(NoHandlerFoundException.class)
	public String handleNoHandlerFoundException(Exception ex) {

		return "redirect:/error/error.jsp";
	}

}

