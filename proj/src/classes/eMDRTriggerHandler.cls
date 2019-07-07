public class eMDRTriggerHandler {
  
public static void updatePRodEval(List<eMDR__c>eMDRistNew,List<eMDR__c> eMDRistOld){
Set<id> combObjSet = new Set<id>();
Set<Product_Evaluation__c> prodObjList = new Set<Product_Evaluation__c>();
Set <eMDR__c> emdrtoUpdate = new Set<eMDR__c> ();
eMDR__c emdrObj1 = new eMDR__c ();
System.debug('newinfo'+eMDRistNew);
System.debug('oldinfo'+eMDRistOld);
String prodEvalname ='';
for (eMDR__c emdrObj :eMDRistNew) {
//combObj.id=emdrObj.Complaint__c;
combObjSet.add(emdrObj.Complaint__c);

}
List <Complaint__c> combObjList= new List<Complaint__c>();
combObjList=[select id,(select id,name from Product_Evaluations__r) from Complaint__c where id in:combObjSet];
for (Complaint__c compobj :combObjList) {
for (Product_Evaluation__c prdoEvalObj :compobj.Product_Evaluations__r){
  prodEvalname=prodEvalname+prdoEvalObj.name;
  

System.debug('prdoEvalObj'+prdoEvalObj);
}
for (eMDR__c emdrObj2 :eMDRistNew) {


emdrObj2.Prod_Eval_Name__c=prodEvalname;
}
}

}



}