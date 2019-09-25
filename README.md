Run API 

```
$ docker-compose build
$ docker run api rake db:migrate
$ docker run api rake db:seed
$ docker-compose up
```


[Postman Collection](https://documenter.getpostman.com/view/323895/SVn2NvbJ)




## SignUp 
Api require user authenitcation with tokens 

When you `sign_up / sign_in` headers will be returned:
  - `access-token`
  - `client`
  - `uid`

Requests made to `/subscription` endpoints require meantioned headers to authenticate user. 

## Subscribe to Plan 
Retrive list of plans : `GET /plans`i