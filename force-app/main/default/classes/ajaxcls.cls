public class ajaxcls {

    public string name{get; set;}
    public boolean display{get;set;}
    public ajaxcls(){
        name='test';
        display=false;
    }
    
    public void change(){
        name='testing';
        display=true;
    }
    
    public void unchange(){
        name='test';
    }

}