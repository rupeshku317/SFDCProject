@isTest 

private class MedEvalTriggerTest {
	
	@isTest static void test_method() {
		

		Complaint__c comp = new Complaint__c();
		comp.name='tes123';
		
		insert comp;
		Medical_Evaluation__c medObj = new Medical_Evaluation__c();
		medObj.Complaint__c=comp.id;
		insert medObj;

		List<Medical_Evaluation__c> obj = new List<Medical_Evaluation__c>();

		obj = [select id,name, ( select id,name from Medical_Evaluation_Tasks__r) from Medical_Evaluation__c where id =:medObj.id];
		for (Medical_Evaluation__c obj1 : obj) {

			System.debug('med eval id '+obj1.id);
			System.debug('med eval id '+obj1.name);
			System.debug('med eval id '+obj1.name);
			system.assertEquals(3, obj1.Medical_Evaluation_Tasks__r.size());

for (Medical_Evaluation_Task__c meTask : obj1.Medical_Evaluation_Tasks__r) {
				System.debug('med eval id '+meTask.name);

			}


		}

	}
	
	
	
}