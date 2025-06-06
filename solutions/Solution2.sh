#!/bin/bash

# Navigate to results directory
echo "Navigate to results/ directory..."
cd results || { echo "results/ directory not found!"; exit 1; }

# Find number of unique particle types
echo "Counting unique particle types..."
unique_particles=$(tail -n +2 cosmic_flux_backup.txt | cut -f3 | sort | uniq | wc -l)
echo "There are $unique_particles unique particle types."

# Extract top 5 highest-energy events
echo "Top 5 highest-energy events:"
echo "(Energy(GeV), Flux, Particle)"
tail -n +2 cosmic_flux_backup.txt | sort -k1,1nr | head -n 5

# Calculate average flux for each particle type using a loop
echo "Step 4: Calculating average flux per particle type..."
particles=$(tail -n +2 cosmic_flux_backup.txt | cut -f3 | sort | uniq)

for particle in $particles; do
  avg_flux=$(awk -v p="$particle" 'BEGIN{sum=0;count=0} $3==p {sum+=$2; count++} END{if(count>0) print sum/count; else print 0}' cosmic_flux_backup.txt)
  echo "Average flux for $particle: $avg_flux"
done

# Create file with high-energy protons (>20 GeV)
echo "Creating high_energy_protons.txt for protons with Energy > 20 GeV..."

# Copy header first
head -n 1 cosmic_flux_backup.txt > high_energy_protons.txt

# Filter and append matching lines
awk 'NR>1 && $3=="Proton" && $1>20 {print}' cosmic_flux_backup.txt >> high_energy_protons.txt

echo "All tasks complete. File high_energy_protons.txt created in results/."

# Return to repo
cd ../..

