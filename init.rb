#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'json'
require 'net/http'
require 'uri'
require 'pry'

set :bind, '0.0.0.0'
set :port, '8081'


Dir["#{File.dirname(__FILE__)}/lib/*.rb"].each { |f| require f }


# Authenticate all requests with an API key
before do
  # X-Api-Key
  secret = ENV["ENV_HTTP_X_API_KEY"]
  puts secret
  puts env["HTTP_X_API_KEY"]
  if env["HTTP_X_API_KEY"] != secret
    if request.path.to_s == '/ok'
      'ok'
    else
      error 401
    end
  end
end

#curl -X POST -H 'Content-Type: application/json' -H 'X-Api-Key: secret' -d '{ "app": "host12.apple.com", "msg": "informa que termine" }' http://localhost:8081/to-tg


post '/to-tg' do
  request_params = JSON.parse(request.body.read)
  chat_id = ENV["ENV_TG_CHATID"]
  out = to_tg(chat_id, request_params["msg"])

  # Add record to forward and reverse zones, via TCP
  #error 500 unless $? == 0
  #status 201
  out.code
end
#curl -X POST -H 'Content-Type: application/json' -H 'X-Api-Key: secret' -d '{ "app": "host12.apple.com", "msg": "informa que termine" }' http://localhost:8081/to-slack
post '/to-slack' do
  request_params = JSON.parse(request.body.read)
  request_params["channel"] = "#general" if request_params["channel"].nil?
  request_params["username"] = "Tell-me_bot" if request_params["username"].nil?
  request_params["attachments"] = "" if request_params["attachments"].nil?
  out = to_slack(request_params["channel"], request_params["username"], request_params["msg"], request_params["attachments"])
  #error 500 unless $? == 0
  out.code
end

get '/help' do
  content_type :json
  a = File.read("README.md")
  a
end

get '/ok' do
  "OK"
end
