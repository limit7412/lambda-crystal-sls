require "http/client"

while true
  response = HTTP::Client.get "http://#{ENV["AWS_LAMBDA_RUNTIME_API"]}/2018-06-01/runtime/invocation/next"
  event_data = response.body
  request_id = response.headers["Lambda-Runtime-Aws-Request-Id"]

  body = event_data

  url : String = "http://#{ENV["AWS_LAMBDA_RUNTIME_API"]}/2018-06-01/runtime/invocation/#{request_id}/response"
  HTTP::Client.post url, body: body
end

