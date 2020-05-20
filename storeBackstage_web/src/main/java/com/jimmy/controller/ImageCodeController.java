package com.jimmy.controller;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

@RestController
public class ImageCodeController {

    @Autowired
    DefaultKaptcha captchaProducer;

    @RequestMapping("/imageCode.do")
    public void imageCode(HttpSession session, HttpServletResponse response) throws IOException{
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");

        String key = captchaProducer.createText();

        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, key);

        System.out.println(key);

        try(ServletOutputStream out = response.getOutputStream()){
            BufferedImage bufferedImage = captchaProducer.createImage(key);
            ImageIO.write(bufferedImage,"jpg",out);
            out.flush();
        }

    }

}
