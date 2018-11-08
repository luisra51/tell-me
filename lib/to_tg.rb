def to_tg(chat_id, msg)
  config = File.read('config.json')
  cnf = JSON.parse(config)
  uri = URI.parse("https://#{cnf["tg"]["url"]}/#{cnf["tg"]["tocken"]}/sendMessage")
  request = Net::HTTP::Get.new(uri)
  request.set_form_data(
    "chat_id" => "#{chat_id}",
    "text" => "#{msg}",
  )
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
