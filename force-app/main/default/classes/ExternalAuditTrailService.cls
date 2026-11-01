public class ExternalAuditTrailService {

    public static List<Audit_Trail_Log__c> getAuditTrailData(Creds__c cred, String accessToken) {
        List<Audit_Trail_Log__c> auditLogs = new List<Audit_Trail_Log__c>();
        Boolean hasMoreRecords = true;
        String nextRecordsUrl = null;
        
        while (hasMoreRecords) {
            String query = 'SELECT Id, Action, CreatedDate, CreatedById, Display FROM SetupAuditTrail WHERE CreatedDate = LAST_N_DAYS:30';
            String endpoint = 'https://' + cred.Instance_URL__c + '/services/data/v57.0/query?q=' + EncodingUtil.urlEncode(query, 'UTF-8');
            
            if (nextRecordsUrl != null) {
                endpoint = 'https://' + cred.Instance_URL__c + nextRecordsUrl;
            }

            HttpRequest req = new HttpRequest();
            req.setEndpoint(endpoint);
            req.setMethod('GET');
            req.setHeader('Authorization', 'Bearer ' + accessToken);
            
            Http http = new Http();
            HttpResponse res = http.send(req);
            
            if (res.getStatusCode() == 200) {
                Map<String, Object> resMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                List<Object> records = (List<Object>) resMap.get('records');
                
                for (Object recordObj : records) {
                    Map<String, Object> record = (Map<String, Object>) recordObj;
                    Audit_Trail_Log__c auditLog = new Audit_Trail_Log__c(
                        Action__c = (String) record.get('Action'),
                      //  CreatedDate__c = (DateTime) record.get('CreatedDate'),
                       // CreatedById__c = (String) record.get('CreatedById'),
                        Display__c = (String) record.get('Display')
                    );
                    auditLogs.add(auditLog);
                }
                
                if (resMap.containsKey('nextRecordsUrl')) {
                    nextRecordsUrl = (String) resMap.get('nextRecordsUrl');
                } else {
                    hasMoreRecords = false;
                }
            } else {
                throw new CalloutException('Failed to query SetupAuditTrail: ' + res.getBody());
            }
        }
        
        return auditLogs;
    }
}