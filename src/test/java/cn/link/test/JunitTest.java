package cn.link.test;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class JunitTest extends AbstractJUnit4SpringContextTests {

    // 需要在测试中添加包扫描
//    @Autowired
//    TaskService taskService;

    @org.junit.Test
    public void addTask() {

    }

}
