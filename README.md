# Run API

```
$ docker-compose build
$ docker-compose run web rake db:create
$ docker-compose run api rake db:migrate
$ docker-compose run api rake db:seed
$ docker-compose up
```

Docker-compose will launch 3 containers :
  - Puma
  - Sidekiq
  - Redis

## API reference
- [Postman Collection](https://documenter.getpostman.com/view/323895/SVn2NvbJ)
- [OpenApiV3 reference]()


## SignUp

When you `sign_up / sign_in`, following headers will be returned:
  - `access-token`
  - `client`
  - `uid`

## Subscription

Requests made to `/subscription` endpoints require mentioned headers to authenticate user.

You can subscribe to specified plan only once

## Scheduled payments

`schedule.rb` file is converted to cron syntax. It does not read or write your crontab file; you'll need to do this in order for your jobs to execute:

```
$ whenever --update-crontab
```
