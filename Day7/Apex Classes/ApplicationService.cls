public class ApplicationService {

    public static Student__c getStudent(Id studentId) {

        Student__c student = [
            SELECT Id,
                   Name,
                   CGPA__c,
                   Department__c,
                   Backlogs__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        return student;
    }
    public static Job__c getJob(Id jobId){

    Job__c job = [
        SELECT Id,
               Name,
               Job_Title__c,
               Company_Name__c,
               Minimum_CGPA__c,
               Closing_Date__c
        FROM Job__c
        WHERE Id = :jobId
        LIMIT 1
    ];

    return job;
}
    public static Boolean isDuplicateApplication(Id studentId, Id jobId){

    List<Application__c> applications = [
        SELECT Id
        FROM Application__c
        WHERE Student__c = :studentId
        AND Job__c = :jobId
    ];

    return !applications.isEmpty();
}
    public static Application__c createApplication(Id studentId, Id jobId){

    Application__c app = new Application__c();

    app.Student__c = studentId;
    app.Job__c = jobId;
    app.Status__c = 'Applied';
    app.Application_Date__c = Date.today();

    insert app;

    return app;
}
    public static void updateApplicationStatus(Id applicationId, String newStatus){

    Application__c app = [
        SELECT Id, Status__c
        FROM Application__c
        WHERE Id = :applicationId
        LIMIT 1
    ];

    app.Status__c = newStatus;

    update app;

    System.debug('Application Status Updated Successfully');
}
    public static void validateApplications(List<Application__c> applications) {

    for(Application__c app : applications) {

        // Check Duplicate Application
        if(isDuplicateApplication(app.Student__c, app.Job__c)) {

            app.addError('This student has already applied for this job.');

            continue;
        }

        // Retrieve Student
        Student__c student = getStudent(app.Student__c);

        // Retrieve Job
        Job__c job = getJob(app.Job__c);

        // CGPA Validation
        if(student.CGPA__c < job.Minimum_CGPA__c){

            app.addError('Student does not meet the minimum CGPA requirement.');

        }

    }

}

}
