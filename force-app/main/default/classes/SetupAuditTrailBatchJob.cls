global class SetupAuditTrailBatchJob implements Database.Batchable<SObject>, Database.AllowsCallouts {
    String instanceUrl;
    String accessToken;

    // Constructor to initialize the instance URL and access token
    public SetupAuditTrailBatchJob(String instanceUrl, String accessToken) {
        this.instanceUrl = instanceUrl;
        this.accessToken = accessToken;
    }

    global Database.QueryLocator start(Database.BatchableContext BC) {
        // This is a placeholder query; the batch job doesn't actually process Salesforce records in the current org
        return Database.getQueryLocator([SELECT Id FROM Audit_Trail_Log__c LIMIT 1]); // Dummy Query
    }

    global void execute(Database.BatchableContext BC, List<SObject> scope) {
        // API request to pull SetupAuditTrail records
        system.debug('inside the execute method');
        HttpRequest req = new HttpRequest();
        req.setEndpoint(instanceUrl + '/services/data/v55.0/query/?q=' + EncodingUtil.urlEncode(
            'SELECT Id, Action, CreatedDate FROM SetupAuditTrail limit 10000', 'UTF-8'));
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + accessToken);
        
        Http http = new Http();
        HttpResponse res = http.send(req);
		system.debug('Response code'+res.getStatusCode());
        if (res.getStatusCode() == 200) {
            // Deserialize the response and map it to your custom object
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            List<Object> records = (List<Object>) result.get('records');
            
            List<Audit_Trail_Log__c> logsToInsert = new List<Audit_Trail_Log__c>();
            
            for (Object recordObj : records) {
                Map<String, Object> record = (Map<String, Object>) recordObj;
                
                Audit_Trail_Log__c log = new Audit_Trail_Log__c();
                log.Action__c = (String) record.get('Action');
                log.Name=(String) record.get('id');
                //log.Name = (DateTime) record.get('CreatedDate'); // Assuming Audit_Trail_Log__c has a field for CreatedDate
                system.debug('number of record sto insert'+logsToInsert.size());
                logsToInsert.add(log);
            }
            
            if (logsToInsert.size() > 0) {
                insert logsToInsert;
            }
        } else {
            System.debug('Failed to retrieve SetupAuditTrail data. Status: ' + res.getStatusCode());
        }
    }

    global void finish(Database.BatchableContext BC) {
        // Post-batch operations, if needed (e.g., logging or sending a completion email)
    }
}