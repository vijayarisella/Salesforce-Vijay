public class ArrayExapmleController {
public string[] myvalue{set;get;}
public string name{get;set;}
public List<String>  result{set;get;}
public ArrayExapmleController()
{
name='prasad';
myvalue=new string[]{'a','b','c'};
result=new List<string>();
result.add('sam');
result.add('sam2');
result.add(1,'sam3');
}
}