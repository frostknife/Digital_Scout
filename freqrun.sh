/dev/ttyUSB0 #!/bin/bash
#freqscan: Digital Scout Survey Script
echo "freqscan: Digital Scout Frequency Survey Script"
echo "This script will collect frequency observations from the Digital Scout's serial port.(3.5mm)"
echo "Ensure Digital Scout is set to reaction tune, then turn device off."
echo "Start script, then turn device on."
echo "See 'Technical Notes: Optoelectronics Digital Scout Frequency Counter'"
echo "this script uses picocom.  Escape is CNTRL a then q"
#Author: Marc J O'Connor and the Communications Security Research Organization
#Contact: https://pastebin.com/nnxdkQAA 
#variables
#log-file creation
	dtg=$(date +"%d-%m-%Y-%H-%M-%S")
	freq_results=$dtg.freq_log.txt
	freq_capture=$freq_results
#awk variable for Hertz to Megahertz Conversion
a=1000000
#main
freqScan () {
touch "$freq_capture"
chmod a+rwx "$freq_capture"
picocom /dev/ttyUSB0 -b 9600 -r -l > "$freq_capture"
}
freqScan
