= Intro =

These are a few tools I found it useful to set up a new wordpress site.

I needed to setup a whole bunch of sites quickly so I wanted to do this as fast as possible while still understanding all the steps.

= Wordpress Setup =

This is a one time thing.

# Get wordpress:

wget https://wordpress.org/latest.tar.gz

# Create mysql user

This user will be used later when we set up our sites.

sudo mysql -p 
CREATE USER 'wordpress-user'@'localhost' IDENTIFIED BY 'your_strong_password';
FLUSH PRIVILEGES;

# Stuff to install (not installed on ubuntu by default)

sudo apt-get install realpath

= Script Setup =

First you need to setup your mysql password.

This assumes you have admin access to mysql.

echo "mysql password" >> pass

echo "mysql username" >> user

= Using the Script =

Here's how you actually use this thing.

# Create the new database. 

This is basically the name of the site or some kind of tag that you use to keep track of the site. 

This script will give you permissions to the user you noted earlier.

./create-db.sh name-of-new-site

#  
