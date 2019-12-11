#!/bin/bash
# Get all xml files in this directory and then run through xml2csv.py
#
# Delete original
rm cve-summary.csv

# Create new one
for i in `ls *.json | grep ""`; 
do
echo "[*] Parsing $i" 
python json2csv.py $i >> cve-summary.csv; 
done
