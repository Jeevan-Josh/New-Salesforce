public class ApplicationScheduler implements Schedulable {

    public void execute(SchedulableContext sc) {

        Database.executeBatch(new ApplicationBatchService(), 5);

        System.debug('===== SCHEDULED JOB STARTED =====');

    }

}
