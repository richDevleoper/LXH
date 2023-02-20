package kr.freedi.dev.common.util;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


@Service
public class MailUtil {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendMessage(String to, String from, String subject, String data) throws MessagingException {
		
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg);
		
		helper.setTo(to);
		helper.setFrom(from);
		helper.setSubject(subject);
		helper.setText(data, true);
		
		mailSender.send(msg);
	}

	public void sendMailAttatchFile(String to, String from, String subject,
			String content, File f) throws MessagingException, UnsupportedEncodingException {
		
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, true, "euc-kr");
		
		helper.addAttachment(MimeUtility.encodeText(f.getName(), "euc-kr", "B"), f);
		

		helper.setTo(to);
		helper.setFrom(from);
		helper.setSubject(subject);
		helper.setText(content, true);
		
		mailSender.send(msg);
		
	}
}
