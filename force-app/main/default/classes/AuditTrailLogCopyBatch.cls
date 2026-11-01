public class AuditTrailLogCopyBatch implements Database.Batchable<SObject>, Database.Stateful {

    // Query to fetch records from SetupAuditTrail
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT id,ResponsibleNamespacePrefix,Action, CreatedBy.email,CreatedDate, DelegateUser,Section,Display FROM SetupAuditTrail where Createddate=today');
    }

    // Process each batch of records
    public void execute(Database.BatchableContext BC, List<SetupAuditTrail> scope) {
        List<Audit_Trail_Log__c  > targetRecords = new List<Audit_Trail_Log__c  >();

        // Loop through each source record and create corresponding target records
        for (SetupAuditTrail sourceRecord : scope) {
            Audit_Trail_Log__c   targetRecord = new Audit_Trail_Log__c  ();
            targetRecord.Audit_createddate__c = sourceRecord.CreatedDate; // Map fields
            targetRecord.Name = sourceRecord.id; // Map fields
            targetRecord.Section__c = sourceRecord.Section; // Map fields
            targetRecord.User__c = sourceRecord.CreatedBy.email; // Map fields
            targetRecord.Action__c = sourceRecord.Action; // Map fields
            targetRecord.Display__c = sourceRecord.Display; // Map fields
            
            targetRecords.add(targetRecord);
        }

        // Insert the target records
        if (!targetRecords.isEmpty()) {
            try {
                insert targetRecords;
            } catch (DmlException e) {
                System.debug('Error inserting target records: ' + e.getMessage());
            }
        }
    }

    // Finish method to send a notification or perform any post-processing
    public void finish(Database.BatchableContext BC) {
        // Optional: You can add logic here to send an email or log the completion
        System.debug('Batch processing completed.');
    }
}