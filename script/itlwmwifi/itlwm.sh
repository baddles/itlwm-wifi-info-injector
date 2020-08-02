#!/usr/bin/env python3

#  itlwm.sh
#  
#
#  Created by Baddles Nguyen on 7/8/20.
#  

import argparse
from pathlib import Path
import getpass
import plistlib
import subprocess
import os
try:
    import keyboard
    print("Keyboard as package found!") # Green.
except Exception as e:
    # Please remember to color format this!
    print("Cannot find keyboard package!\nPlease install it by typing this command in terminal:\n\"sudo pip3 install keyboard\" (without quotes)!") # Red.
    quit()

# To do:
#   - Add command differentiation prefix (-l and --location).
#   - Look for a switch between argparse and the other argument parser for argc & user-friendliness.
#   - Switch from os.system for copying files to PathLib.
#   - Get and compile itlwm from Source.
#   - Color-formatting necessary print lines.

parser = argparse.ArgumentParser(description='Change info.plist inside itlwm.kext to add a new wifi information and load the kext if user wanted to.')
parser.add_argument("location", help="Your itlwm.kext location.") # (Or itlwm.xcodeproj) location. Will compile from GitHub if this argument is not provided or compile from .xcodeproj if that was provided instead and Xcode is a requirement in this case.") # -l --location
parser.add_argument("ssid", help="Your wifi name.") # Will load the kext if this argument is not provided.")
    # Optional Argument - Because the user might want to only load the kext. -s --ssid
parser.add_argument("password", help="Your wifi password.") # Invalid script usage when this argument is not provided alongside with the ssid argument.")
    # Optional Argument - It can be blank. -p --password

# Prerequisites: These were put here for future use, including functions or variables
# Variables:
args = parser.parse_args();
print(len(args))
p = Path(args.location)
scriptPath = os.path.dirname(os.path.realpath(__file__))
x = ""
if args.location[0] == '~':
    x += "/Users/" + getpass.getuser() + args.location[1:len(args.location)]
else:
    x = args.location
kext = Path(x) # Reserved for later use when we need itlwm.kext.
p = Path(x)
# Functions:

# check()
    # Step 1: Check if Xcode is installed and at least version corresponding to 10.14 (Because maximum Xcode version for 10.13 cannot load project).
    # If Xcode not found:
        # 1.1: Warn that Xcode is not found or Xcode version needs to be > macOS 10.14 minimum equivalent version of Xcode.
        # 1.2: quit()
# function ends.
def check():
	

# backup()
    # Step 2: Check if already exists:
    # 2.1: itlwm.kext in: ~/Library/Developer/Xcode/DerivedData/itlwm-?/Build/Products/Debug/itlwm.kext. If true: Ask if they want to get new or use that.
        # 2.1.1: Use that -> Step 6.
        # 2.1.2: Don't use that -> Ask if they want to backup info.plist to retain their wifi info:
            # 2.1.2.1: if True: Backup: Copy that into script's location.
    # 2.2: itlwm project folder in the same location as scripts folder. If true: Ask if they want to use that or get new from GitHub.
        # 2.2.1:
            # Use that: -> Step 4.
            # Don't use that -> Inside the project, there's an info.plist that the user, if they don't use this script, can use that before they compile to add their wifi info. Therefore, we ask if you want to backup the info.plist inside there
            # 2.2.2.1: If true: Check if there is another backup from 2.1.2.1:
                # 2.2.2.1.1: If true: Check difference between 2 files:
                    # If there are no difference then use either.
                    # If there are differences: Asks which one would they want to preserve.
                        # A.
                        # B.
                        # Both (By merging):
                            # sameKeys: tuple<id: string, wifi<ssid: string, password: string>>
                            # differentKeys: <ssid: string, password: string>
                            # 1. Scan file 1 to get ssid:
                                # while (not end of the list):
                                    # add wifi info into sameKeys.
                            # 2. Scan file 2 and rule out scenarios:
                                # while (not end of the list):
                                    # if (id existed in sameKeys):
                                        # if (ssid is the same):
                                            # if (password is not the same):
                                                # asks which one to keep? 1 OR 2.
                                        # else: (ssid is not the same):
                                            # add 2.wifi into differentKeys.
                                            # add 1.wifi into differentKeys.
                                            # remove 1 entirely from sameKeys.
                                    # else: (id did not exist in sameKeys):
                                        # add wifi info into sameKeys.
# function ends.

# get() # For Scenario 1.2 and 3.
    # Step 3: git clone.
# function ends.

# compile()

# add()

# ask()

# load()


# There are a number of scenarios that can happen in user-end when interacting with the script:
    # 1. No argument:
        # 1.1. User wants to show help.
        # 1.2. User wants to compile and load the kext in its original state (no edit to info.plist).
        # 1.3. User wants to quit.
    # 2. Location-only argument: User wants to load the kext from source.
    # 3. ssid-only argument: It's actually a combination of 1.2 and 4.
    # 4. Location + ssid argument: User wants to edit the info.plist to add the info of their new shiny wifi - Totally not in 1/4096 chance.
    # 5. Invalid argument - Which is password-only.
# Scenario 1:
# while True:
    # print("No argument was provided. This either means that you want to show help or compile from source without doing anything else.")
    # print("1. Show help.")
    # print("2. Compile kext from source (without adding any wifi name to the info.plist).")
    # print("3. Quit script.")
    # print("Your option: ")
    # if keyboard.is_pressed('1'):
    #    show help
    #    quit()
    # elif keyboard.is_pressed('2'):
    #
    #    break
    # elif keyboard.is_pressed('3'):
    #    print("Alrighty, quitting.")
    #    quit()
    # else:
    #   print("Invalid input! Please try again.") # Red
# Scenario 2:
# os.system("kextload -v " + kext)
# Scenario 3:
# Scenario 4:
if p.exists() == False:
    print(p)
    print("Invalid path! Exiting script...")
    quit()
print("Given path is valid path!")
# Now we parse the info.plist!
if args.location[len(args.location) -1] != '/':
    x += "/Contents/info.plist"
    plist = Path(x)
else:
    x += "Contents/info.plist"
    plist = Path(x)
if (p.exists() == False):
    print("info.plist not found! Exiting script...")
    quit()
returncode = subprocess.call(["/usr/bin/sudo", "/usr/bin/id"])
if returncode == 1:
    print("Sudo did not get initialized! Quitting...")
    quit()
# You have to copy the damn info.plist to another location (e.g. Script location) in order to even edit it. Typical permission thingy.
os.system("cp " + x + " " + scriptPath)
# Now, read the plist:
with open(str(scriptPath) + '/info.plist', 'r+b') as pl:
    readPlist = plistlib.load(pl)
i = 1 # itlwm counts from 1 (but I really want it to count from 0).
found = False
# Iterates through the list of items to check if ssid exists. If so, change the password.
for item in readPlist["IOKitPersonalities"]["itlwm"]["WiFiConfig"].items():
    if item[1]["ssid"] == args.ssid:
        item[1]["password"] = args.password
        found = True
        break
if found == False:
    print("ssid name not found in list. Iterating through list to prevent duplication of items.")
    while True:
        try:
            s = "WiFi_" + str(i) # This is the default naming scheme. We're editing based on this.
            print(readPlist["IOKitPersonalities"]["itlwm"]["WiFiConfig"][s])
            i = i + 1
        # To a certain point, it doesn't exists and an attempt to print it causes a KeyError. We catch that KeyError and add the info of the user-inputted Wifi name.
        except KeyError as e: # This is the only thing that prevents the script to work.
            # Parses the new info.
            info = dict(
                s = dict(
                    password = args.password,
                    ssid = args.ssid
                )
            )
            plistlib.dump(readPlist["IOKitPersonalities"]["itlwm"]["WiFiConfig"], info)
            # THIS STILL DOESN'T WORK PROPERLY!
            break
# After edit, put it back to the place
os.system("cp -R "+ scriptPath + "/info.plist " + x)
# Remember to change the permission of the kext.
os.system("chown -R root:wheel " + kext)
# Delete the temp info.plist after copying.
os.system("rm -rf " + scriptPath + "/info.plist")
while True:
    # Ask if user wants to load kext? y/n button input
    print("Do you want to load kext? (y/n): ")
    # If it's a yes then load, no then don't, any other key, invalid.
    if keyboard.is_pressed('y'):
        os.system("kextload -v " + kext)
        break;
    elif  keyboard.is_pressed('n'):
        break;
    else:
        print("Invalid input! Please try again.")
# And we are done with the script.
