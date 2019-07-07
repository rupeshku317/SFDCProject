trigger MEdEvalTrigger on Medical_Evaluation__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

	List<Medical_Evaluation_Task__c> obj = new List<Medical_Evaluation_Task__c>();
		Medical_Evaluation_Task__c obj1 = new Medical_Evaluation_Task__c();
				Medical_Evaluation_Task__c obj2 = new Medical_Evaluation_Task__c();


	Complaint__c compObj = new Complaint__c ();


	for (Medical_Evaluation__c so : Trigger.new) {
		if (trigger.isAfter &&  trigger.isInsert ) {
			System.debug('reach here');
			compObj.id=so.Complaint__c;
			System.debug('compObj'+so.Complaint__c);
			//for (Medical_Evaluation_Task__c obj1 :obj) {
				obj1.Complaint__c =compObj.id;
				obj1.Medical_Evaluation__c =so.id;
				obj.add(obj1);
				obj2.Complaint__c =compObj.id;
				obj2.Medical_Evaluation__c =so.id;
				obj.add(obj2);

				System.debug('reach here');
			//}
			insert(obj);
		}
		
	}
	if (trigger.isBefore &&  trigger.isUpdate ) {


Map<Id,Medical_Evaluation__c> newMap = trigger.newMap;
List <Medical_Evaluation__c> compObjList = new List<Medical_Evaluation__c> ();
compObjList= [select id, complaint__r.id from Medical_Evaluation__c where id IN :newMap.keyset()];
system.debug('compObjList'+compObjList);
for (Medical_Evaluation__c compObj : compObjList){
	system.debug('compObjList'+compObj.complaint__r.id);
}
for (Medical_Evaluation__c so : Trigger.new) {



System.debug('newMap'+ newMap.get(so.id));
System.debug('newMap'+ newMap.get(so.id).OwnerId);
}


	}

}