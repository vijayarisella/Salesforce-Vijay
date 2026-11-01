public class OAuthUtils {

    public static String getAccessToken(Creds__c cred) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        
        String body = 'grant_type=password'
            + '&client_id=' + EncodingUtil.urlEncode(cred.clientid__c, 'UTF-8')
            + '&client_secret=' + EncodingUtil.urlEncode(cred.Client_Secret__c, 'UTF-8')
            + '&username=' + EncodingUtil.urlEncode(cred.Username__c, 'UTF-8')
            + '&password=' + EncodingUtil.urlEncode(cred.Password__c, 'UTF-8');
        
        req.setBody(body);
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        if (res.getStatusCode() == 200) {
            Map<String, Object> resMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            return (String) resMap.get('access_token');
        } else {
            throw new CalloutException('Failed to get access token: ' + res.getBody());
        }
    }
}