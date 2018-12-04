require "json"
require "http/client"

macro lambda_handler(func)
  module Lambda
    extend self

    def run
      while true
        response = HTTP::Client.get "http://#{ENV["AWS_LAMBDA_RUNTIME_API"]}/2018-06-01/runtime/invocation/next"
        event = JSON.parse(response.body)
        request_id = response.headers["Lambda-Runtime-Aws-Request-Id"]

        body = {{ func }} event["body"]

        url : String = "http://#{ENV["AWS_LAMBDA_RUNTIME_API"]}/2018-06-01/runtime/invocation/#{request_id}/response"
        HTTP::Client.post url, body: body.to_json
      end
    end
  end
end

Lambda.run()
