timestamp1=$(date +%Y-%m-%d_%H-%M-%S)

rm -rf sdk 
rm -rf sdk_old
rm -rf frameworks
sh scripts/update-repos.sh
sh scripts/install-frameworks.sh 9
sh scripts/install-frameworks.sh 10
sh scripts/install-frameworks.sh 11
sh scripts/install-frameworks.sh 12
sh scripts/install-frameworks.sh 13
sh scripts/install-frameworks.sh 14
sh scripts/install-frameworks.sh 15

timestamp2=$(date +%Y-%m-%d_%H-%M-%S)

start_time=$(date -d "$timestamp1" +%s)
end_time=$(date -d "$timestamp2" +%s)
total_time=$((end_time - start_time))

echo "Started at: $timestamp1"
echo "Finished at: $timestamp2"
echo "Total time: $total_time seconds"


# timestamp1=$(date +%Y-%m-%d_%H-%M-%S)
# rm -rf sdk 
# rm -rf sdk_old
# rm -rf frameworks
# sh scripts/update-repos.sh
# sh scripts/install-frameworks.sh 9
# sh scripts/install-frameworks.sh 10
# sh scripts/install-frameworks.sh 11
# sh scripts/install-frameworks.sh 12
# sh scripts/install-frameworks.sh 13
# sh scripts/install-frameworks.sh 14
# sh scripts/install-frameworks.sh 15
# timestamp2=$(date +%Y-%m-%d_%H-%M-%S)

 
#mv sdk*.xz sandbox
#cp -r --remove-destination sdk-* sandbox-sdk-folders/
#rm -rf sdk-gcc*
