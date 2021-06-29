public with sharing class AccountHandler {

    public static void CreateNewOpportunity(List<Account> accts){

        List<Opportunity> opps = new List<Opportunity>();
        for(Account acc : accts){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name + ' Opportunity';
            opp.AccountId = acc.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today().addMonths(1);
            opps.add(opp);
        }        
        insert opps;
    }

}
