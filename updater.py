import time
from datetime import datetime
import os
# Define the end time (24-hour format)
end_time = "00:01"

def run_task():
    # Define the task you want to perform
    print(f"Running task at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    os.system('cd /mnt/development')
    os.system('sh linux-scripts/build-sdk.sh > build.log')
    os.system('clear')

def main():
    os.system('clear')
    while True:
        # Get the current time
        nowt = datetime.now().strftime("%H:%M:%S")
        now = datetime.now().strftime("%H:%M")
        print(f"Building framework! Current time: {nowt}. Execution time: 00:01 am.", end="\r")
        # Check if the current time is equal to or later than the end time
        if now == end_time:
            run_task()
        time.sleep(1)  # 600 seconds = 10 minutes
 
if __name__ == "__main__":
    main()