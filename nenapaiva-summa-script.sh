#!/bin/bash
clear
# Setting global variables
# Ask the user for their Nenäpäivä URL
echo "What Nenäpäivä page would you like to download?"
echo "Please provide only page ID. For example oaj"
read nettilipas

# Create nenapaiva-files dir
echo Creating needed dirs.
if [ -d "nenapaiva-files" ] 
then
    echo "Directory nenapaiva-files exists." 
else
    echo "Error: Directory nenapaiva-files does not exists. Creating it here"
    mkdir nenapaiva-files
fi
clear
echo All done. Starting script in 3 seconds.
sleep 3

# Lets loop this thing.
while :
do
    clear
    echo Lets goooooo
    echo
    echo
    echo Get Nenapaiva page
    wget https://nenapaiva.fi/nettilipas/$nettilipas -O nenapaiva-files/$nettilipas
    echo Print webpage and then grab total sum of current donations
    echo
    echo
    echo Parse the result
    cat nenapaiva-files/$nettilipas | grep '<span class="has-nenapaiva-red-color">' > nenapaiva-files/$nettilipas-parsed.txt
    # Remove extra HTML code which is not needed lol
    sed -i 's/<span class="has-nenapaiva-red-color">//g' nenapaiva-files/$nettilipas-parsed.txt
    # Remove tabs and spaces which are left because above command
    tabsremoved=$(sed -e 's/^[ \t]*//' nenapaiva-files/$nettilipas-parsed.txt)
    # Remove everything after the ammount
    extrasremoved=$(echo $tabsremoved | cut -d "&" -f1 > nenapaiva-files/donations.txt)
    # Add missing € to end of the line
    sed -i s/$/€/ nenapaiva-files/donations.txt
    clear
    echo Total donations in $nettilipas nettilipas
    cat nenapaiva-files/donations.txt
    echo
    echo
    echo I sleep now for 30 seconds. To stop this script, just press CTRL+C
    sleep 30
done
