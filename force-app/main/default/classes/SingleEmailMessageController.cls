public class SingleEmailMessageController {
    public pagereference SendEmailMethod(){
        Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        string[] toaddress = new String[]{'vijayarisella@gmail.com'};
            msg.setToAddresses(toaddress);
        msg.setSubject('Single email message Test');
        msg.setHtmlBody('<h1>Hi This is single email message test</h1> <h2>congratulation for the first email </h2>');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {msg});
        
         return null;
    }
}