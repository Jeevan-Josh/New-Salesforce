import { LightningElement, api, wire } from 'lwc';
import getEligibleJobs from '@salesforce/apex/ApplicationController.getEligibleJobs';
import applyForJob from '@salesforce/apex/ApplicationController.applyForJob';

export default class EligibleJobs extends LightningElement {

    @api recordId;

    jobs = [];
    selectedJob = null;
    error;
    isLoading = true;
    isApplying = false;
    successMessage;
    applicationError;

    @wire(getEligibleJobs, { studentId: '$recordId' })
    wiredJobs({ data, error }) {

        this.isLoading = false;

        if (data) {

            this.jobs = data.map(job => ({
                id: job.Id,
                jobTitle: job.Job_Title__c,
                companyName: job.Company_Name__c,
                minimumCGPA: job.Minimum_CGPA__c,
                closingDate: job.Closing_Date__c
            }));

            this.error = undefined;

        } else if (error) {

            this.jobs = [];
            this.error = error;

            console.error('Error loading eligible jobs:', error);
        }
    }

    handleViewDetails(event) {

        const jobId = event.currentTarget.dataset.id;

        this.selectedJob = this.jobs.find(job => job.id === jobId);
    }
    async handleApply(event) {

    const jobId = event.currentTarget.dataset.id;

    this.isApplying = true;
    this.successMessage = undefined;
    this.applicationError = undefined;

    try {

        const application = await applyForJob({
            studentId: this.recordId,
            jobId: jobId
        });

        this.successMessage = 'Application submitted successfully.';

        console.log('Application created:', application);

    } catch (error) {

    console.error('Application failed:', error);

    console.error(
        'Full error:',
        JSON.stringify(error)
    );

    this.applicationError =
        error?.body?.message ||
        error?.body?.pageErrors?.[0]?.message ||
        error?.message ||
        'Unable to submit application. Please try again.';

} finally {

        this.isApplying = false;

    }
}
}
