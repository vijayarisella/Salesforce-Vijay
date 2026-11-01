@IsTest
private class TestRestrictContactByName {
    @IsTest
    static void testInvalidLastName() {
        Contact c = new Contact(LastName = 'INVALIDNAME');
        
        Test.startTest();
        try {
            insert c;
            System.assert(false, 'The contact should not have been inserted.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'), 'The error message should match the expected message.');
        }
        Test.stopTest();
    }
}