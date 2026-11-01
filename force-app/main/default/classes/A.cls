public class A {
Account[] doomedAccts = [SELECT Id, Name FROM Account WHERE Name = ''];
	 {
	    delete doomedAccts;
	}
  //Testing commit
}
/*
List<TestAppLabel_1__c> doomedAccts = new List<TestAppLabel_1__c>();
doomedAccts= [SELECT Id, Name FROM TestAppLabel_1__c where Name like '%' ];
	 {
	    insert doomedAccts;
         system.debug(doomedAccts);
	}
  */