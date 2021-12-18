%%
%% Copyright (C) 2014 Björn-Egil Dahlberg
%%
%% File:    dockerwatch_sup.erl
%% Author:  Björn-Egil Dahlberg
%% Created: 2014-09-10
%%

-module(dockerwatch_sup).
-behaviour(supervisor).
-include_lib("opentelemetry_api/include/otel_tracer.hrl").
%% API.
-export([start_link/0]).

%% supervisor.
-export([init/1]).
% -include_lib("opentelemetry_api/include/otel_tracer.hrl").
%% API.


-spec start_link() -> {ok, pid()}.
start_link() ->
	io:format("=======Before======="),
	opentelemetry_cowboy:setup(),
	io:format("=======start_link======="),
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% supervisor.

init([]) ->
	Procs = [],
	{ok, {{one_for_one, 10, 10}, Procs}}.
