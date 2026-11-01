trigger AppleWatch on Opportunity (after insert) {
for(opportunity opp:Trigger.new)
    {
    Task t= new Task();
    t.subject='apple watch demo';
    t.description ='send watch asap';
    t.priority='High';
    t.WhatId=opp.id;
    insert t;
    }
}