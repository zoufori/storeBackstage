package com.jimmy.exception;

import org.springframework.security.web.authentication.session.SessionAuthenticationException;

public class ImageCodeException extends SessionAuthenticationException {

    public ImageCodeException(String msg){
        super(msg);
    }

}
