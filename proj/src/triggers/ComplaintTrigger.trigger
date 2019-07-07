trigger ComplaintTrigger on Complaint__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
System.debug('reach here');
	if (trigger.isAfter && trigger.isInsert) {
	System.debug('reach here1 after inster trigger ');
	/*List <SObject> ObjList= new List<SObject>();
Product_Evaluation__c obj = new Product_Evaluation__c();
Medical_Evaluation__c medObj = new Medical_Evaluation__c();
	for (Complaint__c so : Trigger.new) {
		System.debug('reach here2');
		obj.Start_Date__c= System.today();
		obj.Complaint__c= so.Id;
		medObj.Complaint__c= so.Id;
		//friends remind friends to bulkify
	}
	System.debug('reach here3');
	ObjList.add(obj);
	ObjList.add(medObj);
	insert ObjList;

	
	Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();

System.debug('after  here3'+gd);
System.debug('after  here444'+gd.get('Complaint__c'));
SObjectType bj1 = gd.get('Complaint__c');
Schema.DescribeSObjectResult describeSObjectResultObj = bj1.getDescribe();
    
//if(describeSObjectResultObj.isCustom())    { 
        String name = bj1.getDescribe().getName();
        if(name=='Complaint__c'){
        	 Map <String, Schema.SObjectField> fieldMap = bj1.getDescribe().fields.getMap(); 
        	System.debug('reach here3');
    }
//}*/
}
System.debug('caling ther update trigger ');
List <SObject> CompListUpdate = new List <SObject>();
if (trigger.isBefore && trigger.isUpdate) {
	System.debug('update trigger callded');
	for (Complaint__c compObj1 : Trigger.New) {

		compObj1.Receipt_Date__c=System.today();
		compObj1.Default_Set__c='from btach job';
		compObj1.id=compObj1.id;
		CompListUpdate.add(compObj1);

	}
	//update CompListUpdate;

	}

}