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
    Body = <<"[{\"trackId\": 0,\"location\": \"Bangkok\",\"status\": \"IN_TRANSIT\"},{\"trackId\": 1,\"location\": \"ChiangMai\",\"status\": \"PREPARE_PACKAGE\"}]">>,
	{Body, Req, State}.
