#!/bin/bash

# Capture the starting timestamp
timestamp1=$(date +"%Y-%m-%d %H:%M:%S")
start_time=$(date +%s) # Capture start time in seconds

echo "Started at: $timestamp1"

# Operations
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

# Capture the finishing timestamp
timestamp2=$(date +"%Y-%m-%d %H:%M:%S")
end_time=$(date +%s) # Capture end time in seconds

# Calculate the total elapsed time
total_time=$((end_time - start_time))

# Convert total time to minutes and seconds
minutes=$((total_time / 60))
seconds=$((total_time % 60))

# Output results
echo "Started at: $timestamp1"
echo "Finished at: $timestamp2"
echo "Total time: $minutes minutes and $seconds seconds"

# timestamp1=$(date +%Y-%m-%d-%H-%M-%S)

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

# timestamp2=$(date +%Y-%m-%d-%H-%M-%S)

# start_time=$(date -d "$timestamp1" +%s)
# end_time=$(date -d "$timestamp2" +%s)
# total_time=$((end_time - start_time))

# echo "Started at: $timestamp1"
# echo "Finished at: $timestamp2"
# echo "Total time: $total_time seconds"


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
