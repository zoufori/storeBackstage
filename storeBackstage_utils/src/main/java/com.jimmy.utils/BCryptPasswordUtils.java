package com.jimmy.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordUtils {

    static BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    public static String getEncoderPassword(String password) throws Exception{
        return bCryptPasswordEncoder.encode(password);
    }

}
