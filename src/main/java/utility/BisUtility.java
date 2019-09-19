package utility;

import java.util.Properties;
import java.util.StringTokenizer;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;

public class BisUtility {
    static Logger logger = Logger.getLogger(BisUtility.class.getSimpleName());

    public BisUtility() {
        super();
    }

    public static StringBuffer generateStudentId(String strStdFirstName, String strStdLastName, String strMotFirstName, String strFatFirstName, String strStdDob) {
        StringBuffer sbStdId = new StringBuffer();
        StringBuffer sbDob = null;

        try {
            if (strStdFirstName != null && (strStdFirstName.trim().equalsIgnoreCase(""))) {
                sbStdId.append(strStdFirstName.substring(0, 2));
            } else {
                logger.error("Failed to generate student id: Invalid first name");
            }
            if (strStdLastName != null && (strStdLastName.trim().equalsIgnoreCase(""))) {
                sbStdId.append(strStdLastName.substring(0, 2));
            } else {
                logger.error("Failed to generate student id: Invalid last name");
            }
            if (strMotFirstName != null &&
                    (strMotFirstName.trim().equalsIgnoreCase(""))) {
                sbStdId.append(strMotFirstName.substring(0, 2));
            } else {
                logger.error("Failed to generate student id: Mother’s first name is invalid");
            }
            if (strFatFirstName != null &&
                    (strFatFirstName.trim().equalsIgnoreCase(""))) {
                sbStdId.append(strFatFirstName.substring(0, 2));
            } else {
                logger.error("Failed to generate student id: Father’s first name is invalid");
            }
            if (strStdDob != null && (strStdDob.trim().equalsIgnoreCase(""))) {
                StringTokenizer sTokenizer = new StringTokenizer(strStdDob, "-");
                String strYear = sTokenizer.nextToken();
                String strMonth = sTokenizer.nextToken();
                String strDay = sTokenizer.nextToken();
                sbDob = new StringBuffer();
                sbDob.append(strDay);
                sbDob.append(strMonth);
                sbDob.append(strYear);

                if (sbDob.length() == 8) {
                    sbStdId.append(sbDob);
                } else {
                    logger.error("Failed to generate student id: Invalid date of Birth");
                }
            } else {
                logger.error("Failed to generate student id: Invalid date of Birth");
            }
            if (sbStdId.length() != 16) {
                logger.error("Failed to generate student id: inappropiate size");
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            sbStdId = null;
        }
        return sbStdId;
    }

    public static void sendMail(String strSub, String strText) {
        String strTo = "yousuf.baig@gmail.com";
        String strFrom = "yousuf.baig@yahoo.com";
        String strHost = "localhost";
        int inPort = 25;
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", strHost);
        properties.put("mail.smtp.auth", "false");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", inPort);
        Session session = Session.getDefaultInstance(properties);

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(strFrom));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(strTo));
            message.setSubject(strSub);
            message.setText(strText);
            Transport.send(message);
        } catch (MessagingException e) {
            logger.error(e.getMessage());
        }
    }
}
