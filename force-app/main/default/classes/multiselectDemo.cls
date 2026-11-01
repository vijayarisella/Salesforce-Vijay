public class multiselectDemo
{
    public PageReference DummyAction()
    {
        return null;
    }

    public List<SelectOption> listOfColors{get; set;}
    public List<String> SelectedColor{get; set;}
    public multiselectDemo()
    {
    listOfColors=new list<SelectOption>{};
    SelectedColor=new list<String>{};
    listOfColors.add(new SelectOption('Red','Red'));
    listOfColors.add(new SelectOption('blue','blue'));
    listOfColors.add(new SelectOption('Green','Green'));
    listOfColors.add(new SelectOption('yellow','yellow'));
    }
                
}