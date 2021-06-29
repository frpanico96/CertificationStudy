@isTest
private class AccountTriggerTest {
    @isTest
    static void testCreateAccounts(){
        List<Account> accInsert = new List<Account>();
        for(Integer i = 0; i < 200; ++i){
            Account acc = new Account(
                Name = 'TestAccount ' + i,
                BillingState = 'CA'
            );
            accInsert.add(acc);
        }
        Test.startTest();
        insert accInsert;
        Test.stopTest();
        List<Account> accVerifiy = [SELECT Id, Name FROM Account WHERE ShippingState = 'CA'];
        System.assertEquals(200, accVerifiy.size());
    }
}
