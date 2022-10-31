package com.example.demo;

import com.linyes.DemoApplication;
import com.linyes.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = DemoApplication.class)
public class BTest {
    @Autowired
    UserService userService;
    @Test
    public void test(){
        System.out.println(userService);
    }
}
