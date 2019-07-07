global class UpdateTicketDate implements Database.Batchable<sObject> {
	
	String query;
	
	global UpdateTicketDate() {
		
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		string tesId='a011U00000LyM4t';
				query ='select id, Default_Set__c from Complaint__c';
				System.debug('query----'+query);

		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<sObject> scope) {

   		List<sObject> combObjLst = new List<sObject>();
   		System.debug('scope----'+scope);
   		 Map <Id,String> testMap = new Map <Id,String>();
   		 Map <Id,List<sObject>> testMapList = new Map <Id,List<sObject>>();
   		 Map <id,Set<Complaint__c>> mapSetObject = new Map <Id, Set<Complaint__c>>();
   		 Map <id,sObject> mapSetObjectNEw  = new Map <Id,sObject>(scope);
   		 System.debug ('mapSetObjectNEw'+ mapSetObjectNEw);
   		for (sObject compObj:scope) {
   			Complaint__c test = new Complaint__c();
   			test.id=compObj.id;
   			test.Default_Set__c='batchjobNewtestingMap123 ';
   			combObjLst.add(test);

   		}
	update combObjLst;
	}
	
	global void finish(Database.BatchableContext BC) {
		System.debug('calling the finish method ----');
	}
	
}