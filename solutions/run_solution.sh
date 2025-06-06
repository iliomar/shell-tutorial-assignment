#!/bin/bash

echo "To make all solutions executable"

# Check for bash
if ! command -v bash &> /dev/null; then
    echo "Error: bash is not installed. Please install bash before continuing."
    exit 1   
fi

# Make all solution scripts executable
chmod +x solutions/*.sh

echo "Setup complete!"

echo ""
echo "To run an assignment solution, use:"
echo "  ./solutions/Solution1.sh"
echo "  ./solutions/Solution2.sh"
echo "  ./solutions/Solution3.sh"
echo ""
echo "Feel free to edit and run the scripts with your own parameters."
