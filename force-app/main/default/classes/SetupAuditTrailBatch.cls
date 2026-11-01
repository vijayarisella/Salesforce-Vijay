public class SetupAuditTrailBatch implements Database.Batchable<sObject>, Database.AllowsCallouts {
    private Integer batchSize;

    public SetupAuditTrailBatch(Integer batchSize) {
        this.batchSize = batchSize;
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        // Query all required fields from Creds__c
        return Database.getQueryLocator([
            SELECT Id, Instance_URL__c, ClientID__c, Client_Secret__c, Username__c, Password__c 
            FROM Creds__c
        ]);
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        for (sObject record : scope) {
            Creds__c instance = (Creds__c)record;
            List<Audit_Trail_Log__c> auditTrails = fetchAuditTrailFromInstance(instance);
            if (!auditTrails.isEmpty()) {
                system.debug('000000000'+auditTrails);
                insert auditTrails;
            }
        }
    }

    public void finish(Database.BatchableContext BC) {
        // Perform any cleanup or notifications after the batch execution
    }

    private List<Audit_Trail_Log__c> fetchAuditTrailFromInstance(Creds__c instance) {
        List<Audit_Trail_Log__c> auditTrails = new List<Audit_Trail_Log__c>();

        HttpRequest req = new HttpRequest();
        req.setEndpoint(instance.Instance_URL__c + '/services/oauth2/token');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setBody('grant_type=password'
            + '&client_id=' + EncodingUtil.urlEncode(instance.ClientID__c, 'UTF-8')
            + '&client_secret=' + EncodingUtil.urlEncode(instance.Client_Secret__c, 'UTF-8')
            + '&username=' + EncodingUtil.urlEncode(instance.Username__c, 'UTF-8')
            + '&password=' + EncodingUtil.urlEncode(instance.Password__c, 'UTF-8'));

        Http http = new Http();
        HttpResponse res = http.send(req);
 		system.debug('1111111111111111111'+res.getStatusCode());
        if (res.getStatusCode() == 200) {
            Map<String, Object> authResponse = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            String accessToken = (String)authResponse.get('access_token');
            String instanceUrl = (String)authResponse.get('instance_url'); // Get the correct instance URL

            String query = 'SELECT Id, ResponsibleNamespacePrefix, Action, CreatedBy.Email, CreatedDate, DelegateUser, Section, Display ' +
                'FROM SetupAuditTrail WHERE Action NOT IN (\'groupMembership\', \'createdpartneruser\') ';
			system.debug('222222222222'+query);
            String nextRecordsUrl = performQuery(instanceUrl, query, accessToken, auditTrails);
			system.debug('333333333'+nextRecordsUrl);
            // Handle pagination using queryMore
            while (nextRecordsUrl != null) {
                nextRecordsUrl = performQuery(instanceUrl, query, accessToken, auditTrails);
            }

        } else {
            System.debug('Failed to authenticate: ' + res.getBody());
        }

        return auditTrails;
    }

    private String performQuery(String instanceUrl, String query, String accessToken, List<Audit_Trail_Log__c> auditTrails) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(instanceUrl + '/services/data/v57.0/' + (query.startsWith('query/') ? query : 'query/?q=' + EncodingUtil.urlEncode(query, 'UTF-8')));
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + accessToken);
        system.debug('inside performQuery');

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            Map<String, Object> jsonResponse = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            List<Object> records = (List<Object>)jsonResponse.get('records');
            Integer size=records.size();
            system.debug('inside getStatusCode'+size);

            for (Object record : records) {
                Map<String, Object> rec = (Map<String, Object>)record;
                Audit_Trail_Log__c auditTrail = new Audit_Trail_Log__c();
               // auditTrail.ResponsibleNamespacePrefix__c = (String)rec.get('ResponsibleNamespacePrefix');
                auditTrail.Action__c = (String)rec.get('Action');
               // auditTrail.CreatedByEmail__c = (String)((Map<String, Object>)rec.get('CreatedBy')).get('Email');
               // auditTrail.CreatedDate__c = (Datetime)rec.get('CreatedDate');
               // auditTrail.DelegateUser__c = (String)rec.get('DelegateUser');
               // auditTrail.Section__c = (String)rec.get('Section');
               // auditTrail.Display__c = (String)rec.get('Display');
                auditTrails.add(auditTrail);
            }

            // Check if there are more records to fetch
            if (jsonResponse.containsKey('nextRecordsUrl')) {
                return (String)jsonResponse.get('nextRecordsUrl');
            } else {
                return null; // No more records
            }
        } else {
            System.debug('Failed to retrieve SetupAuditTrail data: ' + res.getBody());
            return null;
        }
    }
}