require "spec"
require "log"
require "../src/runtime/lambda"

# print_log の出力先 (stdlib Log) を捕捉するためのテスト用バックエンド。
class CaptureBackend < Log::Backend
  getter messages = [] of String

  def initialize
    super(:sync)
  end

  def write(entry : Log::Entry) : Nil
    messages << entry.message
  end
end

# ブロック実行中に lambda の Log へ出力されたメッセージを配列で返す。
def capture_lambda_logs(&)
  backend = CaptureBackend.new
  Log.setup(:debug, backend)
  yield
  backend.messages
end
