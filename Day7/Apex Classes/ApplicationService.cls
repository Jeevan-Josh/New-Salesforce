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
