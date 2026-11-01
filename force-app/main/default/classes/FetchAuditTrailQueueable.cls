public class FetchAuditTrailQueueable implements Queueable, Database.AllowsCallouts {

    private Creds__c instance;

    public FetchAuditTrailQueueable(Creds__c instance) {
        this.instance = instance;
    }

    public void execute(QueueableContext context) {
        List<Audit_Trail_Log__c> auditTrailData = fetchAuditTrailFromInstance(instance);

        if (!auditTrailData.isEmpty()) {
            system.debug('Inserted records**********');
            insert auditTrailData;
        }
    }

    private List<Audit_Trail_Log__c> fetchAuditTrailFromInstance(Creds__c instance) {
        List<Audit_Trail_Log__c> auditTrails = new List<Audit_Trail_Log__c>();

        HttpRequest req = new HttpRequest();
        req.setEndpoint(instance.Instance_URL__c + '/services/oauth2/token');
        req.setEndpoint(instance.Instance_URL__c);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setBody('grant_type=password'
            + '&client_id=' + EncodingUtil.urlEncode(instance.clientid__c, 'UTF-8')
            + '&client_secret=' + EncodingUtil.urlEncode(instance.Client_Secret__c, 'UTF-8')
            + '&username=' + EncodingUtil.urlEncode(instance.Username__c, 'UTF-8')
            + '&password=' + EncodingUtil.urlEncode(instance.Password__c, 'UTF-8'));
	system.debug('req****************88'+req); 
        Http http = new Http();
        HttpResponse res = http.send(req);
		system.debug('res****************99'+res); 
        if (res.getStatusCode() == 200) {
            system.debug('accessToken****************1');
            Map<String, Object> authResponse = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            system.debug('accessToken****************2');
            String accessToken = (String)authResponse.get('access_token');
			system.debug('accessToken****************32');
            req = new HttpRequest();
            // req.setEndpoint(instance.Instance_URL__c + '/services/data/v57.0/query/?q=' + EncodingUtil.urlEncode(
                  req.setEndpoint( 'https://dellsb--sbsit2.sandbox.my.salesforce.com/services/data/v57.0/query/?q=' + EncodingUtil.urlEncode(
                'SELECT Id, ResponsibleNamespacePrefix, Action, CreatedBy.Email, CreatedDate, DelegateUser, Section, Display ' +
                'FROM SetupAuditTrail WHERE Action NOT IN (\'groupMembership\', \'createdpartneruser\')',
                'UTF-8'));
            req.setMethod('GET');
            req.setHeader('Authorization', 'Bearer ' + accessToken);
            
            res = http.send(req);
			system.debug('accessToken****************88');
            Integer code=res.getStatusCode();
			 system.debug('access code'+code);
            if (res.getStatusCode() == 200) {
                system.debug('inside if--------');
                Map<String, Object> jsonResponse = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
                List<Object> records = (List<Object>)jsonResponse.get('records');
				system.debug('after  if--------'+records[0]);
                for (Object record : records) {
                    system.debug('------inside for --------');
                    system.debug(record);
                    Map<String, Object> rec = (Map<String, Object>)record;
                    Audit_Trail_Log__c auditTrail = new Audit_Trail_Log__c();
                  //  auditTrail.ResponsibleNamespacePrefix__c = (String)rec.get('ResponsibleNamespacePrefix');
                    auditTrail.Action__c = (String)rec.get('Action');
                    //auditTrail.CreatedByEmail__c = (String)((Map<String, Object>)rec.get('CreatedBy')).get('Email');
                   // auditTrail.CreatedDate__c = (Datetime)rec.get('CreatedDate');
                    //auditTrail.DelegateUser__c = (String)rec.get('DelegateUser');
                    auditTrail.Section__c = (String)rec.get('Section');
                    auditTrail.Display__c = (String)rec.get('Display');
                    auditTrails.add(auditTrail);
                    System.debug('retrieved SetupAuditTrail data: ' + auditTrail);
                }
            } else {
                System.debug('Failed to retrieve SetupAuditTrail data: ' + res.getBody());
            }
        } else {
            System.debug('Failed to authenticate: ' + res.getBody());
        }

        //insert auditTrails;
        return auditTrails;
    }
}