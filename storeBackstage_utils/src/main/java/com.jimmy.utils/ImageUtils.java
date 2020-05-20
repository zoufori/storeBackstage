package com.jimmy.utils;


import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.File;
import java.util.UUID;

public class ImageUtils {

    public static String imageChange(String path,String fileName, int width, int height) throws Exception {
        // TODO Auto-generated method stub
        BufferedInputStream in = new BufferedInputStream(new FileInputStream(path+"/"+fileName));
        // 字节流转图片对象
        Image bi = ImageIO.read(in);
        // 构建图片流
        BufferedImage tag = new BufferedImage(width , height , BufferedImage.TYPE_INT_RGB);
        // 绘制改变尺寸后的图
        boolean m = tag.getGraphics().drawImage(bi, 0, 0, width , height , null);
        System.out.println(m);
        // 输出流
        String date = DateUtils.getDateNowStr("yyyyMMdd");
        String modifyfileName = UUID.randomUUID().toString() + date;
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        modifyfileName += suffix;

        File out = new File(path,modifyfileName);
        out.createNewFile();
        boolean n = ImageIO.write(tag, "jpg", out);
        System.out.println(n);
        in.close();
        return modifyfileName;
    }

}
