# Docker for symfony 4 (LAMP stack)
Project to create webserver container for symfony

### Requirements
1. `Linux`
2. `Docker` 
3. `Docker Compose`

### Build containers
Run command: 
```
bash docker-build.sh
```

If server name is not the same as `localhost` you must modify hosts file.

Your containers are now ready.
### Start containers
Run command:
```
docker-compose up
``` 
### Stop containers
Run command:
```
docker-compose down
```

### Starting terminal of the webserver container
---------------------
Run command:
```
docker exec -it -u $USER webserver bash
```
Now you can add bundles by composer

Example:
```
cd /var/www/html/my_project_name && composer require profiler --dev
```
### Virual Hosts

After creating project you can configure vHost in `docker/config/vhosts/my_project_name.conf`

Example:
```
<VirtualHost *:80>
    ServerName my_server_name

    DocumentRoot /var/www/html/my_project_name/public
    DirectoryIndex /index.php

    <Directory /var/www/html/my_project_name/public>
        AllowOverride None
        Order Allow,Deny
        Allow from All

        FallbackResource /index.php
    </Directory>

    # uncomment the following lines if you install assets as symlinks
    # or run into problems when compiling LESS/Sass/CoffeeScript assets
    # <Directory /var/www/html/project>
    #     Options FollowSymlinks
    # </Directory>

    # optionally disable the fallback resource for the asset directories
    # which will allow Apache to return a 404 error when files are
    # not found instead of passing the request to Symfony
    <Directory /var/www/my_project_name/public/bundles>
        FallbackResource disabled
    </Directory>
    ErrorLog /var/log/apache2/my_project_name_error.log
    CustomLog /var/log/apache2/my_project_name_access.log combined

    # optionally set the value of the environment variables used in the application
    #SetEnv APP_ENV prod
    #SetEnv APP_SECRET <app-secret-id>
    #SetEnv DATABASE_URL "mysql://db_user:db_pass@host:3306/db_name"
</VirtualHost>
```

### Access

#### Webserver: `http://my_server_name`

#### phpMyAdmin: `http://localhost:8080/`
##### username: `db_user`
##### password: `secret`


### More
If you want to know more you could see https://github.com/sprintcube/docker-compose-lamp/tree/7.2.x
