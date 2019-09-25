# Run API 

```
$ docker-compose build
$ docker run api rake db:migrate
$ docker run api rake db:seed
$ docker-compose up
```


[Postman Collection](https://documenter.getpostman.com/view/323895/SVn2NvbJ)




## SignUp 
Api endpoint `/subscriptions`  require user authenitcation

When you `sign_up / sign_in`, following headers will be returned:
  - `access-token`
  - `client`
  - `uid`

Requests made to `/subscription` endpoints require meantioned headers to authenticate user. 