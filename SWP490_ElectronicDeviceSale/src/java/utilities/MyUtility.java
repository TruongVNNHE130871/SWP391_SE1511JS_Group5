/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-21        1.0         TruongVNN         First Implement
 */
package utilities;

import controller.user.ForgetPasswordController;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ASUS
 */
public class MyUtility {
    public void sendNewPasswordToEmail(String recepient,String randomPassword){
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");       
        String myAccountEmail = "truongvnnhe130871@fpt.edu.vn";
        String password = "vnnt1999";
        Session session = Session.getInstance(properties, new Authenticator(){
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(myAccountEmail,password);
            }
        });       
        Message message = prepareMessage(session,myAccountEmail,recepient,randomPassword);
        try {
            Transport.send(message);
        } catch (MessagingException ex) {
            Logger.getLogger(ForgetPasswordController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private Message prepareMessage(Session session, String myAccountEmail, String recepient, String randomPassword)  {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject("forgetPassword");            
            message.setText("Your account password has been set to: " + randomPassword);
            return message;
        } catch (Exception ex) {
            Logger.getLogger(ForgetPasswordController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public String randomToken(){
        Random random = new Random();
        String result ="";
        for(int index=0;index<8;index++){
            result+= random.nextInt(9);            
        }        
        return result;
    }
}
