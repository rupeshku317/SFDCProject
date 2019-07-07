trigger ProdEvalTaskTrigger on Prod_Eval_Task__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
public static string test = 'rupesh';
if (trigger.isBefore && trigger.isInsert) {
	Product_Evaluation__c prod = new Product_Evaluation__c();
	List<Medical_Evaluation__c> medObj = new List<Medical_Evaluation__c>();
	List<Complaint__c> compObj = new List<Complaint__c>();
		system.debug('Trigger.newMap'+Trigger.newMap);
	/*if (prodEvalId!=null) {
		String compId= [select Complaint__r.id from Product_Evaluation__c];
	}*/
	system.debug('Trigger.new'+Trigger.new);
	for (Prod_Eval_Task__c so : Trigger.new) {
		//Prod_Eval_Task__c obj = Trigger.newMap.get(so.Product_Evaluation__c);
				//system.debug('obj1'+obj);
				//system.debug('obj2.Product_Evaluation__c'+obj.Product_Evaluation__c);
				system.debug('so3.Product_Evaluation__c'+so.Product_Evaluation__c);

		prod=[select id, Complaint__r.id from Product_Evaluation__c where id =:so.Product_Evaluation__c ];
		//compObj=[select id, (select id, name from Medical_Evaluations__r), name from Complaint__c where id =:prod.Complaint__r.id];
		//for (Complaint__c compObjitr : compObj) {
			//system.debug('compObjitr'+compObjitr.id);
			//system.debug('compObjitr'+compObjitr.name);
			//String tempName='';

			//for (Medical_Evaluation__c medobj1 : compObjitr.Medical_Evaluations__r) {
				//system.debug('medobj1'+compObjitr.name);
				//tempName=tempName+''+compObjitr.name;
			//}

		//}
		system.debug('prod000'+prod);
		system.debug('prod000'+prod.Complaint__r.id);

		so.Complaint__c = prod.Complaint__r.id;
		//update obj;

		//friends remind friends to bulkify
	}
}
ProdEvalTaskTriggerHander handlerObj = new ProdEvalTaskTriggerHander();

if (trigger.isBefore && trigger.isUpdate) {
	handlerObj.method2(Trigger.new,Trigger.old);
}

if (trigger.isAfter && trigger.isUpdate) {
	handlerObj.method3(Trigger.new,Trigger.old);


}

}