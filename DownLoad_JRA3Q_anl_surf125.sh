#!/bin/bash

opts="-N"
cert_opt="--no-check-certificate"

# Loop through the years 1948 to 1978
for year in {1948..2023}
do
    # Loop through each month
    for month in {01..12}
    do
        # Construct the month_year string used in the base URL
        month_year="${year}${month}"
        base_url="https://data.rda.ucar.edu/ds640.0/anl_surf125/${month_year}"

        # Define all variable codes and their respective GRIB variable names
        variables=(
            "0_0_0.tmp2m-hgt-an-ll125" "0_0_2.pot-sfc-an-ll125" \
            "0_0_7.depr2m-hgt-an-ll125" "0_194_6.snleng-sfc-an-ll125" \
            "0_194_7.snlh2o-sfc-an-ll125" "0_1_0.spfh2m-hgt-an-ll125" \
            "0_1_1.rh2m-hgt-an-ll125" "0_1_13.weasd-sfc-an-ll125" \
            "0_1_64.tciwv-col-an-ll125" \
            "0_3_0.pres-sfc-an-ll125" \
            "0_2_3.vgrd10m-hgt-an-ll125" "0_2_2.ugrd10m-hgt-an-ll125" \
            "0_3_1.prmsl-msl-an-ll125"
        )

        # Determine the end day of the month to handle February and leap years
        if [ "$month" == "02" ]; then
            if ((year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))); then
                end_day="29" # Leap year February
            else
                end_day="28" # Non-leap year February
            fi
        elif [[ "$month" == "04" || "$month" == "06" || "$month" == "09" || "$month" == "11" ]]; then
            end_day="30"
        else
            end_day="31"
        fi

        # Loop through each variable code
        for var in "${variables[@]}"
        do
            start_time="${year}${month}0100"
            end_time="${year}${month}${end_day}18"
            file_name="jra3q.anl_surf125.${var}.${start_time}_${end_time}.nc"

            # Check if the file already exists and is not empty
            if [ -f "$file_name" ] && [ -s "$file_name" ]; then
                echo "File $file_name already exists and is not empty. Skipping download."
            else
                echo "Downloading $file_name..."
                # Download the file
                wget $cert_opt $opts $base_url/$file_name
            fi
        done
    done
done
