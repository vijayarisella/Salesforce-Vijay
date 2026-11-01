public class ProcessAuditTrailQueueable implements Queueable {

    private Id credId;

    public ProcessAuditTrailQueueable(Id credId) {
        this.credId = credId;
    }

    public void execute(QueueableContext context) {
        Creds__c cred = [SELECT Instance_URL__c, clientid__c, Client_Secret__c, Username__c, Password__c FROM Creds__c WHERE Id = :credId LIMIT 1];
        
        try {
            // Authenticate to the external instance
            String accessToken = OAuthUtils.getAccessToken(cred);
            
            // Query SetupAuditTrail data from the external instance
            List<Audit_Trail_Log__c> auditTrailData = ExternalAuditTrailService.getAuditTrailData(cred, accessToken);

            // Process and insert data into Audit_Trail_Log__c
            if (!auditTrailData.isEmpty()) {
                Database.insert(auditTrailData, false);
            }
        } catch (Exception e) {
            System.debug('Error processing instance: ' + e.getMessage());
        }
    }
}