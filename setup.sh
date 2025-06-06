#!/bin/bash

echo "Setting up your shell-tutorial-assignment environment..."

# Create required directories
mkdir -p data
mkdir -p problems
mkdir -p solutions
mkdir -p results
mkdir -p simulation_logs  # For Problem 3

# Create sample cosmic ray CSV for Problem 1
cat <<EOF > data/cosmic_rays.csv
particle_type,energy_GeV,flux
proton,10,150
electron,5,80
proton,20,210
muon,15,40
electron,12,100
EOF

# Create sample simulation log files for Problem 3
for i in {1..3}; do
  cat <<EOF > simulation_logs/run_${i}.log
INFO: Simulation started for run ${i}
WARNING: Minor issue detected in run ${i}
ERROR: Something went wrong in run ${i}
INFO: Simulation completed for run ${i}
EOF
done

echo "Directories and sample data created!"
echo "Created: data/, problems/, solutions/, results/, simulation_logs/"
echo "Sample files: data/cosmic_rays.csv and 3 simulation_logs/run_*.log files"
echo "You're ready to start working on the assignments! "

echo "Setting up the environment for Shell Tutorial Assignment..."
