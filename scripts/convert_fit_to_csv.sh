#!/bin/bash
# Purpose: convert .fit files to .csv
# Author: Stephanie Koo
# TODO: add cleanup step to remove the 0 byte files.

raw_dir="D:/Documents/garmin_analysis/data_raw/activity"
processed_dir="D:/Documents/garmin_analysis/data_processed/activity"
for infile in "$raw_dir"/*.fit
do
    echo "$infile"
    outfile="${infile/${raw_dir}/${processed_dir}}"
    # Definition files are metadata
    outfile_defn="${outfile/.fit/_defn.csv}"
    outfile_records="${outfile/.fit/_records.csv}"
    echo $outfile
    if [ -f "$outfile" ]; then
        echo "CSV exists."
    else
        echo "Converting to CSV."
        java -jar 'C:/Users/Koo/Desktop/FitSDKRelease_21.101.00/java/FitCSVTool.jar' -b "${infile}" "${outfile_defn}" -e -re -se --data none
        java -jar 'C:/Users/Koo/Desktop/FitSDKRelease_21.101.00/java/FitCSVTool.jar' -b "${infile}" "${outfile_records}" -e -re -se --defn none --data record
    fi
done