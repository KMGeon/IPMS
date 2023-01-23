package com.ipms.main.mail;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Map;

@Slf4j
@Controller
public class MailController {
    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/sendMail")
    public String sendMail() {
        return "main/login/sendMail";
    }

    @PostMapping("/sendMail")
    public String sendMail2() {
        return "main/login/sendMail";
    }

    @PostMapping("/sendMailProcess")
    public  @ResponseBody  String sendMailProcess(@RequestParam Map<String, String> map  , Model model)  throws MessagingException {
        log.info("map : " + map);
        String subject = map.get("subject");
        String text = map.get("text");
        String from = map.get("from");
        String to = map.get("to");

        model.addAttribute("text2",text);
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mail, true,
                    "UTF-8"); // true : 멀티파트 메시지를 사용하겠다는 의미
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text, true); // true : html을 사용하겠다는 의미
            mailSender.send(mail);
            log.info("메일 전송 완료"); // lombok을 사용한 부분
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return "redirect:/main/page";
    }
}