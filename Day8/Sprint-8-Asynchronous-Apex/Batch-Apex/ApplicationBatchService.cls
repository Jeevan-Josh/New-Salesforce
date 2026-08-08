public class ApplicationBatchService implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext bc) {

        return Database.getQueryLocator(
            'SELECT Id, Name, Status__c, Remarks__c FROM Application__c'
        );

    }

    public void execute(Database.BatchableContext bc, List<Application__c> scope) {

        for(Application__c app : scope){

            if(app.Status__c == 'Selected'){
                app.Remarks__c = 'Congratulations!';
            }
            else if(app.Status__c == 'Rejected'){
                app.Remarks__c = 'Better Luck Next Time';
            }
            else{
                app.Remarks__c = 'Application Under Process';
            }

        }

        update scope;

    }

    public void finish(Database.BatchableContext bc){

        System.debug('===== BATCH JOB COMPLETED =====');

    }

}
