#!/bin/bash

#Navigate to the data directory
echo "Navigating to data/ directory..."
cd ../Problems/Problem1/data || { echo "data/ directory not found!"; exit 1; }

#List files to confirm dataset exists
echo "Listing files in data/:"
ls

#Inspect the file content (show first 5 lines)
echo "Displaying first 5 lines of cosmic_flux_data.txt:"
head -n 5 cosmic_flux_data.txt

#Go back to parent directory
echo "Returning to parent directory..."
cd ..

#Create results/ directory if it does not exist
echo "Creating results/ directory..."
mkdir -p results

#Copy dataset to results/
echo "Copying dataset to results/ folder..."
cp data/cosmic_flux_data.txt results/

#Move into results/ and rename the file
cd results || { echo "results/ directory not found!"; exit 1; }
echo "Renaming cosmic_flux_data.txt to cosmic_flux_backup.txt..."
mv cosmic_flux_data.txt cosmic_flux_backup.txt

#Count the lines including header
echo "Counting lines in cosmic_flux_backup.txt:"
wc -l cosmic_flux_backup.txt

#Return to repo root (assuming started from repo root)
echo "Returning to repo root directory..."
cd ../..

echo "Assignment 1 tasks complete."
