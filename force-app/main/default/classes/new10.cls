public class new10 {

    public String str { get; set; }
    public List<Account> abc{set; get;}
    public void data()
    {
    abc=[select id, Name from account where name like :str];
    if (abc.size()<=0)
    apexpages.addmessage(new apexpages.message(apexpages.severity.warning, 'sorry no account found of such name'));
    }
}