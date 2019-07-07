public class ProdEvalTaskTriggerHander 
{
    
   

   public  void method2(List<Prod_Eval_Task__c> newList,List<Prod_Eval_Task__c> oldList){
    Product_Evaluation__c prodEvalObj = new Product_Evaluation__c();
        Complaint__c compObj = new Complaint__c();

    System.debug('newList'+newList);
    System.debug('oldList'+oldList);
    for (Prod_Eval_Task__c newObj : newList ) {
    newObj.Default_Set__c='rupesh test';
    prodEvalObj.id=newObj.Product_Evaluation__c;
    prodEvalObj.Start_Date__c=system.today();
   Product_Evaluation__c prodEvalObj1= [select Prod_Eval_Default__c, Complaint__r.id,Complaint__r.Default_Set__c from Product_Evaluation__c where id=:prodEvalObj.id];
    prodEvalObj.Prod_Eval_Default__c=prodEvalObj1.Prod_Eval_Default__c+ newObj.Default_Set__c;
    compObj.Default_Set__c=prodEvalObj1.Complaint__r.Default_Set__c+newObj.Default_Set__c;
     compObj.id=prodEvalObj1.Complaint__r.id;
    update compObj;
    update prodEvalObj;

}
   }
   public  void method3(List<Prod_Eval_Task__c> newList,List<Prod_Eval_Task__c> oldList) {
    List <Complaint__c> medObj = new list<Complaint__c>();
            Complaint__c compObj = new Complaint__c();
           List <id> compList = new list<id>();
           Prod_Eval_Task__c newObj1= new Prod_Eval_Task__c ();


    for ( Prod_Eval_Task__c newObj : newList ) {
        compObj.id=newObj.Complaint__c;
        newObj1.id=newObj.id;
         newObj1.Default_Set__c=newObj.Default_Set__c;
        compList.add(compObj.id);
    }
        medObj=[select id,(select id,ProdEval_Task_Default_Value__c from Medical_Evaluations__r) from Complaint__c where id in :compList];

   for (Complaint__c medSingleObj: medObj) {

    for (Medical_Evaluation__c medobj1 :medSingleObj.Medical_Evaluations__r) {
        System.debug(medobj1);

        medobj1.ProdEval_Task_Default_Value__c=newObj1.Default_Set__c;
        update medobj1;
    }
   }
    

   }

}