trigger Infinity on Opportunity (after update) {
List <opportunity> newList = new List<opportunity>();
for(opportunity opp:trigger.new){
opp.Amount=10000;
update opp;
}


}