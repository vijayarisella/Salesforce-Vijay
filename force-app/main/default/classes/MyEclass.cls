public class MyEclass {
public static void meth(){
list<lead> l=[select id,lastname from lead limit 150];
for(lead le : l){
le.lastname+=' updated';
}
}
}