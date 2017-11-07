# What's this?
This skeleton allows to have a working Silex application running inside a docker container completely out of the box.
The application is ready to be run locally by executing the `config/up.sh` script.
# Features
* Run as a Docker container: it can be deployed in any decent modern server. It can also be deployed as a Heroku App in a couple of minutes
* Apache with configurable ports: Both the external and the internal ports are configurable as environment variables. This allows to run the container as a non-root user, so Apache can bind ports other than 80 and 443
* Silex application: backed and endorsed by Symfony and its components, nothing else to say.
* Service and routing registrars: register services (and controllers) and routes in easily
* Packed with Bootstrap and jQuery: included from CDNs in the Twig layout