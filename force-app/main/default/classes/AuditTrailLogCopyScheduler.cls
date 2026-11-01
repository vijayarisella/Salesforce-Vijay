global class AuditTrailLogCopyScheduler implements Schedulable {

    global void execute(SchedulableContext sc) {
        // Instantiate the batch class
        AuditTrailLogCopyBatch batchJob = new AuditTrailLogCopyBatch();
        
        // Execute the batch job with specified batch size
        Database.executeBatch(batchJob, 200);
    }
}