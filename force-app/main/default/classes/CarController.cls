/**
 * Created by Brooks Johnson on 7/10/2022.
 */

public with sharing class CarController {

    @AuraEnabled(Cacheable=true)
    public static List<Car__c> getCars(Filters filters) {
        String key, whereClause = '';
        Decimal maxPrice;
        String[] categories, makeType, criteria = new List<String>();
        if(filters != null ){
            maxPrice = filters.maxPrice;
            categories = filters.categories;
            makeType = filters.makeType;
            if(!String.isEmpty(filters.searchKey)){
                key = '%' + filters.searchKey + '%';
                criteria.add('Name LIKE: key');
            }
            if(filters.maxPrice >= 0){
                criteria.add('MSRP__c <=: maxPrice');
            }
            if(filters.categories != null ){
                criteria.add('Category__c IN : categories');
            }
            if (filters.makeType != null ) {
                criteria.add('Make__c IN: makeType');
            }
            if(criteria.size() > 0) {
                whereClause = 'WHERE ' + String.join(criteria, ' AND ');
            }
        }
        String query = 'SELECT Id, Category__c, Picture_URL__c, ' +
                'Name, Make__c, MSRP__c ' +
                'FROM Car__c ' + whereClause
                + ' ORDER BY Name';

       return Database.query(query);
    }

    public class Filters {

        @AuraEnabled
        public String searchKey { get; set; }
        @AuraEnabled
        public Decimal maxPrice { get; set; }
        @AuraEnabled
        public String[] categories { get; set; }
        @AuraEnabled
        public String[] makeType { get; set; }
    }

}