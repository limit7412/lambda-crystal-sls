require "./runtime/lambda"
require "./runtime/error"

Serverless::Lambda.handler "hello" do |event|
  begin
    {
      statusCode: 200,
      body:       {
        msg: "さよなら透明だった僕たち",
      }.to_json,
    }
  rescue err
    # Serverless::Alert.post err
    Serverless::Lambda.print_log err.to_s
    raise err
  end
end
