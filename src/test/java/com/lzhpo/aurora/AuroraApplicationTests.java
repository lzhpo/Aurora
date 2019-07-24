package com.lzhpo.aurora;

import io.github.biezhi.ome.OhMyEmail;
import io.github.biezhi.ome.SendMailException;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.security.GeneralSecurityException;

import static io.github.biezhi.ome.OhMyEmail.SMTP_QQ;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AuroraApplicationTests {

    @Before
    public void before() throws GeneralSecurityException {
        // 配置，一次即可
        OhMyEmail.config(SMTP_QQ(true), "lzhpo@qq.com", "");
    }

    /**
     * HTML邮件
     */
    @Test
    public void testSendHtml() throws SendMailException {
        OhMyEmail.subject("HTML邮件测试")
                .from("会打篮球的程序猿")
                .to("760613041@qq.com")
                .html("<h1>信件内容</h1>")
                .send();
    }

    /**
     * HTML+附件
     */
    @Test
    public void testSendAttach() throws SendMailException {
        OhMyEmail.subject("HTML邮件测试")
                .from("会打篮球的程序猿")
                .to("760613041@qq.com")
                .html("<h1>信件内容</h1>")
                .attach(new File("E:\\picture\\lzhpo.png"))
                .send();
    }

}
