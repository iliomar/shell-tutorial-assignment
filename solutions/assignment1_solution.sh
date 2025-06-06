#!/bin/bash

# 1. Unique particle types
echo "Unique particle types:"
tail -n +2 data/cosmic_flux_data.txt | cut -f3 | sort | uniq

# 2. Top 5 highest-energy events
echo -e "\nTop 5 highest energy events:"
tail -n +2 data/cosmic_flux_data.txt | sort -nr -k1,1 | head -5

# 3. Average flux for protons
echo -e "\nAverage proton flux:"
tail -n +2 data/cosmic_flux_data.txt | grep "proton" | awk '{sum += $2} END {print sum/NR}'

# 4. Extract electrons to new file
echo -e "\nSaving electrons to 'results/electron_flux.txt'..."
mkdir -p results
grep "electron" data/cosmic_flux_data.txt > results/electron_flux.txt
