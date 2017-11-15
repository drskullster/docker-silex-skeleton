## What's this?
This skeleton allows to have a working Silex application running inside a docker container completely out of the box, and configurable through environment variables.
## Features 
* Run as a Docker container: only one dependency, Docker. It can be deployed in any decent modern server. It can be deployed in a matter of minutes
* Apache with configurable ports: Both the external and the internal ports are configurable. This allows to run the container as a non-root user (as some third-party Docker build services do), so Apache can bind ports other than 80 and 443
* Silex application: backed and endorsed by Symfony and its components, nothing else to say.
* Service and routing registrars: register services (and controllers) and routes easily
* Packed with Bootstrap and jQuery: included from CDNs in the Twig layout
* `up.sh` included: get the application running in your local with the simple command `./deploy/up.sh`
* Lots of environment variables to configure
## How to use it
* This skeleton is available as a [composer package in packagist.org](https://packagist.org/packages/gbmcarlos/docker-silex-skeleton), so you only need to run `composer create-project gbmcarlos/docker-silex-skeleton [folder-name]` with the name of the folder where you want to create the project
* After that, just `cd` into the project folder and start a new repository with `git init` and add your remote with `git remote add origin https://github.com/{you}/{your-project}.git`
* Start working
## Requirements
* Docker
* To run it locally you wll need php and composer, as the dependencies are installed outside the docker container using composer ([here](https://getcomposer.org/download/)'s how to get composer)
## Environment variables available

|       ENV VAR      | Default value | Description |
| ------------------ | ------------- | ----------- |
| HOST_PORT          | 80            | The port Docker will use as the host port in the network bridge. This is the external port, the one your app will be called through |
| CONTAINER_PORT     | 80            | The port that Apache will listen to from inside the container. If `APACHE_USER` is a non-root user, this can not be under 1024, [here](https://www.w3.org/Daemon/User/Installation/PrivilegedPorts.html)'s why  |
| APACHE_USER        | root          | This is the user the Docker container will be run as, and therefore the user Apache will be run as. |
| HOST_NAME          | app.com       | The host name passed to Apache in the virtual host. |
| APP_ENV            | prod          | Environment variable available inside the Docker container, useful for the application. |
| APP_DEBUG          | false         | Environment variable available inside the Docker container, useful for the application. |
| XDEBUG_ENABLE      | off           | (`off`\|`on`) This options enables and disables Xdebug. |
| XDEBUG_IDEKEY      | idekey        | Specify the IDE Key for Xdebug. |
| XDEBUG_REMOTE_PORT | 9000          | Specify the remote port for Xdebug. |
| XDEBUG_REMOTE_HOST | localhost     | Specify the remote host for Xdebug |

