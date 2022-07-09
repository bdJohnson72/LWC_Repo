/**
 * Created by Brooks Johnson on 7/9/2022.
 */

import {LightningElement, track} from 'lwc';
import saveAccounts from '@salesforce/apex/AccountCreationController.createAccounts'
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class MultipleAccountInsertion extends LightningElement {
    keyIndex = 0;
    @track accountRecordList = [{
            Name: '',
            Industry: '',
            Phone: ''
        }]

    addRow(){}

    changeHandler(){}

    handleMultipleSave(){}

    removeRow(){}
}