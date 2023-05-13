package kr.freedi.dev.common.util;

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
     * @param reciver 받는 사람 이메일주
     * @param ccAddr 참조자
     * @param bccAddr 참조자
     * @param title 제목
     * @param content 내용
     * @throws LSysException
     */
    public static int SendToMail(String sender, String[] reciver, String[] ccAddr, String[] bccAddr,
                                  String title , String orgTitle ,String content , String mailGb ) throws LSysException  {
        try {

            LMail mail = new LMail();
            mail.setToMailAddress   (reciver );
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
                LLog.info.println(sender.toString() + " 님이 " + reciver[0] + " 님에게 메일을 전송하였습니다.( '"+ orgTitle +"' )");
            } catch (Exception e) {
            }

        } catch ( Exception e) {
            return 0;
        }
        return 1;
    }



}
