echo "alias super-update='sudo apt update && sudo apt upgrade -y'" >> ~/.bashrc
echo "alias super-apt='sudo apt -y '" >> ~/.bashrc
echo "alias build-code33='cd /mnt/development && sh linux-scripts/build-sdk.sh '"  >> ~/.bashrc
cd ~
source .bashrc
