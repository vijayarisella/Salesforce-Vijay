public with sharing class WrapperEx1 {
    
    public List<employee1> lstEmp{get; set;}
    
    
    public WrapperEx1(){
        
        lstEmp = new List<Employee1>();       
        
        lstEmp.add(new Employee1('ABC','c@k.com',6000,'3412342134234'));
        lstEmp.add(new Employee1('BCD','c@k.com',5000,'3412342134234'));
        lstEmp.add(new Employee1('CDE','c@k.com',7000,'3412342134234'));
        lstEmp.add(new Employee1('DEF','c@k.com',4000,'3412342134234'));
        
    }
    public class Employee1 {
    
    public string name{get; set;}
    public string email{get; set;}
    public integer salary{get; set;}
    public string ephone{get; set;}
    public integer annual{get; set;}
    
    public Employee1(string a, string b, integer c, string d){
        name = a;
        email = b;
        salary = c;
        ephone=d;
        annual = salary*12;
    } 
    
    
}
    
}