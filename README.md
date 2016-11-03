# README

* Ruby version

ruby 2.3.1p112

* System dependencies

no

* Configuration

no

* Database creation

Postgres used. 

To create DB,

rake db:create

rake db:migrate

* Job queue

For simplicity, job queue emulated with perform_now. No job queue services are needed right now.

* API doc

App is deployed on https://llm-coding-test.herokuapp.com/

To parse an url, send POST with `application/json` content type and `{"url": "http://google.ru"}` body on `https://llm-coding-test.herokuapp.com/urls`

To get a list of urls, GET `https://llm-coding-test.herokuapp.com/urls`.