# erlang-opentelemetry-rebar3-bug
```
[%% Kernel/logger
 {kernel, [{logger,[{handler,default,logger_std_h,#{}}]}
          %%,{logger_level,debug}
          ]},
   {opentelemetry,
  [{processors, 
    [{otel_batch_processor,
        #{exporter => {opentelemetry_exporter, #{protocol => http,
                                                 endpoints => ["http://localhost:4317"],
                                                 headers => [{"x-honeycomb-dataset", "experiments"}]}}}}]}]}
].
```
Running Project with `rebar3`
1. Application will running on Port :8083
2. run `Nginx` at port `:4317` to mock OTLP Collector
3. When Visit `GET /` Endpoint should sent Opentelemetry to Configured Endpoint
4. [Alternative Debugging] run `docker-compose up` then you should have real OTLP collector running at port `gRPC:4317` too (I had already tried but it didn't work)
#### Expected Bahavior
Erlang Application should sent Traces with `:POST` method to Nginx but currently it didn't work for both GRPC and HTTP
#### Running Local Project
This command will give you successful connect with Open Telemetry
```
rebar3 shell

docker run -p 4317:80 docker.io/nginx
```