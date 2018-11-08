# Tell-Me
Send message within slack or telegram channels



## Install & Run local mode

### Requirements
1. Environment variable
- ENV_HTTP_X_API_KEY=xXXXxx
- ENV_TG_CHATID=xXXXxx

2. Slack Incoming Webhooks
2.1. See https://api.slack.com/incoming-webhooks#enable_webhooks
2.2. Enter the token in the file config.json in the slack section.
3. Telegram token bot
3.1. See https://core.telegram.org/bots
3.2. Enter the token in the file config.json in the tg section.
```
  $ gitlab clone https://gitlab.com/luisra51/tell-me.git
  $ cd tell-me
  $ bundle install
```
## Install & Run docker-compose

### Requirements
1. Environment variable
- ENV_HTTP_X_API_KEY=xXXXxx
- ENV_TG_CHATID=xXXXxx

2. Slack Incoming Webhooks
2.1. See https://api.slack.com/incoming-webhooks#enable_webhooks
2.2. Enter the token in the file config.json in the slack section.
3. Telegram token bot
3.1. See https://core.telegram.org/bots
3.2. Enter the token in the file config.json in the tg section.
```
    $ gitlab clone https://gitlab.com/luisra51/tell-me.git
    $ cd tell-me
```   
 Edit file docker-compose.yml and change environment section
```
    $ docker-compose build
    $ docker-compose up -d
```

## Cases of uses

     # scripts
     # notifications or alarms

### Test Message to Telegram:

    $ curl -X POST -H 'Content-Type: application/json' -H 'X-Api-Key: secre' -d '{"app": "ETL sql to csv", "msg": "Finish"} 'http(s)://<services-ip>:<port>/to-tg'

### Test Message to SLACK:

    $ curl -X POST -H 'Content-Type: application/json' -H 'X-Api-Key: secre' -d '{"channel": "@user or #channel", "username": "Tittle msg "," msg ":" End "} 'http(s)://<services-ip>:<port>/to-slack'


## Security
This api is protected by an API-Key defined in the header of the request <code> X-Api-Key </code>. Remember to lift the service by HTTPS for greater security and prevent seeing API-Key through traffic.

## Contributing

This repo is a mirror of https://gitlab.com/luisra51/tell-me.git

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request in Gitlab Repo
