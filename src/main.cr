require "./runtime/handler"
require "./runtime/error"

Lambda.handler "hello" do |event|
  begin
    {
      statusCode: 200,
      body:       {
        msg: "さよなら透明だった僕たち",
      }.to_json,
    }
  rescue err
    # LambdaError.alert err
    puts err.to_s
    raise err
  end
end
