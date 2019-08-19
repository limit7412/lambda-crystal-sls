require "./../runtime/handler"

def hello(event)
  event["body"]
end

lambda_handler(hello)
