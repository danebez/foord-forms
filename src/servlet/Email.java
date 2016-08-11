package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Email {

	private static Properties props = new Properties();

	static {
		InputStream in = Email.class.getClassLoader().getResourceAsStream(
				"/config.properties");
		try {
			props.load(in);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void sendEmail(String filePath, String subject, String to,
			String fileName) {

		Properties properties = new Properties();
		props.put("mail.smtp.connectiontimeout", 10000);
		props.put("mail.smtp.host", props.getProperty("email.smtp.host"));
		props.put("mail.smtp.port",
				Integer.valueOf(props.getProperty("email.smtp.port")));

		String mode = props.getProperty("mode");
		Authenticator auth = null;

		if (mode.equalsIgnoreCase("dev")) {
			properties.put("mail.smtp.auth",
					props.getProperty("email.smtp.auth"));
			properties.put("mail.smtp.starttls.enable",
					props.getProperty("email.smtp.starttls.enable"));

			auth = new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(
							props.getProperty("email.smtp.username"),
							props.getProperty("email.smtp.password"));
				}
			};
		}

		Transport transport = null;
		Session session = Session.getDefaultInstance(properties, auth);

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(props.getProperty("email.from")));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(
					to));
			message.setSubject(subject);
			message.setSentDate(new Date());

			//
			// Set the email message text.
			//
			MimeBodyPart messagePart = new MimeBodyPart();
			messagePart.setText("");

			//
			// Set the email attachment file
			//
			MimeBodyPart attachmentPart = new MimeBodyPart();
			FileDataSource fileDataSource = new FileDataSource(filePath) {
				@Override
				public String getContentType() {
					return "application/octet-stream";
				}
			};
			attachmentPart.setDataHandler(new DataHandler(fileDataSource));
			attachmentPart.setFileName(fileName);

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messagePart);
			multipart.addBodyPart(attachmentPart);

			message.setContent(multipart);

			if (mode.equalsIgnoreCase("dev")) {
				transport = session.getTransport("smtps");
				transport.connect(props.getProperty("email.smtp.host"),
						Integer.valueOf(props.getProperty("email.smtp.port")),
						props.getProperty("email.smtp.username"),
						props.getProperty("email.smtp.password"));
				
				transport.sendMessage(message, message.getAllRecipients());
				
			} else {
				Transport.send(message, message.getAllRecipients());
			}

		} catch (MessagingException e) {
			e.printStackTrace();

		} finally {
			try {
				if (mode.equalsIgnoreCase("dev")) {
					transport.close();
				}

			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	}
}
