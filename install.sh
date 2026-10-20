#!/bin/bash
set -e

 echo "=================================================="
 echo " FREE Ubuntu VPS in GitHub Codespaces - Mint-style"
 echo "=================================================="

if [ ! -f options.json ]; then
  echo "No options.json found yet."
  echo "Run the installer GUI to generate your selection, then rebuild the container."
  exit 0
fi

echo "Current config:"
cat options.json

echo ""
echo "To build the container locally:"
echo "  docker build -t mint-vps ."
echo ""
echo "To run it with KasmVNC:"
echo "  docker run --rm -p 3000:3000 -v \$PWD:/config mint-vps"
