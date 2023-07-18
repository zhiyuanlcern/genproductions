#!/bin/bash

# Define the directory where your files are stored
DIR="./"

# Loop over all items starting with ZHtoZhh_mH or WHtoWhh_mH in the directory
for item in "$DIR"/{ZHtoZhh_mH*,WHtoWhh_mH*}; do
  # If the item is a directory
  if [ -d "$item" ]; then
    # Extract the base name of the directory (without path)
    base=$(basename "$item")
    # Check if the tarball for this directory exists
    if [ ! -f "$DIR/$base"_slc7_amd64_gcc10_CMSSW_12_4_8_tarball.tar.xz ]; then
      # If the tarball does not exist, delete the directory
      echo "Deleting $item because the tarball does not exist"
      mv "$item" delete
    # echo "$item"
    fi
  fi
done


dir="cards/production/2017/13TeV/VHV"
max_jobs=3
count=0


for folder in $(ls $dir);
do
    if [[ $folder == WHtoWhh_mH* ]] || [[ $folder == ZHtoZhh_mH* ]];
    then
       # Check if the tarball for this directory exists
       if [ ! -f "$folder"_slc7_amd64_gcc10_CMSSW_12_4_8_tarball.tar.xz ]; then
          # If the tarball does not exist, run the gridpack generation script
          echo ""$folder"_slc7_amd64_gcc10_CMSSW_12_4_8_tarball.tar.xz doesn't exist, run the gridpack generation script" 
        #   echo "source gridpack_generation.sh $folder $dir/$folder local ALL slc7_amd64_gcc10 CMSSW_12_4_8"
          echo -e "\n" | source gridpack_generation.sh $folder $dir/$folder local ALL slc7_amd64_gcc10 CMSSW_12_4_8 &
          ((count++))

          # Job control: wait if there are already max_jobs running in the background
          if (( count % max_jobs == 0 )); then
              wait
          fi
       fi
    fi
done

# Wait for all remaining background jobs to finish
wait
