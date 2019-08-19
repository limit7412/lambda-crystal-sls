require "json"
require "uri"
require "openssl"

class WebHook
  def initialize(@url : String)
    @uri = URI.parse @url
  end

  def post(body)
    ssl = OpenSSL::SSL::Context::Client.new
    # Lambda上で明示的にクライアント証明書を示す必要がある
    ssl.ca_certificates = "/etc/pki/tls/cert.pem"

    HTTP::Client.post(@uri,
      body: body.to_json,
      tls: ssl
    )
  end
end
