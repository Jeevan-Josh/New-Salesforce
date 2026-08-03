Job__c job = [
    SELECT Id, Name, Minimum_CGPA__c
    FROM Job__c
    WHERE Name = 'Software Developer'
];

System.debug(job);
