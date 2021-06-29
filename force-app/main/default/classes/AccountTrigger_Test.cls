@isTest
private class AccountTrigger_Test {
    @isTest
    static void TestCreateNewAccountInBulk(){
        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; ++i){
            Account acct = new Account(Name = 'Test Account ' + i);
            accts.add(acct);
        }

        Test.startTest();
        insert accts;
        Test.stopTest();

        List<Account> verifyAccts = [SELECT Id FROM Account];
        System.assertEquals(200, verifyAccts.size());
        List<Opportunity> verifyOpps = [SELECT Id FROM Opportunity];
        System.assertEquals(200, verifyOpps.size());
    }
}
