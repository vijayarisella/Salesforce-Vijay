public class Myclass {
public static void meth(){

for(lead le : [select id from lead limit 150]){
le.lastname=' updated';
   le.DoNotCall=true;
    update le;
}
   
}
}