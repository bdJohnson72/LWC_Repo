/**
 * Created by Brooks Johnson on 7/9/2022.
 */

public with sharing class AccountCreationController {

    @AuraEnabled
    public static Account createAccount(Account accountRecord) {
        try {
            insert accountRecord;
            return accountRecord;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Account> createAccounts(List<Account> accounts) {
        try {
            insert accounts;
            return accounts;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}