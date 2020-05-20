package com.jimmy.filter;

import com.jimmy.exception.ImageCodeException;
import com.jimmy.exception.MyAuthenticationFailureHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;
import com.google.code.kaptcha.Constants;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class ImageCodeFilter extends OncePerRequestFilter {

    @Autowired
    private MyAuthenticationFailureHandler authenticationFailureHandler;

    public void setAuthenticationFailureHandler(MyAuthenticationFailureHandler authenticationFailureHandler) {
        this.authenticationFailureHandler = authenticationFailureHandler;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        if(request.getRequestURI().contains("/login.do") && request.getMethod().equalsIgnoreCase("post")){
            String key = (String)request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
            String imageCode = request.getParameter("imageCode");
            try {
                if (StringUtils.isEmpty(imageCode.trim())) {
                    String msg = "请输入验证码";
                    HttpSession session = request.getSession();
                    session.setAttribute("msg", msg);
                    throw new ImageCodeException(msg);
                }
                if (!imageCode.trim().equalsIgnoreCase(key)) {
                    String msg = "验证码不正确";
                    HttpSession session = request.getSession();
                    session.setAttribute("msg", msg);
                    throw new ImageCodeException(msg);
                }
                HttpSession session = request.getSession();
                session.setAttribute("msg", "用户名或密码不正确");
            }catch (AuthenticationException e){
                authenticationFailureHandler.onAuthenticationFailure(request, response, e);
                return;
            }

        }
        filterChain.doFilter(request, response);
    }
}
