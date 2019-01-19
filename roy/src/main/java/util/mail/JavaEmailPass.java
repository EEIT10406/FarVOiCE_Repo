package util.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class JavaEmailPass implements Runnable
{	 
	private String email;// 收件人邮箱
	private String userAccount;
	private String userPassword;
	
  
	public JavaEmailPass(String email, String userAccount, String userPassword) {
		super();
		this.email = email;
		this.userAccount = userAccount;
		this.userPassword = userPassword;
	}

	Session mailSession;
    
	public void run() {
		
		try {
			setMailServerProperties();
			draftEmailMessage();
			sendEmail();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
    public static void main(String args[]) throws AddressException, MessagingException
    {
//        JavaEmailTest javaEmail = new JavaEmailTest();
//        javaEmail.setMailServerProperties();
//        javaEmail.draftEmailMessage();
//        javaEmail.sendEmail();
    }
 
    private void setMailServerProperties()
    {
        Properties emailProperties = System.getProperties();
        emailProperties.put("mail.smtp.port", "587");
        emailProperties.put("mail.smtp.auth", "true");
        emailProperties.put("mail.smtp.starttls.enable", "true");
        mailSession = Session.getDefaultInstance(emailProperties, null);
    }
 
    private MimeMessage draftEmailMessage() throws AddressException, MessagingException
    {
        String[] toEmails = { email };
        String emailSubject = "FarVOiCE新密碼";
        String emailBodyPass = "This is an email sent by FarVOiCE. <br>" +
        						"Your Account : " + userAccount + "<br>" +
        						"Your New Password : " + userPassword + "<br>";
        MimeMessage emailMessage = new MimeMessage(mailSession);
        /**
         * Set the mail recipients
         * */
        for (int i = 0; i < toEmails.length; i++)
        {
            emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
        }
        emailMessage.setSubject(emailSubject);
        /**
         * If sending HTML mail
         * */
        emailMessage.setContent(emailBodyPass, "text/html;charset=UTF-8");
        /**
         * If sending only text mail
         * */
        //emailMessage.setText(emailBody);// for a text email
        return emailMessage;
    }
 
    private void sendEmail() throws AddressException, MessagingException
    {
        /**
         * Sender's credentials
         * */
        String fromUser = "farvoiceeeit104@gmail.com";
        String fromUserEmailPassword = "royroyroy13579";
 
        String emailHost = "smtp.gmail.com";
        Transport transport = mailSession.getTransport("smtp");
        transport.connect(emailHost, fromUser, fromUserEmailPassword);
        /**
         * Draft the message
         * */
        MimeMessage emailMessage = draftEmailMessage();
        /**
         * Send the mail
         * */
        transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
        transport.close();
        System.out.println("Email sent successfully.");
    }
}
