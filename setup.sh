#!/bin/bash

echo "Setting up the environment for Shell Tutorial Assignment..."

# Check for bash
if ! command -v bash &> /dev/null; then
    echo "Error: bash is not installed. Please install bash before continuing."
    exit 1
fi

# Make all solution scripts executable
chmod +x solutions/*.sh

# Create results directory if needed
if [ ! -d "results" ]; then
    mkdir results
fi

echo "Setup complete!"

echo ""
echo "To run an assignment solution, use:"
echo "  ./solutions/solution1.sh"
echo "  ./solutions/solution2.sh"
echo "  ./solutions/solution3.sh"
echo ""
echo "Feel free to edit and run the scripts with your own parameters."

