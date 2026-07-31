import { LightningElement } from 'lwc';

export default class PlacementHome extends LightningElement {
    placementTitle = 'Placement Portal';
    studentName = 'Josh';
    companies = 25;
    jobs = 63;
    applications = 5;

    get todayDate() {
        return new Date().toLocaleDateString(undefined, {
            weekday: 'long',
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });
    }
}
