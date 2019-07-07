trigger eMDRTrigger on eMDR__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

if(Trigger.isUpdate && Trigger.isBefore) {
	eMDRTriggerHandler.updatePRodEval(Trigger.new,Trigger.old);
	

}
}