%% Feel free to use, reuse and abuse the code in this file.

%% @doc Hello world handler.
-module(index_handler).

-export([init/2]).
-export([content_types_provided/2]).
-export([hello_to_json/2]).
-export([hello_to_text/2]).
-include_lib("opentelemetry_api/include/otel_tracer.hrl").
init(Req, Opts) ->
	{cowboy_rest, Req, Opts}.

content_types_provided(Req, State) ->
	{[
		{<<"text/html">>, hello_to_json},
		{<<"application/json">>, hello_to_json},
		{<<"text/plain">>, hello_to_json}
	], Req, State}.

hello_to_json(Req, State) ->
    Body = "{\"message\": \"[Tracking-Service] Erlang Openshift Contaienr Image\"}",
	io:format("{span,316792068077456112863315701682356462357,17280368113408128674,[],undefined,<<\"HTTP GET\">>,internal,-576460681674703000,-576460681652019000,[{'http.client_ip',<<\"127.0.0.1\">>},{'http.flavor','1.1'},{'http.host',<<\"localhost\">>},{'http.host.port',8083},{'http.method',<<\"GET\">>},{'http.scheme',<<\"http\">>},{'http.target',<<\"/\">>},{'http.user_agent',<<\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36\">>},{'net.host.ip',<<\"127.0.0.1\">>},{'net.transport','IP.TCP'},{'http.request_content_length',0},{'http.response_content_length',92},{'http.status',200}],[],[],undefined,1,false,undefined}"),
	{Body, Req, State}.

hello_to_text(Req, State) ->
	{<<"REST Hello World as text!">>, Req, State}.
