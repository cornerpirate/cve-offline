#!/usr/bin/python
import sys
import csv 
import argparse
import ijson 

csvwriter = csv.writer(sys.stdout)

with open(sys.argv[1], 'rb') as input_file:
	cves = ijson.items(input_file, 'CVE_Items.item')
	for cve in cves:
		#print cve

		id = cve['cve']['CVE_data_meta']['ID']
		desc = cve['cve']['description']['description_data'][0]['value']
		severity = "Unknown"
		try:
			severity = cve['impact']['baseMetricV2']['severity']
		except:
			a = 'a'

		row = [ str(id), str(severity), str(desc) ]
		csvwriter = csv.writer(sys.stdout)
		csvwriter.writerow( row )
