require "json"
require "./../runtime/webhook"

module LambdaError
  extend self

  def alert(error)
    post = {
      fallback: ENV["FAILD_FALLBACK"],
      pretext:  "<@#{ENV["SLACK_ID"]}> #{ENV["FAILD_FALLBACK"]}",
      title:    error.message,
      text:     error.backtrace.join("\n"),
      color:    "#EB4646",
      footer:   "function-name",
    }
    body = {
      attachments: [post],
    }

    slack = WebHook.new "#{ENV["WEBHOOK_URL_ERR"]}"
    slack.post body

    raise error
  end
end
