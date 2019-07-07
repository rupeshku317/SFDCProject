trigger MedEvalTriger on Medical_Evaluation__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

	for (Medical_Evaluation__c so : Trigger.new) {
		//friends remind friends to bulkify
	}

}