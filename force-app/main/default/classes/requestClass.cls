public with sharing class Requestclass {
    public void requestClassmethod() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint'https://reqres.in/api/users';
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200) {
            
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> reqobjs = (List<Object>) results.get('data');
            System.debug('Received the data');
            for(Object req: reqobjs) {
                System.debug(req);
                Map<String , Object> reqMap = (Map<String , Object>)req;
                system.debug(reqMap.get('id'));
            }
        }
    }
}
