require "../spec_helper"

describe Serverless::Lambda do
  describe ".print_log" do
    it "改行を除去して 1 エントリにまとめる" do
      messages = capture_lambda_logs do
        Serverless::Lambda.print_log "line1\nline2\r\nline3\rline4\fline5"
      end

      messages.size.should eq(1)
      messages.first.should eq("line1line2line3line4line5")
    end

    it "50,000 文字ごとにチャンク分割する" do
      messages = capture_lambda_logs do
        Serverless::Lambda.print_log("a" * 120_000)
      end

      messages.size.should eq(3)
      messages[0].size.should eq(50_000)
      messages[1].size.should eq(50_000)
      messages[2].size.should eq(20_000)
    end

    it "空文字では何も出力しない" do
      messages = capture_lambda_logs do
        Serverless::Lambda.print_log ""
      end

      messages.should be_empty
    end
  end
end
