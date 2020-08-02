#!/usr/bin/env sh
set -e
set -o pipefail

# Main function starts at: Line xx
printf '\e[8;14;100t'
conf=""
type=""
script=""
# This captures script argument.
while getopts c:t:s: flag
do
    case "${flag}" in
        c) conf=${OPTARG};;
        t) type=${OPTARG};;
        s) script=${OPTARG};;
        *) echo "Illegal option: ${flag}"
    esac
done

if test -z "$conf" 
then
    echo "\$conf is NULL."
else
    echo "\$conf is NOT NULL."
fi

# Function Declaration:
    # This check if a command is available - in this case, jq.
    # Required for JSON parse from GitHub API.
check_if_command_exists() {
    for i in $1
    do
    type -P $i &>/dev/null && continue || { echo "$i command not found."; exit 1; }
    done
}

example_output() {
    echo "Example output: ./main.sh -c Debug -g Beta -s 1 -v"
    echo "\t-c:Configuration. Debug or Release or Both versions of kexts."
    echo "\t-t:Type of kext: Beta or Release or Both versions of kexts."
    echo "\t Beta will download the kext source code and compile (requires Xcode), while"
    echo "\t Release will download the kext pre-compiled binary from GitHub."
    echo "\t-s:Script type: 1 will update whatever you have in EFI\OC\Kexts or"
    echo "\t EFI\CLOVER\Kexts\Other."
    echo ""
    echo "(You are required to present all 3 arguments to the script. I'm not a feeling"
    echo " guesser so I can't write default behaviour)."
    echo "\t-v:"
    printf '\e[8;24;80t'
    exit 1;
}
echo ${conf} | tr '[:upper:]' '[:lower:]'

if [[ "${conf}" == "debug" ]];then
{
    
}
else if [[ "${conf}" == "release" ]]; then
{

}
else if [[ "${conf}" == "both"]]; then
{

}
fi

while true; do
    echo " 	ACPIBacklight"
    echo " ACPIBatteryManager"
    echo " ALXEthernet"
    echo " ATH9KFixup"
    echo " AirportBrcmFixup"
    echo "[ ] 1. AppleALC"
    echo " USBInjectall"
    echo " XHCI-Unsupported"

    echo "[ ] 2. Lilu"
    echo "[ ] 3. OpenCorePkg"
    echo "[ ] 3. WhateverGreen"
done
dir="${0%/*}"
CMDS="jq"
check_if_command_exists $CMDS

echo "$CMDS command is available. Continuing."

cd "$dir/Lilu_Beta"
#"$dir"/Lilu_Beta.sh
cd ../

cd "$dir/Lilu"
#"$dir"/Lilu.sh
cd ../

cd "$dir/AppleALC_Beta"
#"$dir"/AppleALC_Beta.sh
cd ../

cd "$dir/AppleALC"
#"$dir"/AppleALC.sh
cd ../

cd "$dir/WhateverGreen_Beta"
#"$dir"/WhateverGreen_Beta.sh
cd ../

cd "$dir/WhateverGreen"
#"$dir"/WhateverGreen.sh
cd ../


printf '\e[8;24;80t'

