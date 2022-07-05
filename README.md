# Voidflowers

Voidflowers is a recreation of an old site that previously operated under the domain "vacuumflowers.com", reimplemented from statically coded JavaScript to a more dynamic Rails application.

## Live Application

https://voidflowers.io


## Prerequisites

* Ruby 2.7.4
* Rails 5.2.7
* PostgreSQL
* DigitalOcean Spaces Account (Optional)
* Spotify API Account (Optional)

## Setup

After cloning the project into a local repository, the following should be done:

`bundle install`

`rails db:{create,migrate}`

`rails active_storage:install`

Running `rails s` will start the application on `localhost:3000`.

After doing the following, the `config/application.yml` file should be modified so that the `UNIQKEY` attribute has a different value - failing to do such potentially risks and live and public instance of this application to have external users register, having them add their own content to the site. 

Alternatively, after creating an account through the `"/register"` method, or directly via the Rails console, the route to `"/register"` can in theory just be deleted.

Setting up DigitalOcean spaces is best done if googled on your own; I really am not fluent in this process yet and trying to describe it would likely be a larger setback to getting this project up and running than anything - that being said, DigitalOcean Spaces is not required for a local instance, and the storage can be set to local. 

_Note: if this application were to be hosted on Heroku, however, using local storage will seem to work temporarily, but will later cause issues - use some cloud service if you want to host this live._

If you'd like to have the Spotify functionality where you can display the most recent song played, you'll need a Spotify Developer account and an application on there; Get the Client ID and Client Secret, and place them in the `config/application.yml` file under `SPFY_CLIENT_ID` and `SPFY_CLIENT_SECRET` and set up the application with the appropriate redirects that Spotify wants.

_Do not commit your config/application.yml file. This is only done within my repository as an example, my keys are changed and/or not comitted for my live application._

After all this, Voidflowers should be up and running! Feel free to add projects and click the `flowers` button.
w

## Existing Features

* User registration/login
* Session handling
* Credential encryption
* ActiveStorage/DigitalOcean Spaces file handling
* Spotify API consumption


## Features to implement


* Retrospective testing (not a feature but yeah)
  * Notably, testing for ActiveStorage uploads
* Project UPDATE/DELETE
* User UPDATE/DELETE
* Proper seeding (User, Projects, Spotify Songs)
* CircleCI implementation (just never worked for some reason)
* AWS/DigitalOcean Deployment
* `cron` job to update Spotify recently played
* Gene Sequencer 
