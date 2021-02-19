require "json"

module Serverless
  module Alert
    extend self

    def post(error)
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

      HTTP::Client.post("#{ENV["FAILD_WEBHOOK_URL"]}",
        body: body.to_json
      )
    end
  end
end
