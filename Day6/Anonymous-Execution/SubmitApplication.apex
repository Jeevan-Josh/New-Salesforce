Id studentId = 'YOUR_STUDENT_ID';
Id jobId = 'YOUR_JOB_ID';

Boolean duplicate = ApplicationService.isDuplicateApplication(studentId, jobId);

System.debug('Duplicate Application: ' + duplicate);
