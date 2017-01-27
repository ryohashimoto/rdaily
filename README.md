# Rdaily

* Author: Ryo Hashimoto
* Copyright: Copyright (c) 2013-2017 Ryo Hashimoto
* License: MIT License

Blog software powered by Ruby on Rails 4.2 and Twitter Bootstrap 3

## Features

* Easy to deploy to Heroku and other environments
* Responsive layout using Twitter Bootstrap 3
* Syntax highlight for codes
* Image uploading to Amazon S3

## Deployment to Heroku

```
$ git clone https://github.com/ryohashimoto/rdaily.git
$ cd rdaily
$ heroku create rdaily
$ heroku git:remote -a rdaily
$ git push heroku master
$ heroku addons:add heroku-postgresql:dev
$ heroku run rake db:migrate
$ heroku open
```
