require "./../runtime/handler"
require "./../runtime/error"

def hello(event)
  begin
    # raise "死にました"
    event["body"]
  rescue err
    LambdaError.alert err
    raise err
  end
end

lambda_handler(hello)
