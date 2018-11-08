# Tell-Me
Send message within slack or telegram channels


## Cases of uses

     # scripts
     # notifications or alarms

### Message to Telegram:

    $ curl -X POST -H 'Content-Type: application / json' -H 'X-Api-Key: secre' -d '{"app": "ETL sql to csv", "msg": "Finish"} 'http(s)://<services-ip>/to-tg

### Message to SLACK:

    $ $ curl -X POST -H 'Content-Type: application / json' -H 'X-Api-Key: secre' -d '{"channel": "@user or #channel", "username": "Tittle msg "," msg ":" End "} 'http(s)://<services-ip>/to-slack


## Security
This api is protected by an API-Key defined in the header of the request <code> X-Api-Key </ code>. Remember to lift the service by HTTPS for greater security and prevent seeing API-Key through traffic.
