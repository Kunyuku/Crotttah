# if you havent done it yet, please download the tor-browser and start it
# https://www.torproject.org/download/download-easy.html.en
wget https://www.torproject.org/dist/torbrowser/5.0/tor-browser-linux64-5.0_en-US.tar.xz
tar xf tor-browser-linux64-5.0_en-US.tar.xz

# download the source of proxychains-ng
git clone https://github.com/rofl0r/proxychains-ng.git

cd proxychains-ng

# configure and install 
./configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
sudo make install-config # installs /etc/proxychains.conf

# I've noticed that is better to change one default line
# in /etc/proxychains.conf to what tor browser (i.e. firefox)
# is using as can be seen here: http://i.imgur.com/pKuqHPU.jpg

sudo gedit /etc/proxychains.conf
Chanege last line in the file:
from “socks4     127.0.0.1 9050” to “socks5     127.0.0.1 9150”

# to test if proxychains4 goes through tor 
# we can do two simple tests. For this we need elinks and iftop

sudo apt-get install elinks iftop
