public with sharing class ContactController {
    @AuraEnabled
    public static list<Contact> findAll(){
        return [select id,name,phone from contact limit 20];
    }
    
    @AuraEnabled
    public static list<contact> findByName(String searchKey){
        String name='%'+searchKey+'%';
        return [select id,name,phone from contact where name LIKE:name limit 20 ];
    }
    @AuraEnabled
    public static list<contact> findById(String contactID){
        return [select id,name,phone from contact where id=:contactID ];
    }
}