public class SetupAuditTrailScheduler implements Schedulable {

    public void execute(SchedulableContext sc) {
        SetupAuditTrailBatch batchJob = new SetupAuditTrailBatch();
        batchJob.execute(sc);
    }
    
    // Schedule the job to run on the 1st of every month
    public static void scheduleMonthlyJob() {
        String cronExp = '0 0 0 1 * ?';
        System.schedule('Monthly SetupAuditTrail Job', cronExp, new SetupAuditTrailScheduler());
    }
}