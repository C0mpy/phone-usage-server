# Phone-Usage data gathering server
Ruby on Rails server application that gathers data about the amount of time spent on the mobile device.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development purposes.

### Prerequisites
To run the Phone-Usage server on your local machine, you will need:
1. Development was done on Ubuntu 18.4 and the following tutorials are made with that in mind
2. [Ruby 2.5.1 and Rails](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04)
3. [Postgres](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04)
	execute steps 1 - 3
	at step 3 create a superuser role named `dev` with password `dev` and a database named `phone-usage-server_development`
4. `$ sudo apt-get install libpq-dev`

### Installing
A step by step series of examples that tell you how to get a development env running:
1. clone this repo and locate your terminal to phone-usage-server dir
	```
	$ git clone https://github.com/C0mpy/phone-usage-server
	$ cd ./phone-usage-server
	```
2. install project dependencies:
	```
	$ bundler install
	$ bundler update
	```
3. execute migrations and seed the data
	```$ rails db:migrate
	   $ rails db:seed
	```
3. start the server 
	```$ rails server```

## Deployment
Application is deployed to: [https://phone-usage-server.herokuapp.com/](https://phone-usage-server.herokuapp.com/)
Deployment is executed automaticlly when pushing to the Github repo.

## Acknowledgments
* Hat tip to [igordejanovic](https://github.com/igordejanovic) for reviewing the code