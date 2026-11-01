public class OAuthUtility {
    public static String getAccessToken(String instanceUrl, String clientId, String clientSecret, String username, String password) {
        HttpRequest req = new HttpRequest();
        system.debug('inside utility');
        req.setMethod('POST');
        req.setEndpoint(instanceUrl + '/services/oauth2/token');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        
        String body = 'grant_type=password'
                    + '&client_id=' + EncodingUtil.urlEncode(clientId, 'UTF-8')
                    + '&client_secret=' + EncodingUtil.urlEncode(clientSecret, 'UTF-8')
                    + '&username=' + EncodingUtil.urlEncode(username, 'UTF-8')
                    + '&password=' + EncodingUtil.urlEncode(password, 'UTF-8');
        
        req.setBody(body);
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        system.debug('inside untilitye--------------'+res.getStatusCode());
        if (res.getStatusCode() == 200) {
            // Parse the response to extract the access token
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            return (String) result.get('access_token');
        } else {
            System.debug('Failed to get access token. Status: ' + res.getStatusCode());
            return null;
        }
    }
}