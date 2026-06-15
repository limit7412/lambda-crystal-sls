require "json"
require "./runtime/lambda"
require "./runtime/error"

Serverless::Lambda.handler "hello" do |_|
  begin
    {
      statusCode: 200,
      body:       {
        msg: "さよなら透明だった僕たち",
      }.to_json,
    }
  rescue error
    # Serverless::Alert.post error
    Serverless::Lambda.print_log error.to_s
    raise error
  end
end

Serverless::Lambda.handler "world" do |event|
  begin
    {
      statusCode: 200,
      body:       {
        msg:   "でしょうねミスター・サーバーレス",
        event: JSON.parse(event["body"].to_s),
      }.to_json,
    }
  rescue error
    # Serverless::Alert.post error
    Serverless::Lambda.print_log error.to_s
    raise error
  end
end
