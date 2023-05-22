package kr.co.di;

import org.springframework.context.annotation.Bean;

import javax.swing.*;

public class MessageEN implements IHello {

    public MessageEN() {
        System.out.println("MessageEN 호출");
    }

    //빈은 메소드 이름을 사용한다.
    @Bean
    @Override
    public void sayHello(String name) {
        JOptionPane.showMessageDialog(null, "Hello " + name + "!");
    }
}
