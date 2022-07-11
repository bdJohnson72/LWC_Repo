/**
 * Created by Brooks Johnson on 7/11/2022.
 */

import {LightningElement, wire} from 'lwc';
import getCars from '@salesforce/apex/CarController.getCars'

export default class CarTileList extends LightningElement {

    cars
    error
    filters = {}

    @wire(getCars, {filters: '$filters'})
    carHandler({error, data}){
        if (data){
            this.cars = data;
            this.error = undefined;
            console.log(data);
        }if (error){
            this.error = error;
            this.cars = undefined;
        }
    }

}