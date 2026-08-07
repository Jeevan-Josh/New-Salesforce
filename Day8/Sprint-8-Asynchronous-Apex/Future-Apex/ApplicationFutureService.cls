public class ApplicationFutureService {

    @future
    public static void processApplication(Id applicationId) {

        Application__c app = [
            SELECT Id,
                   Name,
                   Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        System.debug('===== FUTURE METHOD EXECUTED =====');
        System.debug('Application Name: ' + app.Name);
        System.debug('Application Status: ' + app.Status__c);
        System.debug('Background Processing Completed Successfully');

    }

}
