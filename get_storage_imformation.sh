#!/bin/bash
echo "Calculating"

size="$(df -h | awk ' NR==2 {print $2}')"
echo "Total size = $size"

available="$(df -h | awk ' NR==2 {print $4}')"
echo "Available size = $available"

echo "Thank You"