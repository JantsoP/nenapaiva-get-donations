#!/bin/bash

# Setting global variables
# Ask the user for their Nenäpäivä URL
echo "What Nenäpäivä page would you like to download? (Provide full URL)"
read nenapage
# Ask which filename they would like to save it
echo What would be the name of the saved webpage?
read pagename

# Create nenapaiva-files dir
echo Creating needed dirs.
mkdir nenapaiva-files
clear
echo All done. Starting script in 5 seconds.
sleep 5

# Lets loop this thing.
while :
do
    clear
    echo Wakey wakey, eggs and bakey
    echo
    echo
	echo Get Nenapaiva page
    echo
    echo
    wget $nenapage -O nenapaiva-files/$pagename
    echo Print webpage and then grab total sum of current donations
    echo
    echo
    echo Print result and then remove extra div after euro sign
    cat nenapaiva-files/$pagename | grep "€ </div>" > nenapaiva-files/stripped-sum.txt
    cat nenapaiva-files/stripped-sum.txt | cut -d "<" -f1 > nenapaiva-files/stripped-space.txt
    echo
    echo
    echo Remove extra space from end of line
    sed 's/[[:blank:]]*$//' nenapaiva-files/stripped-space.txt > donations.txt
    echo
    echo
    echo Print the result to console as well
    cat donations.txt
    echo
    echo
    echo I sleep now for 30 seconds. To stop this script, just press CTRL+C
	sleep 30
done
