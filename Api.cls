global abstract class Api {
    public static String HANDLER_NAME = 'ApiHandler';
    public static final String BASIC_RESPONSE = 'HTTP method not yet implemented';

    global class Response {
        global Response(String body){
            this.Success = false;
            this.ResponseBody = body;
        }
        public Boolean Success { get; set; }
        public String ResponseBody { get; private set; }
    }

    public static Facade Facade {
        get {
            if(Facade == null) {
                Facade = new Facade();
            }
            return Facade;
        }
        private set;
    }

    public class Facade {
        private Facade() { }


        public Response doGet(IRequestResolver resolver) {
            return this.getHandler(resolver).doGet(resolver);
        }

        public Handler getHandler(IRequestResolver resolver) {
            Type handlerType = Type.forName(Api.HANDLER_NAME + resolver.ApiName());
            return handlerType != null ? (Api.Handler)handlerType.newInstance() : new Api.Handler();
        }
    }

    public virtual class Handler {
        //enforce zero argument constructor
        public Handler() { }

        public virtual Response doDelete(IRequestResolver resolver) { return getResponse(BASIC_RESPONSE); }
        public virtual Response doGet(IRequestResolver resolver) { return getResponse(BASIC_RESPONSE);  }
        public virtual Response doPatch(IRequestResolver resolver) { return getResponse(BASIC_RESPONSE); }
        public virtual Response doPost(IRequestResolver resolver) { return getResponse(BASIC_RESPONSE); }
        public virtual Response doPut(IRequestResolver resolver) { return getResponse(BASIC_RESPONSE); }

        protected Response getResponse(String responseBody) {
            return new Response(responseBody);
        }
    }
}
