package kr.co.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ClassPathXmlApplicationContext;
public class HelloSpringbean {
    public static void main(String[] args) {
        //구성 정보(Config)를 매개값으로 넣어줌
        ApplicationContext context = new AnnotationConfigApplicationContext(MessageEN.class);

        IHello hello = null;
        hello = (IHello) context.getBean("msgEN"); //스프링 빈 객체 생성
        hello.sayHello("TOM");

    }
}
