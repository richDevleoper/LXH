package kr.freedi.dev.common.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import laf.application.mail.LMail;
import laf.application.mail.LMailException;
import laf.core.exception.LSysException;
import laf.core.log.LLog;
import laf.support.collection.LMultiData;


public class SendMailUtil {

/**
 * 복수의 발송자와 복수의 수신자
 *
 * @param sender 보내는사람 LMultiData
 * @param senderKeyName 보내는 사람의 LMultiData key 값
 * @param reciver 받는사람 LMultiData
 * @param reciverKeyName 받는사람 LMultiData key 값
 * @param title 제목
 * @param content 내용
 * @throws LSysException
 *
 * C20190722_46655, 20190722, a링크수정
 */
    public static void SendMultiMail(LMultiData sender,String senderKeyName, LMultiData reciver, String reciverKeyName, String title, String content) throws LSysException  {
        try {
            String senderStr = "";
            String[] reciverarray = new String[reciver.keySize()];

            for( int ii = 0 ; ii < sender.keySize( senderKeyName ) ; ii++ ) {
                senderStr += ", "+reciver.getString( senderKeyName, ii);
            }
            senderStr = senderStr.substring(2);
            System.out.println("보내는 사람 = "+ senderStr.toString() );

            for( int ii = 0 ; ii < reciver.keySize(reciverKeyName) ; ii++ ) {
                reciverarray[ii] += ", "+reciver.getString(reciverKeyName, ii);
            }


            LMail mail = new LMail();
            mail.setToMailAddress  ( reciverarray );
            mail.setFromMailAddress( senderStr    );

            mail.printCurrentConfigInfo();

            mail.setSubject ( title     );
            mail.setHtml    ( content   );

            mail.send();

        } catch ( LMailException e) {
            throw new LSysException(e.getMessage(), e.getCause());
        }

    }


    /**
    * 메일을 보낸다.
     *
     * @param sender 보내는 사람 이메일주
     * @param string 받는 사람 이메일주
     * @param ccAddr 참조자
     * @param bccAddr 참조자
     * @param title 제목
     * @param content 내용
     * @throws LSysException
     */
    public static int SendToMail(String sender, String string, String[] ccAddr, String[] bccAddr,
                                  String title , String orgTitle ,String content , String mailGb ) throws LSysException  {
        try {

            LMail mail = new LMail();
            mail.setToMailAddress   (string );
            mail.setFromMailAddress (sender  );
            mail.setCcMailAddress   (ccAddr  );
            mail.setBccMailAddress  (bccAddr );

            String linkcontent = "";
            if ( "PC".equals(mailGb) ) {
                linkcontent = content;
            } else if ( "APP_FINISH".equals(mailGb) ) {
                linkcontent = "[전자결재] (" + orgTitle + ") 가 결재완료(Approval Complete) 되었습니다. <br><br>"
                +"결재문서 : <a href='"+content+"' target='_blank'>" + orgTitle + "</a>";
            } else if ( "APP_REQ".equals(mailGb) ) {
                linkcontent = "[전자결재] (" + orgTitle + ") 가 결재요청(Approval Request) 되었습니다. <br><br>"
                +"결재문서 : <a href='"+content+"' target='_blank'>" + orgTitle + "</a>";
            } else if ( "APP_INFORM".equals(mailGb) ) {
                linkcontent = "[전자결재] (" + orgTitle + ") 가 결재완료(Approval Complete) 되었습니다. <br><br>"
                +"결재문서 : <a href='"+content+"' target='_blank'>" + orgTitle + "</a>";
            } else if ( "APP_RETURN".equals(mailGb) ) {
                linkcontent = "[전자결재] (" + orgTitle + ") 가 결재반려(Approval Reject) 되었습니다. <br><br>"
                +"결재문서 : <a href='"+content+"' target='_blank'>" + orgTitle + "</a>";
            } else {
                linkcontent = "[전자결재] (" + orgTitle + ") 입니다. <br><br>"
                +"결재문서 : <a href='"+content+"' target='_blank'>" + orgTitle + "</a>";
            }

            if ( "PC".equals(mailGb) ) {
                mail.setSubject (  orgTitle  );
            } else {
                mail.setSubject (  title     );
            }
            mail.setHtml    (  linkcontent  );
//            mail.setSubject ( new String ( title.getBytes(), "UTF-8")     );
//            mail.setHtml    ( new String ( linkcontent.getBytes(), "UTF-8")  );
 
//            mail.printCurrentConfigInfo();
            mail.send();
            try {
                LLog.info.println(sender.toString() + " 님이 " + string + " 님에게 메일을 전송하였습니다.( '"+ orgTitle +"' )");
            } catch (Exception e) {
            }

        } catch ( Exception e) {
        	e.printStackTrace();
            return 0;
        }
        return 1;
    }
    
    /**
     * 메일을 보낸다.
      *
      * @param sender 보내는 사람 이메일주
     * @return 
      */
     public static void CustomSendMail(String sender, String receiver, String comno, String type) throws LSysException  {
 		final String fromEmail = "designgun@hausyspartner.com";
 		final String password = "eoeeqspqxaxlbzeg";
 		final String toEmail = "designgun@hausyspartner.com"; 
 		
 		Properties props = new Properties();
 		props.put("mail.smtp.host", "subspam.lxhausys.com"); 	//SMTP Host
 		props.put("mail.smtp.port", "25"); 						//TLS Port
 		props.put("mail.smtp.auth", "true"); 					//enable authentication
 		props.put("mail.smtp.starttls.enable", "false"); 		//enable STARTTLS
 		Authenticator auth = new Authenticator() {
 			protected PasswordAuthentication getPasswordAuthentication() {
 				return new PasswordAuthentication(fromEmail, password);
 			}
 		};
 		Session session = Session.getInstance(props, auth);
 		
		try
	    {
	      MimeMessage msg = new MimeMessage(session);
	      //set message headers
	      msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
	      msg.addHeader("format", "flowed");
	      msg.addHeader("Content-Transfer-Encoding", "8bit");
	
	      msg.setFrom(new InternetAddress(sender, "품질혁신지원 시스템"));
	      msg.setReplyTo(InternetAddress.parse(sender, false));
	      msg.setSubject("품질혁신지원시스템에서 메일이 도착하였습니다.", "UTF-8");
	      if(type.equals("request")) {
	    	  //msg.setText("[전자결재] 결재요청(Approval Request) 되었습니다. 결재문서 링크 : http://6sigma2.lxhausys.com/intf/login.do?com_no="+comno, "UTF-8");
	    	  msg.setContent("[전자결재] 결재요청(Approval Request) 되었습니다. <br><br> <a href='http://6sigma2.lxhausys.com/intf/login.do?com_no="+comno+"'>결제 내용을 보려면 링크를 클릭하세요</a>", "text/html; charset=utf-8");
	      }else {
		      //msg.setText("[전자결재] 결재완료(Approval Complete) 되었습니다. 결재문서 링크 : http://6sigma2.lxhausys.com/intf/login.do?com_no="+comno, "UTF-8");
	    	  msg.setContent("[전자결재] 결재완료(Approval Complete) 되었습니다. <br><br> <a href='http://6sigma2.lxhausys.com/intf/login.do?com_no="+comno+"'>결제 내용을 보려면 링크를 클릭하세요</a>", "text/html; charset=utf-8");
	      }
	      msg.setSentDate(new Date());
	      msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver, false));
    	  Transport.send(msg);  
	      System.out.println("EMail Sent Successfully!!");
	    }
	    catch (Exception e) {
	    	System.out.println("EMAIL FAIL!!!!!!!");
	    	System.out.println(e.getMessage());
	    	e.printStackTrace();
	    }
	}

}
