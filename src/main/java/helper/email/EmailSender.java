/**
 * Credit: Naveen from youtube
 * */

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * https://www.google.com/settings/security/lesssecureapps
 */

package helper.email;

import java.security.Security;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {
    public static void sendEmail(Sender sender, Email email, String... emailAddresses) {
	try {
	    String host = "smtp.gmail.com";
	    String user = sender.getUser();
	    String pass = sender.getPass();
//			String to = student.getEmail();
	    String from = sender.getUser();
	    String subject = email.getSubject();
	    String messageText = email.getContent();
	    boolean sessionDebug = false;

	    Properties props = System.getProperties();

	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.port", "587");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.required", "true");

	    java.security.Security.addProvider(Security.getProvider("SunJCE"));
	    Session mailSession = Session.getDefaultInstance(props, null);
	    mailSession.setDebug(sessionDebug);

	    MimeMessage msg = new MimeMessage(mailSession);
	    msg.setHeader("Content-Type", "text/plain; charset=UTF-8");
	    msg.setFrom(new InternetAddress(from));

	    InternetAddress[] mailAddress_TO = new InternetAddress[emailAddresses.length];

	    for (int i = 0; i <= emailAddresses.length - 1; i++) {
		mailAddress_TO[i] = new InternetAddress(emailAddresses[i]);
	    }
	    msg.addRecipients(Message.RecipientType.TO, mailAddress_TO);
//            InternetAddress[] address = {new InternetAddress(to)};
//            msg.setRecipients(Message.RecipientType.TO, address);
	    msg.setSubject(subject, "UTF-8");
	    msg.setSentDate(new Date());
	    msg.setText(messageText, "UTF-8", "html");

	    Transport transport = mailSession.getTransport("smtp");
	    transport.connect(host, user, pass);
	    transport.sendMessage(msg, msg.getAllRecipients());
	    transport.close();
	} catch (Exception ex) {
	    System.out.println(ex);
	}
    }
}
