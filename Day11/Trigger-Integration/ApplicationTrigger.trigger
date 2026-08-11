trigger ApplicationTrigger on Application__c (
    before insert,
    before update,
    after update
) {

    if (Trigger.isBefore) {

        ApplicationService.validateApplications(
            Trigger.new
        );
    }

    if (Trigger.isAfter && Trigger.isUpdate) {

        ApplicationService.handleApplicationSelection(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
