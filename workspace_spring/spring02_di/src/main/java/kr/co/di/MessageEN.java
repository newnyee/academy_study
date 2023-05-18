package kr.co.di;

import javax.swing.*;

public class MessageEN implements IHello {

    public MessageEN() {
        System.out.println("MessageEN 호출");
    }

    @Override
    public void sayHello(String name) {
        JOptionPane.showMessageDialog(null, "Hello " + name + "!");
    }
}
