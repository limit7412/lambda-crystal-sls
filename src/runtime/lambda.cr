require "json"
require "http/client"

module Serverless
  module Lambda
    extend self

    def handler(name : String)
      return if name != ENV["_HANDLER"]

      ENV["SSL_CERT_FILE"] = "/etc/pki/tls/cert.pem"

      loop do
        response = HTTP::Client.get "http://#{ENV["AWS_LAMBDA_RUNTIME_API"]}/2018-06-01/runtime/invocation/next"
        event = JSON.parse(response.body)
        request_id = response.headers["Lambda-Runtime-Aws-Request-Id"]

        begin
          body = yield event
          header = nil
          url = "http://#{ENV["AWS_LAMBDA_RUNTIME_API"]}/2018-06-01/runtime/invocation/#{request_id}/response"
        rescue
          body = {
            statusCode: 500,
            body:       {
              "msg": "Internal Lambda Error",
            }.to_json,
          }
          header = HTTP::Headers{"Lambda-Runtime-Function-Error-Type" => "Unhandled"}
          url = "http://#{ENV["AWS_LAMBDA_RUNTIME_API"]}/2018-06-01/runtime/invocation/#{request_id}/error"
        end

        HTTP::Client.post url, headers: header, body: body.to_json
      end
    end

    def print_log(log : String)
      log.split(//).each_slice(50000) do |line|
        puts `echo '#{line.join.gsub(/(\r\n|\r|\n|\f)/, "")}'`
        STDOUT.flush
      end
    end
  end
end
