package kr.co.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloSpringbean {
    public static void main(String[] args) {

        ApplicationContext context = new ClassPathXmlApplicationContext("springbean.xml");

        IHello hello = null;
        hello = (IHello) context.getBean("msgEN"); //스프링 빈 객체 생성
        hello.sayHello("TOM");

    }
}
