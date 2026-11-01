public class FlowAction {

    public class Request {
        @InvocableVariable
        public Id recordId;

        @InvocableVariable
        public Decimal amount;
    }

    @InvocableMethod(label='Update Opportunity')
    public static void updateOpp(List<Request> reqs) {
        // logic
    }
}