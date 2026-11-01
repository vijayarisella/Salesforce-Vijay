public class AuditTrailLogCopyBatch_1 implements Database.Batchable<SObject>, Database.Stateful {
    private String accessToken;
    private String instanceUrl;
  //  System.debug('Failed to fetch data');
    public AuditTrailLogCopyBatch_1(String accessToken, String instanceUrl) {
        this.accessToken = accessToken;
        this.instanceUrl = instanceUrl;
        System.debug('2************ ' );
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
    System.debug('33************ ' );
        // Return a dummy query since we're fetching data from another instance
        return Database.getQueryLocator([SELECT Id FROM SetupAuditTrail LIMIT 1]);
        
    }

    public void execute(Database.BatchableContext BC, List<SObject> scope) {
        List<Audit_Trail_Log__c> targetRecords = new List<Audit_Trail_Log__c>();
        System.debug('44444444************ ' );
        // Fetch data from source instance
        HttpRequest req = new HttpRequest();
        req.setEndpoint(instanceUrl + '/services/data/v52.0/query/?q=SELECT+Id+FROM+SetupAuditTrail');
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + accessToken);

        Http http = new Http();
        HttpResponse res = http.send(req);
System.debug('555555************ ' );
        if (res.getStatusCode() == 200) {
            Map<String, Object> queryResponse = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            List<Map<String, Object>> records = (List<Map<String, Object>>) queryResponse.get('records');
            for (Map<String, Object> record : records) {
                Audit_Trail_Log__c targetRecord = new Audit_Trail_Log__c();
                targetRecord.Name = (String) record.get('Id');
                targetRecords.add(targetRecord);
            }
        } else {
            throw new AuraHandledException('Failed to fetch data: ' + res.getBody());
        }

        if (!targetRecords.isEmpty()) {
            try {
                insert targetRecords;
            } catch (DmlException e) {
                System.debug('Error inserting target records: ' + e.getMessage());
            }
        }
        futuremethod();//
    }

    public void finish(Database.BatchableContext BC) {
        System.debug('Batch processing completed.');
    }
    @future(callout=true)
    public static void futuremethod(){
        system.debug('future called---------');
    }
        
}