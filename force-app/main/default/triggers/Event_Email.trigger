trigger Event_Email on Event (before insert) 
{
    String[] toAddresses = new String[] {'name@email.com'}; 
    String[] ccAddresses = new String[] {'name@email.com'};

    User userIds = [select id from User where Alias = 'names'];
        system.debug(userIds.id);

    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

    EmailTemplate et=[Select id from EmailTemplate where name = :'New Event'];

    System.debug('New Event'+et);

    mail.setTemplateId('00XK0000000QoCj');
    mail.setToAddresses(toAddresses);
    mail.setCcAddresses(ccAddresses);
    mail.setReplyTo('name@email.com');
    mail.setSenderDisplayName('Calendar Alert');
    mail.setBccSender(false);
    mail.setUseSignature(false);
    Event eve = trigger.new[0];
    mail.setTargetObjectId(userIds.Id);
    mail.saveAsActivity = false;

    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}