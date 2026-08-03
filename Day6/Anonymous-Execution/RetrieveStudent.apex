Student__c student = [
    SELECT Id, Name, CGPA__c, Department__c
    FROM Student__c
    WHERE Name = 'Rahul'
];

System.debug(student);
