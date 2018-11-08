def to_slack(channel, username, msg, attachments)
  config = File.read('config.json')
  cnf = JSON.parse(config)
  uri = URI.parse("https://#{cnf["slack"]["url"]}/services/#{cnf["slack"]["tocken"]}")
  request = Net::HTTP::Post.new(uri)
  request.content_type = "application/json"
  request.body = JSON.dump({
    "channel" => "#{channel}",
    "username" => "#{username}",
    "text" => "#{msg}",
    "attachments": attachments
  })


  req_options = {
    use_ssl: uri.scheme == "https",
  }

  response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end

  # response.code
  # response.body
  return response
end
