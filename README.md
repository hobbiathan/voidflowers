# README

Recreation of an old site that previously operated under the domain 'vacuumflowers.com'

Reimplementation from statically coded JavaScript to a dynamic Rails Engine. 

# Setup
After cloning the project into a local repostiory, do the following in its respective order:

`bundle install`

`rails db:{create,migrate}`

When visting your localhost session, navigate to `localhost:3000/register` to register a user. One of the fields required to register a user is a `Uniqkey`. 

This key is `582efb7c-e6e1-4882-91d6-2a41b04a1302`, which can also be found in your `config/application.yml` file. 

Currently, this is only included in the repository as an example of how the `ENV["UNIQ"]` variables work _however, this key should be changed to any other unique, random string of characters and prevented from being read by git if you intend on using this application._ 

The reason why I implemented this design was specifically to restrict user access and registration: I didn't feel that I wanted to manually go into the rails console to generate a user, so I decided to learn about user sessions and registration/login forms.

_Voidflowers_ is meant to be a _personal_ project repository, so there should only ever be _1_ user. Though the current functionality allows for more than a sole user, it's a feature implemented just for the sake of learning. 

# Existing features
Currently, the application contains a handful of features:

  * User registration
  * User login
  * Project index show page
  * Project creation page
  * Session handling
  * ActiveStorage 
  * BCrypt password encryption
  * User registration restriction via enivornment variables with Figaro
  * Chic automated redirects via JS



# TBD
Things to be implemented:

  * Restrospective testing 
  * lol
 
