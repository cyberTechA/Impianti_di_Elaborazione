#!/bin/bash

# Number of times to restart WSL
num_restarts=1
save_path="/Users/raro69/Desktop/Impianti Alberto e Giuseppe/1_Benchmark/M1Pro_A/risultati_r_1_1000000.txt"

cd nbody/

for i in $(seq 1 $num_restarts); do
  # Run program
  bash ./launch_nbody.sh -r 1 -n 1000000 >> "$save_path"
done
