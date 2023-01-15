@RestResource(urlMapping='/someOther/*')
  global class ApiService2 {
    private static final IRequestResolver resolver = new someOtherRequestResolver(RestContext.request);

    @HttpGet
    global static Api.Response doGet() {
        Api.HANDLER_NAME = 'ApiHandler2';
        return Api.Facade.doGet(resolver);
    }
}
