@RestResource(urlMapping='/api/*')
global class ApiService {
    private static final IRequestResolver resolver = new ApiRequestResolver(RestContext.request);

    @HttpGet
    global static Api.Response doGet() {
        return Api.Facade.doGet(resolver);
    }
}
