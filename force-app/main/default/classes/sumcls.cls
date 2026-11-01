public with sharing class sumcls {
    public integer sum {get;set;}
    public integer discount {get;set;}
    public integer out {get;set;}
    
   
    
    public pagereference result(){
        out = sum-discount;
        return null;
    }
}