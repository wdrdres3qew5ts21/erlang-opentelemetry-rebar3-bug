-module(tracking_list_handler).

%% REST Callbacks
-export([init/2]).
-export([allowed_methods/2]).
-export([content_types_provided/2]).

%% Callback Callbacks
-export([hello_from_json/2]).


init(Req, State) ->
    {cowboy_rest, Req, State}.

allowed_methods(Req, State) ->  
    {[<<"GET">>], Req, State}.

content_types_provided(Req, State) ->
    {[
        {{<<"application">>, <<"json">>, []}, hello_from_json}
    ], Req, State}.

hello_from_json(Req, State) ->
    % hello(),
    io:format("{span,316792068077456112863315701682356462357,17280368113408128674,[],undefined,<<\"HTTP GET\">>,internal,-576460681674703000,-576460681652019000,[{'http.client_ip',<<\"127.0.0.1\">>},{'http.flavor','1.1'},{'http.host',<<\"localhost\">>},{'http.host.port',8083},{'http.method',<<\"GET\">>},{'http.scheme',<<\"http\">>},{'http.target',<<\"/trackings\">>},{'http.user_agent',<<\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36\">>},{'net.host.ip',<<\"127.0.0.1\">>},{'net.transport','IP.TCP'},{'http.request_content_length',0},{'http.response_content_length',92},{'http.status',200}],[],[],undefined,1,false,undefined}"),
    Body = <<"[{\"trackId\": 0,\"location\": \"Bangkok\",\"status\": \"IN_TRANSIT\"},{\"trackId\": 1,\"location\": \"ChiangMai\",\"status\": \"PREPARE_PACKAGE\"}]">>,
	{Body, Req, State}.
