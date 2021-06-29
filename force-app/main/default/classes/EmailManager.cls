public with sharing class EmailManager {
    public static void sendMail(String address, String subject, String body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddress = new String[] {address};
        mail.setToAddresses(toAddress);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
            new Messaging.SingleEmailMessage[] { mail });
        inspectResults(results);
    }

    private static Boolean inspectResults(Messaging.SendEmailResult[] results){
        Boolean sendResult = true;
        for(Messaging.SendEmailResult result : results){
            if(result.isSuccess()){
                System.debug('Email sent successfully');
            } else {
                sendResult = false;
                System.debug('The following errors occurred: ' + result.getErrors());
            }
        }
        return sendResult;
    }
}
