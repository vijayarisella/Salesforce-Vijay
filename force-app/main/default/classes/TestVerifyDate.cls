@isTest
public class TestVerifyDate {
 @IsTest
    static void testCheckDatesWithin30Days() {
        Date date1 = Date.newInstance(2023, 9, 1);
        Date date2 = Date.newInstance(2023, 9, 15);
        Date expectedDate = date2;
        Date result = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(expectedDate, result, 'The dates should match');
    }

    @IsTest
    static void testCheckDatesNotWithin30Days() {
        Date date1 = Date.newInstance(2023, 9, 1);
        Date date2 = Date.newInstance(2023, 10, 15);
        Date expectedDate = Date.newInstance(2023, 9, 30);
        Date result = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(expectedDate, result, 'The dates should match');
    }
}