require "./runtime/handler"
require "./runtime/error"

Lambda.handler "hello" do |event|
  begin
    # raise "死にました"
    event["body"]
  rescue err
    LambdaError.alert err
    raise err
  end
end
