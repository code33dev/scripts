import os
import subprocess

# Get the current username
user = os.getlogin()

# Command to back up the sudoers file
backup_cmd = ['sudo', 'cp', '/etc/sudoers', '/etc/sudoers.bak']

# Command to add the current user to sudoers for passwordless sudo
sudoers_entry = f"{user} ALL=(ALL) NOPASSWD:ALL\n"
add_sudoers_cmd = f'echo "{sudoers_entry}" | sudo tee /etc/sudoers.d/{user}'

# Command to set the correct permissions
chmod_cmd = ['sudo', 'chmod', '0440', f'/etc/sudoers.d/{user}']

# Backup the sudoers file
subprocess.run(backup_cmd)

# Add user to sudoers with NOPASSWD option
subprocess.run(add_sudoers_cmd, shell=True)

# Set correct permissions for the sudoers.d file
subprocess.run(chmod_cmd)

print(f"User {user} has been added to the sudoers file with passwordless sudo.")