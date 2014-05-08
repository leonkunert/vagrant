sudo apt-get update

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

sudo apt-get install -y vim curl python-software-properties
sudo add-apt-repository -y ppa:ondrej/php5
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update

sudo apt-get install -y php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-readline mysql-server-5.5 php5-mysql git-core php5-xdebug python-software-properties python g++ make nodejs ghostscript imagemagick zsh vim-nox

cat << EOF | sudo tee -a /etc/php5/mods-available/xdebug.ini
xdebug.scream=1
xdebug.cli_color=1
xdebug.show_local_vars=1
xdebug.var_display_max_data=2048
EOF

sudo chsh vagrant -s /usr/bin/zsh

git clone http://github.com/leonkunert/dotfiles /home/vagrant/dotfiles
ln -s /home/vagrant/dotfiles/.zsh /home/vagrant/.zsh
ln -s /home/vagrant/dotfiles/.zshrc /home/vagrant/.zshrc
ln -s /home/vagrant/dotfiles/.zlogin /home/vagrant/.zlogin
ln -s /home/vagrant/dotfiles/.vim /home/vagrant/.vim
ln -s /home/vagrant/dotfiles/.vimrc /home/vagrant/.vimrc
cd /home/vagrant/dotfiles && sudo git submodule update --init
mkdir /home/vagrant/.vimbackup -m 0777

sudo npm update -g
sudo npm install -g grunt-cli
sudo npm install -g bower

sudo a2enmod rewrite

sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf

sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini
sed -i "s/disable_functions = .*/disable_functions = /" /etc/php5/cli/php.ini

sudo service apache2 restart

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
