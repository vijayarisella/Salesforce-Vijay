global class AccountBatch implements Database.Batchable<sobject>
{
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        String query='select id,name from Account';
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc, List<Account>scope)
    {
        List<account> acc=new list<Account>();
        for(account a:scope)
        {
            a.name='batch'+a.name;
            acc.add(a);
        }
        update acc;
    }
    global void finish(database.BatchableContext bc)
    {
        
    }
}