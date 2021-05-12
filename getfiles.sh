#!/bin/bash
#Delete existing json files
rm *.json;

#Wget the nist downloads page to get all of the 2.0 version XML urls
for url in `wget -qO- https://nvd.nist.gov/vuln/data-feeds | grep /feeds/json/cve/1.1/nvdcve-1.1-.*json.zip |  grep -Eo "/\S+?\.json.zip"`; 
do 
wget https://nvd.nist.gov$url 
done

for file in `ls *.json.zip | grep ""`
do
unzip $file
rm $file
done
