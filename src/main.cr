require "json"

stdin = JSON.parse(STDIN.gets_to_end)

p stdin["body"].to_json
