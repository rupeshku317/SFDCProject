global class ApexCreateTicket implements Database.Batchable<sObject> {
	
	String query;
	
	global ApexCreateTicket() {
		
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {

query='select id, Default_Set__c from Complaint__c';
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<sObject> scope) {

   		List <Complaint__c> ListObj = new List<Complaint__c>();
		//for ( integer i=600;i<602;i++) {
				 Complaint__c obj = new Complaint__c();
				 obj.Default_Set__c='test Complaint';
				 obj.Name='rupesh123456';

				 ListObj.add(obj);

			System.debug('inserting the record');


		//}
		insert ListObj;
	
	}
	
	global void finish(Database.BatchableContext BC) {
		System.debug('end of the method ');
		
	}
	
}