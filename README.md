# kpt.hrysd.org

URL: https://kpt.hrysd.org

## How to development

```
$ docker-compose build
$ docker-compose run --rm rails bundle install
$ docker-compose run --rm frontend yarn install
$ docker-compose run --rm rails bin/rails db:setup
$ docker-compose up
```

then open http://localhost:3000
