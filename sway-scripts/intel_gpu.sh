#! /bin/bash

GPU=$(sudo intel_gpu_top -l | head -n4 | tail -n1 | awk '{print $5 "%"}')
echo "IGPU ${GPU}"
