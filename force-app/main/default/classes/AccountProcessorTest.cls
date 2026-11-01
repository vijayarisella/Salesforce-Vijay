@isTest
public class AccountProcessorTest {
    @testSetup
    static void setupTestData() {
        // Create test accounts
        List<Account> accounts = new List<Account>{
            new Account(Name = 'Test Account 1'),
            new Account(Name = 'Test Account 2'),
            new Account(Name = 'Test Account 3')
        };
        insert accounts;

        // Create test contacts
        List<Contact> contacts = new List<Contact>{
            new Contact(FirstName = 'John', LastName = 'Doe', AccountId = accounts[0].Id),
            new Contact(FirstName = 'Jane', LastName = 'Smith', AccountId = accounts[0].Id),
            new Contact(FirstName = 'Sam', LastName = 'Brown', AccountId = accounts[1].Id)
        };
        insert contacts;
    }

    @isTest
    static void testCountContacts() {
        // Query accounts to get their IDs
        List<Account> accounts = [SELECT Id, Number_Of_Contacts__c FROM Account];

        // Verify initial state
        for (Account acc : accounts) {
            System.assertEquals(null, acc.Number_Of_Contacts__c, 'Initial contact count should be null');
        }

        // Call the future method
        List<Id> accountIds = new List<Id>();
        for (Account acc : accounts) {
            accountIds.add(acc.Id);
        }
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();

        // Query accounts after processing
        accounts = [SELECT Id, Number_Of_Contacts__c FROM Account];
        
        // Verify contact counts
        for (Account acc : accounts) {
            if (acc.Name == 'Test Account 1') {
                System.assertEquals(2, acc.Number_Of_Contacts__c, 'Test Account 1 should have 2 contacts');
            } else if (acc.Name == 'Test Account 2') {
                System.assertEquals(1, acc.Number_Of_Contacts__c, 'Test Account 2 should have 1 contact');
            } else if (acc.Name == 'Test Account 3') {
                System.assertEquals(0, acc.Number_Of_Contacts__c, 'Test Account 3 should have 0 contacts');
            }
        }
    }

    @isTest
    static void testNoContactsScenario() {
        // Create a new account without contacts
        Account accountWithoutContacts = new Account(Name = 'No Contact Account');
        insert accountWithoutContacts;

        // Call the future method
        Test.startTest();
        AccountProcessor.countContacts(new List<Id>{accountWithoutContacts.Id});
        Test.stopTest();

        // Verify contact count is 0
        Account updatedAccount = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id = :accountWithoutContacts.Id];
        System.assertEquals(0, updatedAccount.Number_Of_Contacts__c, 'Account with no contacts should have 0 contact count');
    }
}