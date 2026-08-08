public class ApplicationQueueableService implements Queueable {

    private Id applicationId;

    public ApplicationQueueableService(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c app = [
            SELECT Id,
                   Name,
                   Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        System.debug('===== QUEUEABLE JOB EXECUTED =====');
        System.debug('Application Name: ' + app.Name);
        System.debug('Application Status: ' + app.Status__c);
        System.debug('Queueable Processing Completed Successfully');

    }

}
