
# Build, Deploy Web Server and Database Server on Virtual Machines





## Authors

- [@jkpraja](https://www.github.com/octokatherine)


## Topology
![Topology](https://github.com/jkpraja/devops/blob/main/Topology%20Infra%20on%20Prem.png?raw=true)
## You'll need
- 2 Virtual Machines
- Wordpress latest source code
- Landing page source code
- Social media source code
## How To Get Started
#Setting Up The Virtual Machines
- VM1 as Apache Server
    1. Run vagrant init [vagrantboxes]. In this case, I use ubuntu/focal64.
    2. Edit Vagrantfile, enable the public_network and set the desired IP for Private Network.

- VM2 as Databse Server
    1. Run vagrant init [vagrantboxes]. In this case, I use ubuntu/focal64.
    2. Edit Vagrantfile, enable the public_network and set the desired IP for Private Network.


    
## Installation

Install the apache server and PHP with installweb.sh

```bash
  ./installweb.sh

```
Install the database server with installweb.sh

```bash
  ./installdbserver.sh

```
    
## Configuration

On Web Server 

To deploy the landing page

```bash
  git clone [landing-page-url]

  rm -rf /var/www/html
  ln -sf /home/user/[landing-page-folder] /var/www/html
```

To deploy the social media app

```bash
  git clone [social-media-url]

  ln -sf /home/user/[social-media-folder] /var/www/sosmed
  vim /var/www/sosmed/config.php
```

To deploy the wordpress

```bash
  wget https://wordpress.org/latest.tar.gz

  tar -xzvf latest.tar.gz

  ln -sf /home/user/[wordpress-folder] /var/www/wordpress
  cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
  vim /var/www/wordpress/wp-config.php
```

On DB Server

Create wordpress database

```bash
  CREATE DATABASE wordpress_db_name;
  CREATE USER 'wordpressuser'@'iphost' IDENTIFIED BY 'password';
  GRANT ALL ON wordpress_db_name.* TO 'wordpressuser'@'iphost';
```

Create social media database

```bash
  CREATE DATABASE socmed_db_name;
  CREATE USER 'socmedadmin'@'iphost' IDENTIFIED BY 'password';
  GRANT ALL ON socmed_db_name.* TO 'socmedadmin'@'iphost';
```
