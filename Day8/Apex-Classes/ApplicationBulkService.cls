public class ApplicationBulkService {

    // Retrieve all Students in one SOQL query
    public static Map<Id, Student__c> getStudents(Set<Id> studentIds) {

        return new Map<Id, Student__c>([
            SELECT Id,
                   Name,
                   CGPA__c,
                   Department__c,
                   Backlogs__c
            FROM Student__c
            WHERE Id IN :studentIds
        ]);

    }

    // Retrieve all Jobs in one SOQL query
    public static Map<Id, Job__c> getJobs(Set<Id> jobIds) {

        return new Map<Id, Job__c>([
            SELECT Id,
                   Name,
                   Job_Title__c,
                   Company_Name__c,
                   Minimum_CGPA__c,
                   Closing_Date__c
            FROM Job__c
            WHERE Id IN :jobIds
        ]);

    }

    // Bulk Validation Method
    public static void validateApplications(List<Application__c> applications) {

        // Step 1: Collect Student IDs and Job IDs
        Set<Id> studentIds = new Set<Id>();
        Set<Id> jobIds = new Set<Id>();

        for(Application__c app : applications){

            if(app.Student__c != null){
                studentIds.add(app.Student__c);
            }

            if(app.Job__c != null){
                jobIds.add(app.Job__c);
            }

        }

        // Step 2: Retrieve Students and Jobs in one query each
        Map<Id, Student__c> studentMap = getStudents(studentIds);
        Map<Id, Job__c> jobMap = getJobs(jobIds);

        // Step 3: Process each Application
        for(Application__c app : applications){

            Student__c student = studentMap.get(app.Student__c);
            Job__c job = jobMap.get(app.Job__c);

            if(student != null && job != null){

                if(student.CGPA__c >= job.Minimum_CGPA__c){

                    app.Remarks__c = 'Eligible';

                }else{

                    app.Remarks__c = 'Not Eligible';

                }

            }

        }

    }

}
