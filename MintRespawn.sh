# This is a bash script that installs all the basic tools for my Mint machines

# Move to home dir and make sure git and pip are installed
cd ~
sudo apt install -y python3-pip
sudo apt install -y git

# Sublime Text install
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-text

# Make a tools dir and download linpeas
mkdir Tools
cd Tools
wget https://github.com/carlospolop/PEASS-ng/releases/download/20230129/linpeas.sh

# Go back to home dir
cd ~

# Make a Wordlist dir and download my wordlists
mkdir Wordlists
cd Wordlists
wget https://github.com/praetorian-inc/Hob0Rules/raw/master/wordlists/rockyou.txt.gz
gunzip rockyou.txt.gz
wget https://github.com/daviddias/node-dirbuster/raw/master/lists/directory-list-2.3-medium.txt

# Go back to home dir
cd ~

# Install gobuster
sudo apt install -y gobuster

# Install nmap
sudo apt install -y nmap

# Install metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall

# Clean up
rm msfinstall
rm MintRespawn.sh

# Update and Upgrade everything
sudo apt -y update
sudo apt -y upgrade
