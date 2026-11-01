public class OAuthTokenService {
    public static String getAccessToken(String clientId, String clientSecret, String username, String password, String tokenUrl) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(tokenUrl);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        String body = 'grant_type=password' +
                      '&client_id=' + clientId +
                      '&client_secret=' + clientSecret +
                      '&username=' + username +
                      '&password=' + password;
        req.setBody(body);

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            Map<String, Object> authResponse = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            return (String) authResponse.get('access_token');
        } else {
            throw new AuraHandledException('Failed to get access token: ' + res.getBody());
        }
    }
}