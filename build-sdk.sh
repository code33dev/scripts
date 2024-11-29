rm -rf sdk 
rm -rf sdk_old
sh scripts/update-repos.sh
sh scripts/install-frameworks.sh 9
sh scripts/install-frameworks.sh 10
sh scripts/install-frameworks.sh 11
sh scripts/install-frameworks.sh 12
sh scripts/install-frameworks.sh 13
sh scripts/install-frameworks.sh 14
sh scripts/install-frameworks.sh 15
#mv sdk*.xz sandbox
#cp -r --remove-destination sdk-* sandbox-sdk-folders/
#rm -rf sdk-gcc*
