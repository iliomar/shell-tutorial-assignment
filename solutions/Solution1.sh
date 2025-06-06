#!/bin/bash

# Navigate to results directory
echo " Navigate to results/ directory..."
cd results || { echo "results/ directory not found!"; exit 1; }

# Display number of unique particle types
echo "Counting unique particle types..."
unique_particles=$(tail -n +2 cosmic_flux_backup.txt | cut -f3 | sort | uniq | wc -l)
echo "There are $unique_particles unique particle types."

# List the top 5 highest-energy events
echo "Top 5 highest-energy events:"
echo "(Energy(GeV), Flux, Particle)"
tail -n +2 cosmic_flux_backup.txt | sort -k1,1nr | head -n 5

# Extract flux values for protons and compute average
echo "Calculating average flux for protons..."
avg_flux=$(awk '$3=="Proton" {sum+=$2; count++} END {if(count>0) print sum/count; else print 0}' cosmic_flux_backup.txt)
echo "Average flux for protons: $avg_flux"

# Create a new file with only electrons entries
echo "Creating file electrons_only.txt..."

# Copy header
head -n 1 cosmic_flux_backup.txt > electrons_only.txt

# Append electron entries
awk '$3=="Electron"' cosmic_flux_backup.txt >> electrons_only.txt

echo "All tasks complete. File electrons_only.txt created in results/."

# Return to repo root
cd ../..

