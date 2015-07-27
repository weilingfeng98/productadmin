package com.ny.b2b;


import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.net.MalformedURLException;

/**
 * Created by lingfeng on 15/7/22.
 */
public class MainClass {


    public static void main(String[] args) throws MalformedURLException {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(new String[]{
               "spring/applicationContext.xml",
                "spring/applicationContext-dubbo.xml",
                "spring/applicationContext-hessian.xml"
        });

    }

}