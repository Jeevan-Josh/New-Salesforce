public class CandidateSyncQueueable implements Queueable, Database.AllowsCallouts {

    private Id applicationId;

    public CandidateSyncQueueable(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c app = [
            SELECT Id,
                   Student__c,
                   Job__c,
                   Application_Date__c,
                   Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        Student__c student = [
            SELECT Id,
                   Name,
                   Email__c,
                   Department__c,
                   CGPA__c
            FROM Student__c
            WHERE Id = :app.Student__c
            LIMIT 1
        ];

        Job__c job = [
            SELECT Id,
                   Job_Title__c,
                   Company_Name__c
            FROM Job__c
            WHERE Id = :app.Job__c
            LIMIT 1
        ];

        Map<String, Object> candidateData = new Map<String, Object>();

        candidateData.put('studentId', student.Id);
        candidateData.put('name', student.Name);
        candidateData.put('email', student.Email__c);
        candidateData.put('branch', student.Department__c);
        candidateData.put('cgpa', student.CGPA__c);
        candidateData.put('jobId', job.Id);
        candidateData.put('company', job.Company_Name__c);
        candidateData.put('role', job.Job_Title__c);
        candidateData.put('selectionDate', app.Application_Date__c);

        String requestBody = JSON.serialize(candidateData);

        HttpRequest request = new HttpRequest();

        request.setEndpoint(
            'callout:External_Recruitment_API/candidates'
        );

        request.setMethod('POST');

        request.setHeader(
            'Content-Type',
            'application/json'
        );

        request.setBody(requestBody);

        Http http = new Http();

        HttpResponse response = http.send(request);

Integer statusCode = response.getStatusCode();
String responseBody = response.getBody();

System.debug('Response Status: ' + statusCode);
System.debug('Response Body: ' + responseBody);

if (statusCode == 200 || statusCode == 201 || statusCode == 204) {

    System.debug('Candidate synchronized successfully.');

} else if (statusCode == 400) {

    System.debug('Bad Request: Candidate data is invalid.');

} else if (statusCode == 401) {

    System.debug('Unauthorized: Authentication failed.');

} else if (statusCode == 403) {

    System.debug('Forbidden: Access denied.');

} else if (statusCode == 404) {

    System.debug('Not Found: External endpoint or resource was not found.');

} else if (statusCode == 500) {

    System.debug('External Server Error.');

} else {

    System.debug(
        'Unexpected HTTP status: ' + statusCode
    );
}
    }
}
