({
    getOptys : function(component) {
        
         var action = component.get("c.getOpportunities");
        console.log("in client");
        debugger;
        action.setCallback(this, function(response){
            
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.opportunities", response.getReturnValue());
                console.log("in clent Responser",response.getReturnValue());
                debugger;
            alert("From server: " +response.getReturnValue() );
            }
             
        });
	 $A.enqueueAction(action);
    }
})