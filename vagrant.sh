#!/usr/bin/env bash
# ==================== INSTALLATION =========================

# add new repositories and install everything

# update everything if not

sudo su -

apt-get update

# ------- PPA's -------

# utility to be able to use apt-add-repository
apt-get install -y python-software-properties

# we try to avoid running it by checking if the script didn't come from vagrant
if [ ! -t 0 ]; then
	# add ppa's
	add-apt-repository -y ppa:ondrej/php5-5.6
	# update list with new ppa's
	apt-get update
fi

# install required packages
apt-get install -y php5 php5-fpm php5-mysql php5-mongo php5-curl php5-mcrypt nginx curl

# install composer
if [ ! -f /usr/local/bin/composer ]; then
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
    composer global require "fxp/composer-asset-plugin:~1.1.1"
else
	composer self-update
	composer global update --prefer-dist
fi

echo 'include /vagrant/vhosts/*;' >> /etc/nginx/sites-enabled/default