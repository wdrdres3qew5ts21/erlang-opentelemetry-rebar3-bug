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
	{Body, Req, State}.

hello_to_text(Req, State) ->
	{<<"REST Hello World as text!">>, Req, State}.
