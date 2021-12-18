-module(dockerwatch_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).
-include_lib("opentelemetry_api/include/otel_tracer.hrl").
%% dockerwatch_app:hello().
%% API.

start(_Type, _Args) ->
	
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/", index_handler, []},
			{"/trackings", tracking_list_handler, []},
			{"/debug/orders", debug_orders_handler, []}
		]}
	]),
	{ok, _} = cowboy:start_clear(http, [{port, 8083}], #{
		env => #{dispatch => Dispatch},
		stream_handlers => [cowboy_telemetry_h, cowboy_stream_h]
	}),
	dockerwatch_sup:start_link().

stop(_State) ->
	ok = cowboy:stop_listener(http).
