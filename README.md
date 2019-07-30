# https://github.com/parleer/docker-wordpress


## Supported tags and Dockerfile links

- [`latest`](https://github.com/parleer/docker-wordpress/blob/master/Dockerfile)
- [`php7`](https://github.com/parleer/docker-wordpress/blob/master/Dockerfile-php7)


## What is this?

A docker image that can be used for WordPress development.

## Why?

The official wordpress docker image doesn't work well for local development. If you try to map your source folder to /var/www/html so that you can edit and run your WordPress site, it will override your wp-config.php settings, which will likely end up in you saving DB_HOST, DB_NAME, DB_USER, and DB_PASSWORD values in your git repo. 


## To use this image

### Step 1:

Setup your wp-config.php to pull DB_HOST, DB_NAME, DB_USER, and DB_PASSWORD from the environment:

```php
define("DB_HOST",     getenv("WORDPRESS_DB_HOST"));
define("DB_NAME",     getenv("WORDPRESS_DB_NAME"));
define("DB_USER",     getenv("WORDPRESS_DB_USER"));
define("DB_PASSWORD", getenv("WORDPRESS_DB_PASSWORD"));
```


### Step 2:

Create a launch script that will run this container, and mount your local folder as the source:

```bash
echo "Starting wordpress container"
docker run \
	--name www-website-com \
	-v "$(pwd)/web":/var/www/html \
	-e WORDPRESS_DB_HOST=host.docker.internal \
	-e WORDPRESS_DB_USER=root \
	-e WORDPRESS_DB_PASSWORD=root \
	-e WORDPRESS_DB_NAME=www-website-com \
	-P \
	-d flyinghippo/wordpress
```

### Step 3:

Visit your docker hosted website in a browser:

Here's a bash function that makes it easy to launch your site on MacOS.

```bash
dock () 
{ 
    command="docker ps --format='{{.Names}}' | grep -m 1 '$1'";
    site=$(eval $command);
    if [ -n "$site" ]; then
        open "http://localhost:$(docker port $site | cut -d':' -f2)";
    else
        echo 'no matching sites found.';
    fi
}
```

Then you can run:

```bash
dock website
```

and it will automatically open your default web browser to the docker port to the docker container that matches "*website*"





