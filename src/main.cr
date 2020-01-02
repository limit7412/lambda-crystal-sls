require "./runtime/handler"
require "./runtime/error"

Lambda.handler "hello" do |event|
  begin
    raise "死にました"
    {
      statusCode: 200,
      body: event["body"].to_s,
    }
  rescue err
    LambdaError.alert err
    raise err
  end
end
