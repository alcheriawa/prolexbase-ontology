package fr.li.spring.mvc.exception;

public class CustomException extends Exception {

	private static final long serialVersionUID = -403399842202562951L;

	public CustomException(Exception cause) {
		super(cause);
	}

	public CustomException(String cause) {
		super(cause);
	}

	public CustomException(String msg, Throwable cause) {
		super(msg, cause);
	}
}