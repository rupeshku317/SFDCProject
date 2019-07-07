@isTest
private class ProdEvalTaskTriggerHanderTest {
	
	@isTest static void test_method_one() {
		 Complaint__c compObj = new Complaint__c();
		  compObj.Name='testMethod';
		 insert compObj;
		Product_Evaluation__c prod = new Product_Evaluation__c();
		prod.Complaint__c=compObj.id;
		insert prod;
Prod_Eval_Task__c so = new Prod_Eval_Task__c();
		so.name='rupesh2';
		so.Product_Evaluation__c=prod.id;
		so.Complaint__c=compObj.id;
		insert so;
		so.Default_Set__c='gggg';
		update so;


		 
}

		
		
		




		// Implement test code
	
	
}