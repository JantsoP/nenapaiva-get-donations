# nenapaiva-get-donations
This script will get data directly from Nenäpäivä's page and write it to text file so it can be read in streaming softwares.


As they do not provide direct API (yet....) to get details from donation boxes, I made this small script to kind of do exactly that.
This script was written for Herbalisti's 30 hour live stream to get near live amount from Nenäpäivä page.
Script will download full source code of the page and then parse total amount donated to said box.


Script works with Linux and Windows.
For Windows you would need to install cygwin with following mods:
wget
cat
sed

After everything is done, it will generate text file which you can then input to your streaming software like OBS/XSplit/Wirecast/vMix and what have you.
Script will run every 30 secs so it wont stress the servers from Nenäpäivä.
