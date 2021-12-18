# erlang-opentelemetry-rebar3-bug
Running Project with `rebar3`
1. Application will running on Port :8083
2. When Visit `GET /` Endpoint should see opentelemetry traccing at console  success
#### Running Local Project
This command will give you successful connect with Open Telemetry
```
rebar3 shell
```
#### Compile with Rebar3 to single package
Running Project with `compiled rebar3` will give error
1. Application will running on Port :8083
2. When Visit `GET /` Endpoint should see error about handler detach
```
rebar3 as prod release
```
#### You will encounter bug about handler detach
Rebar3 compiled package will have problem about Open Telemtry
```
./_build/prod/rel/dockerwatch/bin/dockerwatch console
```