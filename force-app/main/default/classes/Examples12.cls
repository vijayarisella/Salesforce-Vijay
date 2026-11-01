public class Examples12 {

    public string name;
    public string getname()
    {
        return name;
    }
    public void setname(String name)
    {
        this.name=name;
    }    
    public pagereference show()
    {
    name = 'this is your name'+name;
        return null;
    }
        
}