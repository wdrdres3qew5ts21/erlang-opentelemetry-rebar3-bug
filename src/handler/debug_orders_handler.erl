-module(debug_orders_handler).

%% REST Callbacks
-export([init/2]).
-export([allowed_methods/2]).
-export([content_types_provided/2]).

%% Callback Callbacks
-export([hello_to_json/2]).

init(Req, State) ->
    {cowboy_rest, Req, State}.

allowed_methods(Req, State) ->  
    {[<<"GET">>], Req, State}.

content_types_provided(Req, State) ->
    {[
        {<<"text/html">>, hello_to_json},
		{<<"application/json">>, hello_to_json},
		{<<"text/plain">>, hello_to_json}
    ], Req, State}.

hello_to_json(Req, State) ->
    Method = get,
    % Domain = os:getenv("ORDER_API","http://localhost:8081"),  http://tracing-order-service:8081/orders
    % Endpoint= Domain++"/orders",
    Endpoint="http://tracing-order-service:8081/orders",
    io:format(Endpoint++"~n"),
    Headers = [],
    Payload = <<>>,
    Options = [],
    % {ok, StatusCode, RespHeaders, ClientRef} = hackney:request(Method, Endpoint,
     {ok, _, _, ClientRef} = hackney:request(Method, Endpoint,
                                                            Headers, Payload,
                                                            Options),
    {ok, OrdersResponse} = hackney:body(ClientRef),
	{OrdersResponse, Req, State}.