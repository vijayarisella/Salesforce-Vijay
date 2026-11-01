public with sharing class depPicklistcls {

    public String show { get; set; }
    public boolean disable{get; set;}   
    public List<SelectOption> accOptions{get; set;}
    public List<SelectOption> conOptions{get; set;}
    public depPicklistcls(){
    
        accOptions = new List<SelectOption>();
        for(Account acc : [Select id, name from Account order by name]){
            accOptions.add(new SelectOption(acc.id,acc.Name));
        }
        
        conOptions = new List<SelectOption>();
        for(contact con: [Select id, name from Contact order by name]){
            conOptions.add(new SelectOption(con.id,con.Name));
        }
        disable =true;
    }
    public string selAccount{get; set;}
    public void fetchData(){
        conoptions.clear();
        for(contact con: [Select id, name from Contact where AccountId=:selAccount]){
            conOptions.add(new SelectOption(con.id,con.Name));
        }
        
        if(conOptions.size()>0)
        disable = false;
        else
        disable = true;
        
        
    }
    
}