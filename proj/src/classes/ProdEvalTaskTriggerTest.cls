@isTest 

private class ProdEvalTaskTriggerTest {
	
	@isTest static void test_method_one() {
		

		Complaint__c comp = new Complaint__c();
		comp.name='rupesh';
		
		insert comp;
		Product_Evaluation__c prod = new Product_Evaluation__c();
		prod.Complaint__c=comp.id;
		insert prod;
		Prod_Eval_Task__c so = new Prod_Eval_Task__c();
		Product_Evaluation__c prod1=[select id, name, Complaint__r.id from Product_Evaluation__c where id =:prod.id ];
		so.name='test222d'; 
		so.Product_Evaluation__c=prod1.id; 
		so.Complaint__c=prod1.Complaint__r.id; 
		insert so;

	}
	
	
	
}